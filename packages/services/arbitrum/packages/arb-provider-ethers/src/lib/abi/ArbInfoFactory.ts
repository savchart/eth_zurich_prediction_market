/* Generated by ts-generator ver. 0.0.8 */
/* tslint:disable */

import { Contract, ContractFactory, Signer } from 'ethers'
import { Provider } from 'ethers/providers'
import { UnsignedTransaction } from 'ethers/utils/transaction'

import { TransactionOverrides } from '.'
import { ArbInfo } from './ArbInfo'

export class ArbInfoFactory extends ContractFactory {
  constructor(signer?: Signer) {
    super(_abi, _bytecode, signer)
  }

  deploy(overrides?: TransactionOverrides): Promise<ArbInfo> {
    return super.deploy(overrides) as Promise<ArbInfo>
  }
  getDeployTransaction(overrides?: TransactionOverrides): UnsignedTransaction {
    return super.getDeployTransaction(overrides)
  }
  attach(address: string): ArbInfo {
    return super.attach(address) as ArbInfo
  }
  connect(signer: Signer): ArbInfoFactory {
    return super.connect(signer) as ArbInfoFactory
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): ArbInfo {
    return new Contract(address, _abi, signerOrProvider) as ArbInfo
  }
}

const _abi = [
  {
    constant: true,
    inputs: [
      {
        internalType: 'address',
        name: 'account',
        type: 'address',
      },
    ],
    name: 'getBalance',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    payable: false,
    stateMutability: 'view',
    type: 'function',
  },
  {
    constant: true,
    inputs: [
      {
        internalType: 'address',
        name: 'account',
        type: 'address',
      },
    ],
    name: 'getCode',
    outputs: [
      {
        internalType: 'bytes',
        name: '',
        type: 'bytes',
      },
    ],
    payable: false,
    stateMutability: 'view',
    type: 'function',
  },
]

const _bytecode =
  '0x608060405234801561001057600080fd5b50610198806100206000396000f3fe608060405234801561001057600080fd5b50600436106100365760003560e01c80637e105ce21461003b578063f8b2cb4f146100d6575b600080fd5b6100616004803603602081101561005157600080fd5b50356001600160a01b031661010e565b6040805160208082528351818301528351919283929083019185019080838360005b8381101561009b578181015183820152602001610083565b50505050905090810190601f1680156100c85780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b6100fc600480360360208110156100ec57600080fd5b50356001600160a01b0316610156565b60408051918252519081900360200190f35b60606000823b90506060816040519080825280601f01601f191660200182016040528015610143576020820181803883390190505b50905081600060208301863c9392505050565b6001600160a01b0316319056fea265627a7a72315820b4b2b581a87ed83f4c54ac7d7feee5e27e2e48836e69eb7ce79d80c96e26a5bc64736f6c63430005110032'