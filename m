Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982A16B2E00
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 20:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjCIT5G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 14:57:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjCIT5E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 14:57:04 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34B8F9D26
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 11:57:02 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329JooaS025246;
        Thu, 9 Mar 2023 11:56:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Gf3afA4ZPbsVw7rKtRDD/htKUfdSEnSJTEOjexMn5Ow=;
 b=qwGpyfuMOqKt3ZX79TZfZGKMuNKH27nE2SeBvYT48Mrkf4Pghp3kY4kfXPgyh4PFqlT3
 U5YJVt46eZxtuaueQST85FN+IwyCYJfWtaUBaDjYENGbPwVwrMEbYVpHpQCVYy1Ud/b1
 /dEHrqN/pXxbfIXBvbwP/k/bKxMrhqHRbXGaqAza6w13T16PdZlvypA/N05nPIilXOkh
 KLdgAEfsXuhwvZBAsW6GfUms8jCzglNqss0gcqBCddwU1lUmCx4i28R6rskGrCBKHic+
 M2N+kFgbo/W7EXcIjwLU0nXCWy6g8YDVFxqh2jfWeZL3DhG3pdKycGsG4fkPlpHn9gFY gA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3p6femsdnj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Mar 2023 11:56:49 -0800
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 22E5B40102;
        Thu,  9 Mar 2023 19:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1678391807; bh=Gf3afA4ZPbsVw7rKtRDD/htKUfdSEnSJTEOjexMn5Ow=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=eiJTmhareva8whZLvg/gibZepEc7wKgaNk7JyaxyCMBn9m/TRPUH0PLt5ixCVIYt4
         TuK3Hty2fcdEsbHICn369VKrrPxIkbwXFx1Ep39x4bMd607KaE6pxqs7xxLwI7RFCT
         Y1lZv39iWlGOjJQQkEaadQ3BdDAWIkzSOMPYXnarG3BlxNNc1DG9AEal/aAoBhY8Bf
         kDUq/ZPL3iThzy65dR2JDeZ1Cq+2kU7Cgg11lEtRXtgH+Rb9VEUfsMYu+JiZPcJ2FB
         F3zLEnBiFY95hv3s+9pYNMli2H2rGFaZDty5XPsSRgfONt9OO5a2XIPFxgcZCk4XNg
         aRwMwq3VOZ3Yg==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 71BF4A0062;
        Thu,  9 Mar 2023 19:56:46 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id BF38AA04C0;
        Thu,  9 Mar 2023 19:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF+HKXTeFEAn5pDsNMgBCMukRSEXIUcUOB5sc/YSw5E60KEncYBvaEMyNlxzDej8deChU/PLR4bxXtjUp93c/isOaC1+SHOJqT83G6jhrLigBr1v8ULNPbZ/hFLkdPAh6/u6zEn18EjQM8OEIQUYFQtF2+y+gXFWegfMNSEEAQGDhQsnweo3RNOhkTTQuFL6mGl+Lgt+Hil/tjB35TlCRxaDeZ8tj8D5PHLRdBfeOurd1/U3s+L2M7JCHEpXj0hS5fwv8iocgIMIWRkv03ZjZh0QkNU5CcoxpOWmKo3BuiRzAsDkLxWy3yuXHcR79m9S/TgRGPMyx16IsOGlV5mNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf3afA4ZPbsVw7rKtRDD/htKUfdSEnSJTEOjexMn5Ow=;
 b=X89JSPWlgMaXdiuY6LLfmA20dmnScY7EAX6qVqWHSinlJzxhe0+h0SnzpuHt592OUj2gkTm+0M0FZsyFuSB2IP0zCYL+Q4CM9ACAucJw4toe2PRjXMgAHblg2VUMEfQXNnbEXHnKJDzARL1hquf41fDQVxW1iDr2GJRND54pINyZYgK6FOmSRhoxFPBaTLrQjuxZQIJ03UbuY5akb3ECorgJ7Kn0TzEJcUOJNc8YEf0SJI30+vDxbjWF5Yv/N04CsC7dpu4Vg3BUv2POyERT5VqBg0VrF0fhtVWHGKYqiz7l4X3cqcZQJDgJlif+T1VWh4eFnU1603lLz/35GU27iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf3afA4ZPbsVw7rKtRDD/htKUfdSEnSJTEOjexMn5Ow=;
 b=G0KGETnnW4yx3dSTfLlytl5AxZkON/LmFXoST2bs68pGofQ3N0CB8GIOL/3BXLuGKqsHvTH1U2FT6dMYvxLSmKCSdO/Ef5EqDhSwSfSAYJOb6R2tnchm0b/7+iAhTJ4Dm1eIG0TNwI11ZeFddH2MHP5+Tp3gljMRE34D8ec2vB4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH3PR12MB7761.namprd12.prod.outlook.com (2603:10b6:610:14e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 19:56:42 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 19:56:42 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUAgAE//gCAAAYfAIAAMwIA
Date:   Thu, 9 Mar 2023 19:56:42 +0000
Message-ID: <20230309195634.e4r5fjbqtycwt4dq@synopsys.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
 <ZAjE+p4IoXk/kvXu@kroah.com>
 <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
 <ZAja0So7EDH5FfI0@kroah.com>
 <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
 <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
 <4f6fa0c5f077c01c7fb5b15667d061ffa81af8ea.camel@infinera.com>
In-Reply-To: <4f6fa0c5f077c01c7fb5b15667d061ffa81af8ea.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH3PR12MB7761:EE_
x-ms-office365-filtering-correlation-id: 0087e2df-c3eb-4d6f-193c-08db20d8675c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K7HT5RAsJYbIBXfPySX13aI5PBG4ATYC+sGnA8N9fEwe5IQBrjA0tWPUU/sbnvTvst25NUNrJg0FaXuzrgdLwXVH/jiHcKwWM6G2sfe+XIbb3eW2/kj64g9fMLHeelB3n9dxIK/Uum+MPg1NRVG37zIiyLjScW6Jra5UGbUPnOxEUO1OJfFTZLbD0T/RI47zc3ksJO8T0g92iNk4Z+1yqTjURD36+1BszClh2f2IWxoGGLjMrgLUXjIUWjkE035Mki4z6J3TP3c9LQua103BA+PMc27Xe6evPRopsBlSHnHZV1vtTVqmKlBpNjwp3+jhWnppouTyTWgIT7e7HkvfCoLDpUjnAvIdvVNOV/E22JSAHGe/153EC/+1tIoc0Uzp2bbZpmjEFY68dT+fFwvw8D6SJpw2yAXNZpYTcIZ2Yf5pJZ/O6wLoLucT1jvODu6FCXVOH4Ezfd9oOGWR683Ypqz5kBeX1Ui9PDXKFf4Lti8RNtzFMlNnARnYHCG2bgeS6KCfp3KQOfFylrncYH0BlrT4liwDr7KrDi+gipbNtUQyU4CoEXvZE/fjXdnYPj2Y8JnEKec2VMMWLzWKtnl+xSYNO///wI4/zXRc0r2NbsFMxdSf7Nopx1qTa841fDpXWKQ0gzHKmcoukGVX9DoOlE8O8IhWXDAQK7n30tdeUxZZFh62fQJCY9r0eYO+l5B/QabyMp5HdvyI8tYL8S2v6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199018)(38100700002)(478600001)(122000001)(83380400001)(36756003)(186003)(316002)(2906002)(71200400001)(2616005)(38070700005)(26005)(6506007)(6512007)(1076003)(54906003)(76116006)(5660300002)(66946007)(4326008)(66446008)(64756008)(66556008)(6916009)(66476007)(8676002)(8936002)(6486002)(86362001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlBGYld3WGJwanJlSkZFYkJKRnJDVml6UlV4dC9RSm01emRySUxBQlZXS0Rp?=
 =?utf-8?B?QTNJOGlRcGgwVmMwL281NS9kbkFPNFdtSWVFd0FrRnd2VVpyUGF2d3VCczdl?=
 =?utf-8?B?U1dwYzBTOG1qcjEzNWtONUtDV2FpdUQ4QXEzeCtZNUlBSWcxQnNtNUxkSGJL?=
 =?utf-8?B?RFg1VGtvUWxVdXFMZDltajVHbXJYUk52UzhhVlhDMitsM0ZOaU90YzlKbmRp?=
 =?utf-8?B?cURmN1lhaHdlWmsrc0FVWlNrR0FjNWExRXBaRHJ0UkRDTEtnbGRLMUlwR25z?=
 =?utf-8?B?QlZGQlNEYWdBdnhsOU9HQkFsYy9aellJOG13b1J5RXZRNTcvWE4yRFJISHlM?=
 =?utf-8?B?Z2xtY3VQRFZ3eVNaaVRGdVBTTmkxbDJHdzJiSXdvZnJMNjUyWnJNdmlKTmhB?=
 =?utf-8?B?VFBtaG82cXdBaDcxM3o2TWFxN3Jvb3hMQkxMeTNid05EQmd2OThDNmZic001?=
 =?utf-8?B?NlM1cnhZN2RibjVpZEhXWGhWQUNLZTVGeVpnUFYwZG1kK2VTRWJsQ3E1VmdF?=
 =?utf-8?B?YTdZa1BFME8raHEyUWJJSjVqY0QwSllmM2U1enJ0ZmFPbVpVYkhFbitlVlMy?=
 =?utf-8?B?M1BIaG9TRUVWaEFDeWYxdFlqQWFOamdBNXZ6WDl6SWUwbzdrOXBUMlZ4VU9i?=
 =?utf-8?B?VzRnc1ZtZVJ4dFgzRGt4MXhrR3o3eElnOEdmQmtYU3l2b2tzNXk4VWVSVyt6?=
 =?utf-8?B?T25zQXQ2MklzRTg0SFNoMUZ5VTdPNDZKOXZWVFc3aE9manA1cWFraDdBRzVr?=
 =?utf-8?B?bWtkSXJtdllYK1UwQUdWWDE1ZWpma3Z3S2FZdFYvKy92cW1SdkIrNEpZelFG?=
 =?utf-8?B?THZNVFpuQ084bjh0Z2NNekQyWnUxRDRPckFNTFFoaFJqamJ5UTZJTVRNbU5J?=
 =?utf-8?B?QkpObFFmL2ZyZm94K2xEWGxQQmhuQnZxNzhXaE95aklYUllPT2RBYk41bnRU?=
 =?utf-8?B?SERBT29ScWR3b1hILy9yVlExTjBjN1N0ZzBjRDJ5R1hZODJIaFFnNTA4bU9H?=
 =?utf-8?B?UUNGOWI4d2R6cDJyUkEvRFRQN09SOTFldGFZSzFSemg5SkZud096VjU1QVB5?=
 =?utf-8?B?enpMWXYwb25YaktGUnRqeG1KM1daMUd5SFhGWUc2TG1UMlBoOVFWMmp0TThN?=
 =?utf-8?B?SWV2VFJQbDJ1TElzdll6UzZDbmlvVVVzclRnbTN3UmYreDNwOHkxMzRmOXpa?=
 =?utf-8?B?blVjU3kycUNVcEFYRXFlQWhQOWxMbmwxemtmN296Rm5CeVZCemhLS3ZXcnBt?=
 =?utf-8?B?L214RXV6dGpLT05FNlNWaHFCaXAwMDd2MlRzUXowQk5hQ3F4S1VjcEFJelV1?=
 =?utf-8?B?K0d5SVFoazNHWXF4WktPeGMyQkYwbFl1RWpJZUl2Mi8ydmhyekNyV0tLc083?=
 =?utf-8?B?UXAvemNzZlBGOHRDNEU3YWIrOC9jWDNNT1lBZEJ6WERhTXVHNlRQbC8ySDFJ?=
 =?utf-8?B?alpkTFhZR2ZXc1pRYWtYR1VLK21YVkIwYkVPRzZLNWRJT2w2NHdLZjJHdmRX?=
 =?utf-8?B?ZTBvS054cWdZb3FoMXkvdzNmdDNkeGhJcW1PVU55RkIxK29qYUMvUjhZNzJ2?=
 =?utf-8?B?LzkrY3hHK1BuTlY4S1lNVkFIazYzckVQUWNnR25qWnJ6eEE3VGE0L1hId1Vt?=
 =?utf-8?B?bWEzaHhTdFZVTm1udTZ1MDJyVEg5RzdKaWh6aHBFVDJOczFyN3lwY0xQQXRQ?=
 =?utf-8?B?M2dBQXdZMmxLbkdCWjdISjVwVDFaT0hBcWdxQUJIZ1NwcEtkZ0pkN2hXSVhs?=
 =?utf-8?B?bjZ5ejJWM0l4ZENtOVZpc2t3MkdyN3ROTHdjdHc1dzd4TVhISWZveUxhMHlr?=
 =?utf-8?B?YitWK2Mrb1NhcnJJYWlSaWMzRm12UG8yZGQ3cGR2MjhwNCtRRXd6WVpVdEs0?=
 =?utf-8?B?OTd4d3VOa25GSzNXNkJIeWM2bWw2ekRrZm1oWE5rMDhEWlUvUGtKV3hhanlS?=
 =?utf-8?B?UFBNN2pNdG9rQnFsSVFpWER3YXJXRnFYcUhtY3I3Z3ljMC94dllkNU5Lbjcv?=
 =?utf-8?B?NlVmbjNOeHF2Nlh6aFI5ZkNrN2FaUEQ0SEx3dy9ETWluUmh4cVRUV1A0Q05m?=
 =?utf-8?B?aGdWQjVqL2lId2dWZjZIYjM5RmFmR2ZRSzU5VkZyMy9SdGQ5cFByU0dxc1FQ?=
 =?utf-8?Q?2KIzoFNu4n8rI4GznvSExFZli?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB341A7B252EC24AAABAF45D9FB7DE08@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: s5doFsQ+Osi/eko8fCpc/BtBkGdw+rg8NHVri+JbMZth4QK0j5vyjIsObYX60eX3BDs+XJDJDRz/ES7HMD7+4R5pENxrdeklMuWkh7Jfi/FKREcUYmxw37uz5CAcVRkbkgJeG3mqLs8pcwntu69/pj2suv/ryU3IfiGeeIH23SSHSyGFufz3gapu2kazM1yuLrcsRBKsCPKmpcoGRWTOvJ5Fyx/IzLahsL7hdMjD1ifEpM16GpTc++iL5bSMUeY8loXbzAIT3gIYfK4GHuNFcsSLiVOuRy4hM8hDcsK6tiwMCSbhIu4Nzd4sXxGiomq7es1GNqp2m6ELA0OlqKoqIJbTpRLm5UEMRpCldckGc8XjxTOVMqu+fFIr8gj0Qym9P0VV3FermYu3J3NS3/AOOhKl0SXRjdbwZrQs4lBt0JtGPsR8MRbicAH9IDQzDP7/z0j/biG1kAARfvH8qmEBpGDZ0QWE5k6OYZa8BUJtT9QyLBbi0oDykutx51J22CL++3hvK5XT0ZENtBKn6mhNsCmyVTPfpHaF7WdlAiBql4AY9LHLFprxB396lda8nLMzICps+OItfv6uY5+Aw3QQGXkWScLhugWCN3K/DtYfEYquemIx8dFABEo/rdBvE6XYbhGMSA06ww8sOSmoLLLdlrq/X0Bg5RsranMrYfNvPSlrhNzYSi8h71HplzjLskBCEdDyvQten7RUz2F+eY5X99TZiY2Hg8TFNr5hC/8S/+gmIt/NP7nAYlieJl/TFSZ12TX99qr0QJYOfDeCB7Mfa/9p6+Hy5qFUc+XpHGzg55iPHrO7kW/+q2XEwT7nthCSpR48Mx4oVZ2mLWRJLd9HyJm6dBNuSdYMaPbPyJYP4yTiDeEaJGrAHjQ7fAjOMYbAwypS1mNmqLT0BqUos5gYgdq/JJMiOc7yToyzyeGnDEU=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0087e2df-c3eb-4d6f-193c-08db20d8675c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 19:56:42.1702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QnH7muNpskoQXuL8UmZ1BEMivtfgZK/O6rDkao/184/ebjkRLY+0lOfgBBFLVKwUgDT8IqTbaRWsnPPM8Gq/2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7761
X-Proofpoint-ORIG-GUID: 5E2JcNmV5ZeC7VXQawaklZsGf5zXs0y8
X-Proofpoint-GUID: 5E2JcNmV5ZeC7VXQawaklZsGf5zXs0y8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_11,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0
 mlxlogscore=512 priorityscore=1501 impostorscore=0 spamscore=0
 clxscore=1011 malwarescore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090160
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXIgMDksIDIwMjMsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+IE9uIFRodSwg
MjAyMy0wMy0wOSBhdCAxNzozMiArMDEwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gPiBP
biBXZWQsIDIwMjMtMDMtMDggYXQgMjI6MjYgKzAxMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6
DQo+ID4gPiBPbiBXZWQsIDIwMjMtMDMtMDggYXQgMTk6NTggKzAxMDAsIGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnIHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAwNjox
Mjo1MVBNICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFdlZCwg
MjAyMy0wMy0wOCBhdCAxODoyNSArMDEwMCwgR3JlZyBLSCB3cm90ZToNCj4gPiA+ID4gPiA+IE9u
IFdlZCwgTWFyIDA4LCAyMDIzIGF0IDA1OjEwOjE3UE0gKzAwMDAsIEpvYWtpbSBUamVybmx1bmQg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+IHdlIGFyZSB1c2luZyBmc2wtbHMxMDQzYS1yZGIgYmFzZWQg
ZGVzaWduIGJ1dCB3aXRoIGEgbHMxMDIzYSBTT0MgYW5kDQo+ID4gPiA+ID4gPiA+IHVzZSBVU0Iw
IGluIGdhZGdldCBtb2RlIHJ1bm5pbmcgZWl0aGVyIE5DTSBvciBSTkRJUyBldGhlcm5ldCBvbiB0
b3AuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBXaGVuIHdlIGNvbm5lY3QgdGhlIGdh
ZGdldCB0byBhIFBDKExpbnV4IG9mIFdpbmRvd3MpIG92ZXIgYW4gVVNCMiBodWIsDQo+ID4gPiA+
ID4gPiA+IG5ldHdvcmtpbmcoTkNNIG9yIFJORElTKSB3b3JrcyB3ZWxsLg0KPiA+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ID4gSG93ZXZlciwgd2hlbiB3ZSBjb25uZWN0IHRoZSBnYWRnZXQgZGly
ZWN0bHkgdG8gdGhlIFBDL2xhcHRvcCB3aGljaCB1c2VzIFVTQjMNCj4gPiA+ID4gPiA+ID4gd2Ug
c2VlIHNvbWV0aGluZyBvZGQ6DQo+ID4gPiA+ID4gPiA+ICAgUGluZyBmcm9tIFBDIHRvIGdhZGdl
dCB3b3Jrcy4NCj4gPiA+ID4gPiA+ID4gICBQaW5nIGZyb20gZ2FkZ2V0IHRvIGxhcHRvcCBkb2Vz
IG5vdC4gSG93ZXZlciBpZiB3ZSBhbHNvIHBpbmcgZnJvbSBQQyBhdCB0aGUgc2FtZSB0aW1lIHdl
DQo+ID4gPiA+ID4gPiA+ICAgc2VlIGdhZGdldCB0byBQQyBzdGFydCB3b3JraW5nLg0KPiA+ID4g
PiA+ID4gPiBTZWVtcyBsaWtlIHBpbmcgZnJvbSB0aGUgUEMgdGlnZ2VycyB0aGUgZ2FkZ2V0IHRv
IHNlZSBpbmNvbWluZyBwa2dzIHNvbWVob3cuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiBBbnkgaWRlYSB3aGF0IG1pZ2h0IGJlIHdyb25nIG9yIGhvdyB0byBkZWJ1ZyB0aGlzPw0KPiA+
ID4gPiA+ID4gPiBLZXJuZWwgNS4xNS44Nw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA1LjE1
LnkgaXMgdmVyeSBvbGQsIGRvZXMgdGhpcyBhbHNvIGhhcHBlbiBvbiA2LjI/DQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJIGp1c3QgdHJpZWQgNi4xLjE1IGFuZCB0aGUgcHJv
YmxlbSByZW1haW5zLCBJIGhvcGUgdGhhdCBpcyBjbG9zZSBlbm91Z2ggPw0KPiA+ID4gPiANCj4g
PiA+ID4gSXQncyBnb29kIGVub3VnaCA6KQ0KPiA+ID4gPiANCj4gPiA+ID4gSGF2ZSBhbnkgbG9n
cyBhdCBhbGwgdGhhdCBzaG93IGFueSBwcm9ibGVtcz8NCj4gPiA+ID4gDQo+ID4gPiBObywgZG9u
J3Qga25vdyB3aGVyZSB0byBzdGFydC4gVGhlcmUgYXJlIG5vIGVycm9ycyBsb2dnZWQuDQo+ID4g
PiANCj4gPiA+ID4gICBBbHNvLCB5b3UgbWlnaHQgd2FudCB0bw0KPiA+ID4gPiAgY2M6ICB0aGUg
ZHdjMyBtYWludGFpbmVyLi4uDQo+ID4gPiANCj4gPiA+IEkgdGhvdWdodCBJIGRpZCBidXQgdGhh
dCBsb29rIGxpa2Ugb2xkIGluZm8sIGFkZGVkIFRoaW5oIE5ndXllbiBub3csIHRoYW5rcw0KPiA+
ID4gDQo+ID4gPiAgSm9ja2UNCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gIHRoYW5rcywNCj4g
PiA+ID4gDQo+ID4gPiA+ICBncmVnIGstaGoNCj4gPiA+IA0KPiA+IA0KPiA+IEZvdW5kIGFuZCBV
U0JDIERvY2sgYW5kIGNvbm5lY3RlZCB0aGF0IGJldHdlZW4gZ2FkZ2V0IGFuIFBDIGFuZCB0aGlz
IGFsc28gd29ya3Mgd2VsbC4NCj4gPiBTZWVtcyBsaWtlIGEgaHViLCByZWdhcmRsZXNzIG9mIFVT
QjIvVVNCMywgbWFrZSB0aGUgdXNiIG5ldHdvcmsgZnVuY3Rpb24gaW4gYm90aCBkaXJlY3Rpb25z
Lg0KPiA+IA0KPiA+IEZvdW5kIG91dCBzb21ldGhpbmcgaW50ZXJlc3RpbmcsIG9uIFBDOg0KPiA+
IGNkIC9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTQuMC91c2IxLzEtMS9wb3dlciAg
IyBXaGVyZSBteSBnYWRnZXQgaXMgY29ubmVjdGVkDQo+ID4gZWNobyAwID4gdXNiMl9oYXJkd2Fy
ZV9scG0NCj4gPiANCj4gPiBOb3cgcGluZyB3b3JrcyBub3JtYWxseS4NCj4gPiANCj4gPiBTbyBM
UE0gZG9lcyBub3Qgc2VlbSB0byB3b3JrIHByb3Blcmx5IG9uIGdhZGdldC4gQ2FuIEkgZGlzYWJs
ZSBMUE0gc29tZWhvdw0KPiA+IG9uIGdhZGdldCBzaWRlPyANCj4gPiANCg0KVGhlcmUncyBubyBv
cHRpb24gaW4gZ2FkZ2V0IGNvbmZpZ2ZzIHRvIGFsbG93IHlvdSB0byBkbyB0aGF0IGF0IHRoZQ0K
bW9tZW50LiBZb3UgY2FuIGRpc2FibGUgTFBNIGluIGR3YzMgY29udHJvbGxlciBpbiB0aGUgZGV2
aWNldHJlZSB3aXRoDQoic25wcyxkaXNfZW5ibHNscG1fcXVpcmsiIGluc3RlYWQuDQoNCklmIHRo
ZSBob3N0IHB1dHMgdGhlIGdhZGdldCBpbiBzdXNwZW5kLCB0aGUgZ2FkZ2V0IHdvbid0IGJlIGFi
bGUgdG8NCmNvbW11bmljYXRlIHdpdGggdGhlIGhvc3QgdW50aWwgdGhlIGhvc3Qgd2FrZXMgdGhl
IGdhZGdldCB1cCBhbmQgc3RhcnRzDQp0YWxraW5nIHRvIHRoZSBnYWRnZXQgYWdhaW4uIFRoZSBn
YWRnZXQgbWF5IGJlIGFibGUgdG8gc2lnbmFsIHRoZSBob3N0DQp0byB3YWtldXAgdmlhIHJlbW90
ZSB3YWtldXAuIERpZCB5b3UgY2hlY2sgaWYgdGhlIGRldmljZSBpcyBpbiBzdXNwZW5kPw0KSWYg
aXQncyBpbiBzdXNwZW5kLCBpcyB0aGUgZ2FkZ2V0IGVuYWJsZWQgd2l0aCByZW1vdGUgd2FrZXVw
PyBEaWQgdGhlDQpOQ00gZHJpdmVyIHNlbnQgYSByZW1vdGUgd2FrZXVwIHNpZ25hbCB0byB0aGUg
aG9zdD8gSSBkaWRuJ3QgdmVyaWZ5LCBidXQNCkkgc3VzcGVjdCB0aGUgTkNNIGdhZGdldCBkcml2
ZXIgaXNuJ3QgY29uZmlndXJlZC9pbXBsZW1lbnRlZCB3aXRoIHJlbW90ZQ0Kd2FrZXVwLg0KDQpZ
b3UgY2FuIHdvcmsgYXJvdW5kIHRoaXMgYnkgZGlzYWJsaW5nIExQTSwgd2hpY2ggcmVtb3ZlcyBh
bnkgcG93ZXINCnNhdmluZyBhcyB5b3UndmUgdGVzdGVkLg0KDQpCUiwNClRoaW5oDQoNCj4gPiAg
Sm9ja2UNCj4gDQo+IEZvdW5kIHNvbWUgRFRTIHF1aXJrcyB0byBkaXNhYmxlIExQTSwgd29yayBm
aW5lIDopDQo+IE9uZSBvYnNlcnZhdGlvbjoNCj4gDQo+IHBpbmcgb3ZlciBOQ00gdG8gTGludXgg
UEM6DQo+IFBJTkcgMTY5LjI1NC4xMDAuMTAyICgxNjkuMjU0LjEwMC4xMDIpOiA1NiBkYXRhIGJ5
dGVzDQo+IDY0IGJ5dGVzIGZyb20gMTY5LjI1NC4xMDAuMTAyOiBzZXE9MCB0dGw9NjQgdGltZT0y
LjE2NiBtcw0KPiA2NCBieXRlcyBmcm9tIDE2OS4yNTQuMTAwLjEwMjogc2VxPTEgdHRsPTY0IHRp
bWU9Mi4xNjggbXMNCj4gNjQgYnl0ZXMgZnJvbSAxNjkuMjU0LjEwMC4xMDI6IHNlcT0yIHR0bD02
NCB0aW1lPTIuMzMzIG1zDQo+IA0KPiBwaW5nIG92ZXIgTkNNIHRvIFdpbmRvd3MgMTAgUEM6DQo+
IFBJTkcgMTY5LjI1NC4xMDAuMTAyICgxNjkuMjU0LjEwMC4xMDIpOiA1NiBkYXRhIGJ5dGVzDQo+
IDY0IGJ5dGVzIGZyb20gMTY5LjI1NC4xMDAuMTAyOiBzZXE9MCB0dGw9MTI4IHRpbWU9MC45MjEg
bXMNCj4gNjQgYnl0ZXMgZnJvbSAxNjkuMjU0LjEwMC4xMDI6IHNlcT0xIHR0bD0xMjggdGltZT0w
Ljk2MyBtcw0KPiA2NCBieXRlcyBmcm9tIDE2OS4yNTQuMTAwLjEwMjogc2VxPTIgdHRsPTEyOCB0
aW1lPTEuMTQzIG1zDQo+IDY0IGJ5dGVzIGZyb20gMTY5LjI1NC4xMDAuMTAyOiBzZXE9MyB0dGw9
MTI4IHRpbWU9MS4xNjEgbXMNCj4gDQo+IE5DTSB0byBXaW5kb3dzIGFwcGVhcnMgdG8gaGF2ZSBt
dWNoIGxvd2VyIGxhdGVuY3kuDQo+IA0K
