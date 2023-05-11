Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F068D6FE9D7
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 04:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjEKC2p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 22:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEKC2o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 22:28:44 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7977C40C2
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 19:28:41 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34ANRm1h015403;
        Wed, 10 May 2023 19:28:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=rRJHwNbSCU6XBaM0au1uHe7oJJlPPWRPTYaxtH83U5g=;
 b=nJoLcWGlG6p8xmdguycKOvbzOmjC+t6m3j/0+1mnw6YejoqkcVCNm/o/czEIGPs8++Y8
 0OZq4CTYiRLVXL7tD7CBn1PWYXqi6sjbeLk7R+vZqj6/Sndr71wBVHkqdmE330tPVGWc
 VJ1JwoATC9HpDJls0+KSFLg9LV9mD6iVAPWRUyEaIeatm/qIivuzIX3eKtdew7zBsF86
 d578z9mlJC+iRbG4yRm44Ab7Chvs20ouTnp9PXkCE/igFd6oRtcLCLfPa7uSDdjalO7u
 Mj6Zi0pw1rHD9J8UY7aspef1/KB32YKNsDVzISw8LA6TzuPKD8z5MphSf0cPzmPwAm53 mA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf770cj1s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 19:28:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683772117; bh=rRJHwNbSCU6XBaM0au1uHe7oJJlPPWRPTYaxtH83U5g=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KSPU6v9kNel+h+w1Xd4KMNomCcmXmzSZqqbGdKL33+xXESc2l3IWTjLe9i+DnhlPK
         +SIAFBX5Q9KkiYy549aO2yRh+PXBgnVWOnMP+TcIMHWkih7vrLrsFP4Xfd2ykNTwyX
         9TAgpKBPEe032qXuDWJKAzYVkCNPLx4RK1CBsOFg1refbB687EkAyrOJ0QchtNvM0M
         wm/rqrZWp3gZHkEQqzmOV9Lp6Ctifebu+0O7InyhM1ZYDjaBz57tptnjG61JtxRCDV
         b8YmgbzTTOeAt8xWZKLG2pQ7VTHRo6x2K3FQElM7AH53kcgD+340llKsj82AZd6RoL
         pLAc9aiCqkP0Q==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A260F4048F;
        Thu, 11 May 2023 02:28:37 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6715CA00E4;
        Thu, 11 May 2023 02:28:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=alQ/bfz9;
        dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E15E74045C;
        Thu, 11 May 2023 02:28:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSUOyoiqPHpeUs5iyLXlQB637v3vUVc7GEv3lPlRCMEI2LOoUnjIl10qbOe04YOb2GDgz34vizOgOYlRxSDF1zLECeitYqEFfz6VYbaIUtPX7wiR29uJJj8tIB1I+XouS5TP8TZtQhthOJJJ3yPtp3AufWV6P+ydXPMYulcObD1cMCkZIatAWwUS3c/FeU/6m24XEuHbtc9vMpQgXXSJHNqI+AvgjLYV9PBr1JFJzdWbp7j/em2h9w2jXEDalZKqLIHKgmxLE5e1WkPSnEwG2riLILsBCTPwbUeySNVUA1HKztwA8AnJwp8tIIc/+iPvhPflDNq65bOZKaNteKG8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRJHwNbSCU6XBaM0au1uHe7oJJlPPWRPTYaxtH83U5g=;
 b=f3O+lzQJ2udtW/MBsKvYZhoY5gOyIt+Dw7iuFo7k5ea9/rUcjFAkgbw68ZODzrfmaw28ZhR078Gcc3HqubTMI04A79gu7BxGo22DcyqQZHcCDmY31miU23GNm4Z3HZKDzl7a5Asc8SNEn6eky4aG6KtI8HRpI2xL5ybaQpCtb82fvrpFuvnRUQ54jCJCuZhjUg0sQ3iTT9pV9lcL186uKOiwgAATI6o5HJ7DwgVFOzbIfj1dJ2kTW0DwDefsuS1KC3ypanpyafli8edI/pWi/6PKU4eF/zpr5QSd60/oMFBqb7+dW3XaB2IdfLbF2MGIM1QY3RP500+0SOXnKxlU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRJHwNbSCU6XBaM0au1uHe7oJJlPPWRPTYaxtH83U5g=;
 b=alQ/bfz9ivEg1IIXl/OF5mmRTmysH6x9jJqZUuOf5xM3Il5dafTGr3MEynczwCZJ9shFs5CCqbp0WMg2P//YB4oyrcmPquXVt4pP2I5dHRBa8u+Owq33V5J2I/6UiInutpgOMBg93IsfwJG8oecrmxgJW121uMqpEX94zaNYUJU=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 02:28:34 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 02:28:34 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Setting LLUCTL force gen1 bit if max speed is SS for Gen2
 controller
Thread-Topic: Setting LLUCTL force gen1 bit if max speed is SS for Gen2
 controller
Thread-Index: AQHZg2pub4txYYMDE02M/COcGpMSMq9UBfeAgABDIACAAAWigIAABMoAgAABEACAAAIQgIAAAjyA
Date:   Thu, 11 May 2023 02:28:33 +0000
Message-ID: <20230511022529.bxryihhvxhhgswh6@synopsys.com>
References: <e465c69c-3a9d-cbdb-d44e-96b99cfa1a92@quicinc.com>
 <20230510212845.ymxudl4r3f54erkq@synopsys.com>
 <55aeb1ac-a90a-8b2e-7de2-114bfcf7dcb9@quicinc.com>
 <20230511014909.s6hdfidc5vdalhga@synopsys.com>
 <c534fd19-2868-818e-9bda-2caa519b2ee1@quicinc.com>
 <20230511021006.y5zjon5t2xnwnd2j@synopsys.com>
 <33e1835c-defb-7036-01a5-839767712e33@quicinc.com>
In-Reply-To: <33e1835c-defb-7036-01a5-839767712e33@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|CH3PR12MB7668:EE_
x-ms-office365-filtering-correlation-id: 88ba7b61-83d3-4e79-03c1-08db51c76b02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m7rJUgC+47wjMnwM5TtRUnYgbzqyPOhvyHMXpc+NtE/VfVjAp3Ia7pLV2RHfJuErZLJq9MGEwikz6Bfg3TJiqS+eVdz3fW3Q20g6NxSVosoJ0rayN96PCNgqCzBWUnf5O0YttuLKAl+pUltkwXW5mcOBJNB1bB6NigmC2UO+xuN22m4tjBgr4EXt1eY4UoFuu0uA7f1itgwJEzjMdE1Or62qTxkaEuNA16IgXqLW6T1iOAwry9bcSzdXMpNz1/UGywHNB3/r0tEkAU8h9tfNOZ1B3FdBAJ9yqBOuSCEGTaHq0jnVcOQse18E9kupDty/0eHMK3fkJHKV9b1Whx9vh+1a4NOb8/Ro2vn+VsKmOGYEiFzO1axmO1ZnRSCwvxcm1OD7EEKkwCyPzDZ5DJ9G8YpZ3rM5BSnBg2vSvB9IEQMCKQTVAEGWDZh1v6qYjA8fcjWfqzI/7zkKwYiFv1WlrFPluZfV85gP+xQnOjkZJsFSCIigiyLV2l8BAcOdU60srqc7N19+1AjbxrzKH++7oAf4q344nAEPZgWCoABgn3RYIFOBsSstzrC/b0p/qFtQ7NzZ8QMYY1fPrPvSyfklOQNZOkefL9pGknrQVp9ePYZpFz3RuZ5LoIEkBBP9HioG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(83380400001)(186003)(2616005)(2906002)(38070700005)(36756003)(38100700002)(86362001)(122000001)(26005)(6486002)(8676002)(316002)(8936002)(41300700001)(71200400001)(76116006)(5660300002)(478600001)(54906003)(66556008)(66946007)(66476007)(64756008)(91956017)(4326008)(66446008)(53546011)(6916009)(6506007)(1076003)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHlJWS91K0RIRy9JdjJJb0puMnhBb3M5ZmpGMkxZRXVCWC9FZjlDSkVCQUNv?=
 =?utf-8?B?eTkwMmp2RTh5cWRRZ1M5ck12Y244VWVOWTNxOGNkOEg1UlhDbEVCbGJtWGZt?=
 =?utf-8?B?b2ZqTjE0THYwb0wraUc0S1N6WTFBM2h5TE5WbTRXTWgvdTNqTmdnZVU0TGp6?=
 =?utf-8?B?Y1Y4NFh1SGxoNjluc2VZSGJ3NjRJWWRjYTNETFE3ZThzYy84Vm9TWUpFTW80?=
 =?utf-8?B?ME1iT1RScTNUWWFtRjFZZVJOdXp0dVRIcUI2QmNnUFVyeVd2a0NpcURFZWVk?=
 =?utf-8?B?bElxT2Z2YTFyR3FPOFJBTGhNN3lzdTVzZG12WlAwZGtwQ2R5R1ZpNzFGZkNQ?=
 =?utf-8?B?eXEyVndPaDdrL2NnTDBxTmxZdmNRWTA1VEdjbHBheVEyV21xL3V0b0x3b1Fm?=
 =?utf-8?B?aW5CZHJvaWt6SzZYQ0tYOWlCR3NiTlF0aEZxZkhyczJrRWNWNzB0VjhwWjdS?=
 =?utf-8?B?QTJTY1djRmlETTkzNGFwdTJtRENxNWgvOG1vUVNrTHUzOStpVkJHWGRuK0Nn?=
 =?utf-8?B?VWhQZVQ5Q3ZWZmt4K3NOOGNYVWhFWHV3cFVsRlliaDRFZTljWHNvMHdvenh2?=
 =?utf-8?B?TFhrcmN1Wm5uSW0vNUQ0QkE5RloxaGcvZ1orTDVpQm01T3FXSmhXTVpVaGNC?=
 =?utf-8?B?blpQSFZEYXBXS0ZiS3REdnAzWGJkdWI2TVBRZlVrT1JrREdMcTE5Zm5LT29r?=
 =?utf-8?B?czdZNkVLclVuYkt6a0pWakE3N1RqbVZSdkprSGdKZkJuQW5zL3NRMmZLR3hm?=
 =?utf-8?B?S25vREFGN2FyWmxSclZScjZyM0kxUXNvZjFBQktVV0MwbzIwZjMwdjQzenRr?=
 =?utf-8?B?UXVUc0JOMldCRkVXTFFoWEozVUhjUWZEcHYvUkpUUVhnQUxZWXV3TUV6ajNK?=
 =?utf-8?B?cFY4Z1VTSWp0N0hYVUxRU0swUXMwNUJQTjBvNVZIa0V5SVBOR1o1S0JyTGxq?=
 =?utf-8?B?eUJvd3dNNjNtVVFBc2hJVTBmdVZXcDcvdVZlMGgxUDl6L3p4M0p6ZjNUZ2ZB?=
 =?utf-8?B?bExEc21vOHNuMHJ3RE9WWkNNZHVOU0YwR0VWajU0UmZ0VUM2b3FlSU5wRzdC?=
 =?utf-8?B?b1BVNFhDYWlldktEYnJPZmFqdWFnOWpqb3g5ajBiZUlWWXoydzMrV09vTk12?=
 =?utf-8?B?MythUUFBK3RRZzVKZzNIS1JDeEI1OTZnZ3lHM0tFUFVBK2hhVjdiRjVWSGhv?=
 =?utf-8?B?K0l4eldPNnlpeDQvT2pmbEpGSkNQS2s0dzNYTElqdmNWdVhjQlk1MldsR2V1?=
 =?utf-8?B?MVE5emRlYjE0NVF0NndQdXlyeHVkMGhnQjZsOEFIcFpEbkgzbUJXWG9NTXE4?=
 =?utf-8?B?THNJYlBiVFNYdUhSa2FxMXhSQzNSK3ZSTENwU3d3VFdDV2hOeFI1b09EVHdl?=
 =?utf-8?B?d0JGa0I1dmRKVy8rUVJ6NWJrM2lHWWtVM3dwRTFocVFZYklWKzlabUtZV0dN?=
 =?utf-8?B?cnJUVlB5dnJNY2w2YTIzTTVMYS9FMXE1UlphYmZMUUlaUzNIUnczQ2VIVWw1?=
 =?utf-8?B?QUNQTXg3ZDkxV2ZoQnlTZml1bDhGK2UwMmd3YVZSV0k1dTg2VWdzTSt3M0p1?=
 =?utf-8?B?RzVyM3RyUTBvQVhDUlAvdUdBaEJ3VHFYUnAveXdHN1V0TmY5OE9TbVlzWHR2?=
 =?utf-8?B?MDNrSnRLaGk5TWtkcFZlSjAzTDlubEhGOGk5ZmwvVUJoNVJxcTBMM3JhUmRU?=
 =?utf-8?B?Zm42cU5vT3A1bk83QW5UV1NJT2hjOVp2U05NelI5a1lYWVozZVU3WVFVd3g5?=
 =?utf-8?B?cDR0K0owUG13RTE1YWxpRTZXS1VJYlFIWS9PRzZTVUZobGE1dWlsN3A4elRI?=
 =?utf-8?B?TEZZWHN4L2J6RWVhRVhlRCtzN21Ja0tidHRNSyt5OWxSU0Z2bjJmMHdkVTJr?=
 =?utf-8?B?UU55b1Z4MTlBVTJlL09ac0FBRDNCWjE5eE9xM0NZVWU4RjdYS0s5UU4yRHFm?=
 =?utf-8?B?elR0WEErdFlUa1FQWUczY0QvOGJsRWtPa1U1Y2lpbDdlZEhLVjNxcUlFdk1Y?=
 =?utf-8?B?Vm5VY2h5Wk5senBuYWIyd3ErSWlhUEowL1pWQzJiNkt4MjZqQlc4YXkvT25X?=
 =?utf-8?B?VlZDMi9GOWhveFBjaS9aUGlzeFZWSEZPMlNIeXVJb1VpMGNiOVY5aGhXZmFt?=
 =?utf-8?Q?REvOAcYqj/WkGmS18fIj5ggnA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB401CC7C8ADC04EB6259F8A7F21B564@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NgQmQWsU0RqYFFwEGWrpDfeoOzmGqy0tvkBg5bKT7020/S0x+8VYmGfZf4oYoiYcO8rNDuZnOmLBrnTd6A6q+DeYeG5vvrq++5Iib5HQQde1HJjBxZui6m0lufCaTEZCR5VoTJfPyOWddlnbxXn+FfdzzP3VqztI+8NbqV/JI/CT94AdIek2HpQY06W0MtVKzR6qM2N8y7H9XBr3Phy9V8Op4JO8q/upXI9jm46Wbek2sEthAZ7h09PMBZblJ27Ihsy/JBD3aE1CUaPE7Nsaj8N5pkECBxdlApYgox4UOMDuoheDqusbex3KLHxDjWGfr6zawoRPfa4BYqJWfFaoEQaJxtwPZ9DTppnP6cYBZhQInDSq4dyWahLijVKDkH9dtgXaG+5e1PmxoiTf2vCNJLiohREppeqlSE8Vik4zmhSvPLf+YC2xK1nIR6ge8XQD9J1WUc+vR3IHjtJYxw0NppqwQEBPJZn4kXWC38jZLDWz7YVxe4l4vw1bja1c6fu3rZiLYk4F6lNK7wewIhwzpaTHFRs+VQm4nSCkHpXE98cHu7ZcCAFMwFERi8CmYh42TYUcvGgRqqQgMX+8+C4yLlakwoiLB+ry5g0tQIO0RXBHScijUgzrpa1/ZPbXUEkUcMR8H9k+hoV8lmxyreEpTMohhF91p8ePCf87KA6R3VB/PQDtGQUu7XqRjfd1ANnfeeljzRoHVutcQMp38Ub8d+8UdRZib3QN0mS+vph/XCx+OydPVYhEe4JmYaFDxPXLcnwopwV7k477M4h/VdPI+m7b43PX60gLAa6LOPgLZqlA9pjXcE2MB5n0LJ//I630FB6MeupuxMeegvBnF6sjZjGr14NYmj7KUy4mgv9H33c430d7eOqLJNUZUEiD0xrqwYnj2Prx9OQRpMP60GVaCg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ba7b61-83d3-4e79-03c1-08db51c76b02
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 02:28:33.8482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gDzUNFGhtq1LOAC453lO0TVFF7+laIV/qtoZh1gFDvboNWgzpnMaNcNYou/oTt48AmGE0KOCmSyKvostsqDT8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668
X-Proofpoint-GUID: cVBAq2WOV3rLe4WoCFpfMFPAIWq6NQRd
X-Proofpoint-ORIG-GUID: cVBAq2WOV3rLe4WoCFpfMFPAIWq6NQRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110019
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXkgMTEsIDIwMjMsIEtyaXNobmEgS3VyYXBhdGkgUFNTTlYgd3JvdGU6DQo+IA0K
PiANCj4gT24gNS8xMS8yMDIzIDc6NDAgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBU
aHUsIE1heSAxMSwgMjAyMywgS3Jpc2huYSBLdXJhcGF0aSBQU1NOViB3cm90ZToNCj4gPiA+IA0K
PiA+ID4gDQo+ID4gPiBPbiA1LzExLzIwMjMgNzoxOSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0K
PiA+ID4gPiBPbiBUaHUsIE1heSAxMSwgMjAyMywgS3Jpc2huYSBLdXJhcGF0aSBQU1NOViB3cm90
ZToNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiA1LzExLzIwMjMgMjo1OSBB
TSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiA+ID4gSGksDQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IE9uIFdlZCwgTWF5IDEwLCAyMDIzLCBLcmlzaG5hIEt1cmFwYXRpIFBTU05WIHdy
b3RlOg0KPiA+ID4gPiA+ID4gPiBIaSBUZWFtLA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gICAgIElmIHdlIHNldCBtYXhpbXVtIHNwZWVkIHRvICJzdXBlci1zcGVlZCIgZm9yIGEgU1NQ
IGNhcGFibGUgY29udHJvbGxlciwgSQ0KPiA+ID4gPiA+ID4gPiBzZWUgZGV2aWNlIG1vZGUgd29y
a2luZyBpbiBTUyBidXQgaG9zdCBtb2RlIHN0aWxsIHdvcmtzIGluIFNTUC4gRnJvbSB0aGUNCj4g
PiA+ID4gPiA+ID4geWFtbCBkb2N1bWVudGF0aW9uIG9mIG1heC1zcGVlZCwgSSBzZWUgdGhlIGZv
bGxvd2luZzoNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ICAgIMKgbWF4aW11bS1zcGVl
ZDoNCj4gPiA+ID4gPiA+ID4gICAgwqAgwqBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gPiA+ID4gICAg
wqAgwqAgwqBUZWxscyBVU0IgY29udHJvbGxlcnMgd2Ugd2FudCB0byB3b3JrIHVwIHRvIGEgY2Vy
dGFpbiBzcGVlZC4gSW5jYXNlDQo+ID4gPiA+ID4gPiA+IHRoaXMgaXNuJ3QgcGFzc2VkIHZpYSBE
VCwgVVNCIGNvbnRyb2xsZXJzIHNob3VsZCBkZWZhdWx0IHRvIHRoZWlyIG1heGltdW0gSFcNCj4g
PiA+ID4gPiA+ID4gY2FwYWJpbGl0eS4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFNo
b3VsZG4ndCB0aGlzIG1heGltdW0gc3BlZWQgZ2V0IGxpbWl0ZWQgdG8gZ2VuMSBldmVuIGZvciBo
b3N0IG1vZGUgPw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGUgZGVzY3JpcHRpb24gaXMg
YW1iaWd1b3VzIGhlcmUuIEhvd2V2ZXIsIHdlIG9ubHkgZXZlciB1c2UgdGhpcw0KPiA+ID4gPiA+
ID4gcHJvcGVydHkgdG8gbGltaXQgdGhlIHNwZWVkIGZvciBkZXZpY2UgbW9kZSAoZnJvbSB3aGF0
IEkgc2VlIGluIHRoZQ0KPiA+ID4gPiA+ID4gb3RoZXIgZHJpdmVycyBvZiB0aGUga2VybmVsKS4g
U2hvdWxkIHdlIGV2ZXIgbmVlZCB0byBsaW1pdCB0aGlzIGZvciBob3N0DQo+ID4gPiA+ID4gPiBt
b2RlLCBJTUhPLCB3ZSBzaG91bGQgaW50cm9kdWNlIGEgbmV3IHByb3BlcnR5IGZvciB0aGF0IGFu
ZCBjbGFyaWZ5IHRoaXMNCj4gPiA+ID4gPiA+IHByb3BlcnR5Lg0KPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gSGkgVGhpbmgsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gICAgIFNvcnJ5IGZvciBub3Qg
YmVpbmcgY2xlYXIuIFRoZSBmb2xsb3dpbmcgaXMgdGhlIHZlcnNpb24gYW5kIElEIG9mIFNNODU1
MA0KPiA+ID4gPiA+IGNvbnRyb2xsZXI6ICh1c2IzMSBjb250cm9sbGVyKQ0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IFZFUl9OVU06IDB4MzEzOTMwMkENCj4gPiA+ID4gPiBWRVJfVFlQRTogMHg2NzYx
MkEyQQ0KPiA+ID4gPiA+IFVTQjNfUFJJX1VTQjMxX0lQX05BTUUgKDB4QTYwQzEyMCkgPSAweDMz
MzEzMTMwDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gV2UgbmVlZCB0byBmb3JjZSB0aGlzIHRvIGdl
bi0xIHRvIGZhbGxiYWNrIHRvIFNTIGV2ZW4gZm9yIGhvc3QgbW9kZSB0b28gYXMNCj4gPiA+ID4g
PiBjdXN0b21lcnMgYXJlIGZhY2luZyBjb21wbGlhbmNlIGlzc3VlcyBvbiBTU1AuDQo+ID4gPiA+
ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBJIG1lYW50IHRoZSBkb2N1bWVudGF0aW9uIGZvciBtYXhp
bXVtLXNwZWVkIHByb3BlcnR5IGlzbid0IGNsZWFyIGZvcg0KPiA+ID4gPiBjYXNlcyBzdWNoIGFz
IERSRCB1c2IgY29udHJvbGxlciB3aGVyZSB0aGUgY29udHJvbGxlciBjYW4gb3BlcmF0ZSBpbg0K
PiA+ID4gPiBkaWZmZXJlbnQgbW9kZXMuIFlvdXIgZGVzY3JpcHRpb24gaXMgcHJldHR5IGNsZWFy
Lg0KPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IElmIHNvLCBjYW4gd2Ug
c2V0IExMVUNUTCBGb3JjZV9HZW4xIGJpdCBpZiAoQ29udHJvbGxlciBpcyBHZW4yICAmJiBtYXhf
c3BlZWQNCj4gPiA+ID4gPiA+ID4gPSBTdXBlclNwZWVkKSBzb21ld2hlcmUgYWZ0ZXIgR0NUTCBj
b3JlIHNvZnQgcmVzZXQgaXMgZG9uZSBpbiBzZXRfbW9kZSA/DQo+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IEJUVywgdGhhdCdzIGZvciBkd2NfdXNiMzEuIEZvciBkd2NfdXNiMzIsIHdlIHVzZSBh
IGRpZmZlcmVudCByZWdpc3RlciB0bw0KPiA+ID4gPiA+ID4gbGltaXQgZGlmZmVyZW50IGVTUyBz
cGVlZHMgYW5kIGxhbmVjb3VudC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVG8gbGltaXQg
dG8gaGlnaHNwZWVkIGZvciB4aGNpLCB3ZSBjYW4gZGlzYWJsZSB1c2IzIHBvcnRzIChjbGVhciB0
aGUNCj4gPiA+ID4gPiA+IFBPUlRTQy5QUCkuIEkgZG9uJ3QgdGhpbmsgd2UgY2FuIGZvcmNlIGxp
bWl0IHRvIGZ1bGwgb3IgbG93IHNwZWVkIGZvcg0KPiA+ID4gPiA+ID4gZHdjMyBob3N0IG1vZGUu
DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgIEZyb20geW91ciBleHBsYW5h
dGlvbiwgY2FuIEkgc2VuZCBhIHBhdGNoIGZvciB3aXRoIHRoZSBmb2xsb3dpbmc6DQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gMS4gVXBkYXRlIGRlc2NyaXB0aW9uIGZvciBtYXggc3BlZWQNCj4gPiA+
ID4gPiAyLiBBZGQgZm9yY2VfZ2VuMSBwcm9wZXJ0eSBhbmQgaWYgaXQgaXMgc2V0LCBjaGVjayB0
aGUgdmVyc2lvbiAodXNiMzEpIGFuZA0KPiA+ID4gPiA+IHNldCBMTFVDVEwuRm9yY2VfR2VuMSBi
aXQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gTGF0ZXIgaWYgc29tZW9uZSB3YW50cyB0byBhZGQg
Y29kZSBmb3IgdXNiMzIgYXMgd2VsbCwgdGhleSBjYW4gcmV1c2UgdGhlDQo+ID4gPiA+ID4gc2Ft
ZSBwcm9wZXJ0eSBhbmQgZXh0ZW5kIHRoZSBjb2RlIGZvciB0aGUgc2FtZS4NCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiBMZXQgbWUga25vdyBpZiB0aGlzIHdvdWxkIGJlIGFjY2VwdGFibGUuDQo+ID4g
PiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBJJ20gdGhpbmtpbmcgdG8gaW50cm9kdWNlIGEgZ2Vu
ZXJpYyAiaG9zdC1tYXhpbXVtLXNwZWVkIiBwcm9wZXJ0eQ0KPiA+ID4gPiBpbnN0ZWFkIG9mIGEg
ImZvcmNlX2dlbjEiIHRoYXQncyBzcGVjaWZpYyB0byBkd2MzIGNvbnRyb2xsZXIgb25seS4NCj4g
PiA+ID4gDQo+ID4gPiA+IFNvIHRoYXQgd2UgY2FuIHVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiBm
b3IgIm1heGltdW0tc3BlZWQiIGFzIGZvbGxvdzoNCj4gPiA+ID4gDQo+ID4gPiA+ICogVGhlICJt
YXhpbXVtLXNwZWVkIiBhcHBsaWVzIHRvIGJvdGggaG9zdCBhbmQgZGV2aWNlIG1vZGVzLiBJZg0K
PiA+ID4gPiAgICAgImhvc3QtbWF4aW11bS1zcGVlZCIgaXMgc3BlY2lmaWVkLCB0aGVuIHRoZSBo
b3N0IG1heSBoYXZlIGEgZGlmZmVyZW50DQo+ID4gPiA+ICAgICBjb25zdHJhaW50Lg0KPiA+ID4g
PiANCj4gPiA+ID4gT3INCj4gPiA+ID4gDQo+ID4gPiA+ICogVGhlICJtYXhpbXVtLXNwZWVkIiBv
bmx5IGFwcGxpZXMgZm9yIGRldmljZSBtb2RlLiBUaGUNCj4gPiA+ID4gICAgICJob3N0LW1heGlt
dW0tc3BlZWQiIGlzIGZvciBob3N0IG1vZGUuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGFua3MsDQo+
ID4gPiA+IFRoaW5oDQo+ID4gPiANCj4gPiA+IEhpIFRoaW5oLA0KPiA+ID4gDQo+ID4gPiAgICBJ
ZiB3ZSBkbyBzbywgd2UgbmVlZCB0byB1cGRhdGUgdGhlIGNvZGUgZm9yIHN1cHBvcnRpbmcgb3Ro
ZXIgc3BlZWRzIGFzDQo+ID4gPiB3ZWxsIChjaGFuZ2VzIGluIHhoY2kgd291bGQgYmUgbmVlZGVk
IEkgYmVsaWV2ZSkuIFdhbnRlZCB0byBsaW1pdCB0aGlzIHRvDQo+ID4gPiBkd2MzIG9ubHkgYW5k
IHNvIHdhcyBzdWdnZXN0aW5nIHRvIGFkZCBmb3JjZV9nZW4xIHByb3BlcnR5Lg0KPiA+ID4gDQo+
ID4gDQo+ID4gSSBhZ3JlZSB0aGF0IGl0IG1heSBnZXQgdW5uZWNlc3NhcmlseSBjb21wbGljYXRl
ZC4gSG93IGFib3V0IGxldCdzDQo+ID4gYXNzdW1lICJtYXhpbXVtLXNwZWVkIiBhcHBseSBmb3Ig
Ym90aCBtb2Rlcy4gU2hvdWxkIHRoZXJlIGJlIGEgY2FzZQ0KPiA+IHdoZXJlIHdlIG5lZWQgdG8g
c3BlY2lmeSBkaWZmZXJlbnQgc3BlZWRzIGZvciBkaWZmZXJlbnQgbW9kZSwgdGhlbiB3ZQ0KPiA+
IGNhbiBpbnRyb2R1Y2UgYSBuZXcgcHJvcGVydHkuDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFRo
aW5oDQo+IA0KPiBZZXMsIGJ1dCB3aGF0IGFib3V0IGhpZ2gtc3BlZWQuIEFzIHlvdSBtZW50aW9u
ZWQgZWFybGllcjoNCj4gDQo+ICJUbyBsaW1pdCB0byBoaWdoc3BlZWQgZm9yIHhoY2ksIHdlIGNh
biBkaXNhYmxlIHVzYjMgcG9ydHMgKGNsZWFyIHRoZQ0KPiBQT1JUU0MuUFApIg0KDQpKdXN0IG5v
dGluZyBhIHBvc3NpYmxlIG9wdGlvbiB0byBsaW1pdCB0byBoaWdoc3BlZWQgaGVyZS4NCg0KPiAN
Cj4gSSBiZWxpZXZlLCB3ZSB3b3VsZCBzdGlsbCBuZWVkIHRvIHRvdWNoIHhoY2kgc3RhY2sgaWYg
d2UgYXJlIGFzc3VtaW5nIHRoYXQNCj4gdGhlIG1heGltdW0tc3BlZWQgcHJvcGVydHkgaXMgZm9y
IGJvdGggbW9kZXMuDQo+IA0KPiBDYW4gd2UganVzdCBzdGljayB0byBsaW1pdGluZyBnZW4yIHRv
IGdlbjEgYW5kIG5vdCB0b3VjaCBvdGhlciBzcGVlZHMgPw0KPiANCg0KU2V0dGluZyB0aGUgcHJv
cGVydHkgaXMgb25lIHRoaW5nLCBpZiB0aGUgY29udHJvbGxlci9zZXR1cCBkb2Vzbid0DQpzdXBw
b3J0IGl0LCB0aGVuIHRoZSBkZXZpY2UgZG9lc24ndCBoYXZlIHRvIGZvbGxvdyB0aGUgaW52YWxp
ZCBzZXR0aW5nLg0KZS5nLiBZb3UgY2FuIHNldCAibG93LXNwZWVkIiwgYnV0IHRoZSBkZXZpY2Ug
ZG9lc24ndCBoYXZlIHRvIG1hdGNoIHRoZQ0Kc2V0dGluZyBzaW5jZSBpdCBkb2Vzbid0IHN1cHBv
cnQgaXQuDQoNClRoYW5rcywNClRoaW5o
