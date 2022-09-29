Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3125EFF5C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 23:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiI2Vol (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 17:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiI2Voj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 17:44:39 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D807D6D
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 14:44:35 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28THdTqa001862;
        Thu, 29 Sep 2022 14:44:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=O2L0P2gvtS6CLPWXxYgdERf+E7IDhkD7qRTFgATkks4=;
 b=hcDyqbo4imU8Pk6KPlRk3CcEVMFJ68OHQ6hOQKvTIMYBT8E2wBSpJk32qxWx2n4qvsn2
 bAnUGukGmWmK1etBqp9S0IoiYLefxfg1uy2fDNME4Gw7aG2KHM2ONarW5X2GwOe1wGji
 az5ngGFJ9kZ1VUBP2MFHHhGDx4eZcKpf7daCpq6OoKLyg6BBBSVPq475HN8ow/TVW57k
 2Zon00N0x3Yqnf+/GjTDtHCiPj6lxcksc6QLMDsPltcbtY1CjY09Dd4gznIpiUfo9OPL
 nVtbQ48ZiH+4H4hloOcbDvjLsF9Z8XCG/ns0zN7/yufayc9cL+92Aq9npYCtEyU5hQCu 3w== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3jt0tvnp4m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Sep 2022 14:44:23 -0700
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BF41D40081;
        Thu, 29 Sep 2022 21:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1664487862; bh=O2L0P2gvtS6CLPWXxYgdERf+E7IDhkD7qRTFgATkks4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=V9UlJRG3Oy8hfmTO05h6GRT3RYgwQCLtIhroAWznADvIW97nZNaxGPkE3toYZbizM
         QLyIXMgsyV9AbZ2tHqe9fcv4OJe5ZJqTffDbIKSCtD15T/A4X5j/5ixnr6yM1b/Vpr
         IHZ9k3zrLt5XNBZ+JhYNM/OP/qkTOGEdhTI1W46qL8xR/q3cxMQW7fI3kalmVQUgrK
         tdSJ7DBKR01MNniTZYq+PR83CevtwOpTPXjZkcR/N7f5IWLpkj1eHijb3QE3FsHUwX
         pOGrDVjl6Lgr+6Z9GKHfZdVvreDzW/tyM7kVCDSmb4U0xDEx3885hGMwvw6dLCbFPT
         /wrPuuYI+02lQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id AD998A0083;
        Thu, 29 Sep 2022 21:44:21 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1198280073;
        Thu, 29 Sep 2022 21:44:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gacx7/2M";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA4y41Z4YEEPImIfBODQQxH8mw5bOfMJMETh/yFSJlH1MbRumwLDe2jiAWm1s5b1q7TRPKSe7dWwrJYLZk0BSr/oSLRoYVWhV+HjKfjNylSV4oBqj0DRbzxq+p95siSVAjAlxg24NXRrcoDHMptuPeE+9aH2E0nThiEqphJvWiZkrYDwfUKvopf+uFRPok0WFmEIFKr3wTXGQJK8tYrhj40agF0vPMsJrFLrbCan8bCSqZElrYUt3VRReZFdMfzM5ysfW4trs4vaPHZHQqezUFunRtos1AFDyCLspPZjPyYkty6+E95tIY8mT6itxnHWsvE+13F+qDBxqEM11OdRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2L0P2gvtS6CLPWXxYgdERf+E7IDhkD7qRTFgATkks4=;
 b=F+8vXrZOhcROQQ2/G005FgrNcQQCUII+CQ1L4qnWb9TiP9gXrjSF0Ttuk8rvljEL75DDOZVBXCeLujTkHlT/2OcKV8QceaZDPSMpTC6mZJwQHvPOZYusjJv20lGjEC4mToWIr2uSQ6kRX3XCO+GvLbutKhj/O1ymLBGl4+5XGIBKsfA6UcxXYqkpS0VFMMCEQDLcR/6QO7mgWVAPMENCC6XmYVC9NpH+YIfXh0BXffSH+baW6TuiLB+s11AGvu8LG43Ohm3nIC+DyXaH066QeoS5KlS0odF+KPmSPtVqo42XhU7+5F/h7lRBTQcetOvvNVZsMVd7R6mGprNh6fsf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2L0P2gvtS6CLPWXxYgdERf+E7IDhkD7qRTFgATkks4=;
 b=gacx7/2M+xkqz2VNI3SfZjk3iXZw4wSoz/cJqm1gTThjKawcjhsu6kmlRdsdrWLrDmkKWLGGCc+XEGbLmmUCvf9QU95dVPjIWQCwq9aIj7ldIzhyP0HaIHSF/qkW5DE1VV2q7Q8rG+1jIZI0qEepNMEjPe/+WIK9aOCYc6Oo1UY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB4354.namprd12.prod.outlook.com (2603:10b6:5:28f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 21:44:16 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6df:b736:7029:df89]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6df:b736:7029:df89%7]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 21:44:16 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Linux USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH] MAINTAINERS: switch dwc3 to Thinh
Thread-Topic: [PATCH] MAINTAINERS: switch dwc3 to Thinh
Thread-Index: AQHY09f2qLD7TrRSIUy8B+vl5KWXL6328YqA
Date:   Thu, 29 Sep 2022 21:44:15 +0000
Message-ID: <20220929214413.paugayezqhs5nlm4@synopsys.com>
References: <20220929074844.351938-1-balbi@kernel.org>
In-Reply-To: <20220929074844.351938-1-balbi@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM6PR12MB4354:EE_
x-ms-office365-filtering-correlation-id: 0d6aa7f5-85ec-44af-b21e-08daa263c1a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 428BI06rHtE8cOITglH5xQ4K5vIpG01pg24kuevQLd6uXN/zIEgwT8sRZboJkT8JXLmFspwJGEtpm3nMXgCuQaeg/viN7KS/9cycEmBj5HTeUCXXcZyZy2OMxOVTa5Hiw/cu9DHHeZSWRsD6ABjCRsBErPHQgqCULvxm02tM+DKGqkCJabOxDpY+ett/D37+UM/xYwjzJGcbE5NTQafzlkfT3vKdq2pAgNPxZOxTn7AjkS3relZ44x79cuIALXkIKaa/XJm3le3+TpHIJo8rGas5mRQMn8S4hBZO+lKTKOPJTgOIVjAdhg2XU4m7N1K8M25iT/e1/vaf2JTK4ZXxTbXZht7SqQTDQuAjvY91yMwlnE2HcUcalvL7odxo5ln10SXNEXQlVZnFXATwzDIhqbRg/QxLcS2Vj/aXDUJSRZ3FpmYwSiV0Rpv0vywFc2HzGgGxSeYfIdJZVvUhukv2rdtbTNKADySKtr79GKfFXiVbmy0iBVK7LKmj4sYWRvg2qB1akPBpy5edi4ZbJQ3BEa1PnIEAwGQhQah9bDHQainkKZ1/cf3FMGuPKiRKFPoZQRDia2e82jEKe4UNn7PhDE45uzh+BiJPXbo7rG5BH8ohA8a2x9enl8HQOL8xmGetdJx7HJXnTM4UhHdeqhotebNx//FItQVDXVEvgf5ipmMP3hxlPBLD5yMxfy2CsINChMbEw8IzOdt698n70U2xlKF370CDozgWM4thNfczSzvGNHIhyC9iXxyCUhno/FFBu9ZvGHbocnAt0SrYLD/JoQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199015)(122000001)(38100700002)(26005)(38070700005)(86362001)(36756003)(83380400001)(66446008)(41300700001)(107886003)(6506007)(66476007)(4326008)(8676002)(64756008)(66556008)(4744005)(5660300002)(478600001)(8936002)(6486002)(71200400001)(54906003)(6916009)(66946007)(76116006)(316002)(1076003)(6512007)(2616005)(2906002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWRkczV3WVI0ck8rT2k0YlR2ZkZ4QjJEQVpoTktJUnp0K1MvUnFaWmx4TU9Q?=
 =?utf-8?B?dGtGd291SkZ4Vy9sVnQ3eE5HYzJNcTNDZ0Q3Qkw0K2xZc0UwZ1VpQXFkblhQ?=
 =?utf-8?B?ZkdNUkM5SXIwNU1paTlFNXdaMmpKQ0praXlvb0d4RkswVWxtd1VjRGRDai83?=
 =?utf-8?B?Z0IzVEthajArZUl6NitpK05CNHZzeE80bHVLYWhvYjlySmZZQ1c2WjRpdjJH?=
 =?utf-8?B?UXl0Z3FqL0dKTGdldElnL1hJUHFPa2xRS085UUlLS2p2d3NJNGpOZnFVUm1J?=
 =?utf-8?B?bGtoTmZuc093MmVoaUxYTWkyM1NHQ3FWRFcyVDRjd0sxQ1ZFOWVzWWdLV0JK?=
 =?utf-8?B?MU1QS0dVUGg2c0ZJQmJEOFordGFndzlIWjBreFF1bVkyeG5hQVVtUkhqL3Nz?=
 =?utf-8?B?T2tnU2xEYlQ0MzZ2c2tOYThsU1ZnMkh6QXRPTHFUMFVERWhJWWxicWNIREpQ?=
 =?utf-8?B?WFRHUE40ZitURDk1d0VSTkFFVEZpekpjSjRGbHpadVNDbWxPZHFMRlRBcGlO?=
 =?utf-8?B?aElVUlIwRC9qcjNwOVZ0VUxsWGhVQzdHdHZpR0lmZXk2b1pscklSQkd4c0FK?=
 =?utf-8?B?ZWVGenl4N0lrZktNRWFIc3dobEY5bGNVelE4TGdQZGpxU21wd29IeFlCVmRr?=
 =?utf-8?B?cERTYzhuTmw2NTQvUlp2QnFYd1pNRVRBekNnNXFXM1hFMWh5amg1bk50QTBy?=
 =?utf-8?B?Q1B3LzQrMlZvSklwc1JjYjEvSFcyc2IrdUI3T3MxaGJWa3hjdkVEbXNoK3p6?=
 =?utf-8?B?cStjcm1tcHlhZnJ6S0MrbjVDd01CaFE2MlB4UXV2Sy9rcElqK3lXaWc4d0FP?=
 =?utf-8?B?R0VsN215bzRKalgzWVVQcGRxYjFveGVXWnc1dWhmanZEcUtseDRxZ284TEhD?=
 =?utf-8?B?d3NTSjV5OHFQOUZuZSsxUWRMclYySXJQbjJNV0U2S2pGaDNyVWQvR3hpbCs1?=
 =?utf-8?B?TkhHRW0xM3hNQUNXRmo2SUhaWVhaSHJFYVBNZU8ra0JCOU0wWEExRmk3cUhn?=
 =?utf-8?B?SWd0Qloxc0h5V0FrKzNadDRLVk9LM0RhNEFQekdLTFp0RmZLWHhZVmZ6MXUr?=
 =?utf-8?B?R3dwc1QyOGw1d0hNcEp0TFVGQVlINUlpa0xmeGh2UzBvT0ZhSmd3U05hUkk0?=
 =?utf-8?B?QTBObHY2dW80bjN0N1YzNGl5ZmpmSG9WdDhWdDlKWGw5ckRGUGt4c1B3S0F5?=
 =?utf-8?B?YUJHb0JOczNLQWFtYm8xbWkxSlowYlR6cGYvb1k0YTd6RkhMUmNQUW0vZ21k?=
 =?utf-8?B?eWZYRFdTOEY0bW9FT1BodklwT0M3OUtKN0IrTDY0N0R6VGpZZDRjbE1SS1RX?=
 =?utf-8?B?NFI3NkcwalBLaDFxOWJGUFdOeUl4eXNzaTJ4REF1ZFUzSEFoY3dnYzR0L0I2?=
 =?utf-8?B?UFF4QWQwN0swbkl5Vm5vcUdlZVM2ODBGMUhrS3RnMHBEanV3c3hYQmFnRGd3?=
 =?utf-8?B?azdleXFNWnk1TzM1OFJKWFQvSUV0Q3FaK1FnSzBUeU50L0xhZzVsZ3ord3Rq?=
 =?utf-8?B?K2lWUXB0MkRkYWNMNkdKdExGY1VqVkIxdE45UDRvL2hKT0R4LzkxaTB3Z1hj?=
 =?utf-8?B?TEFDVHhJQy9QVVI2R0JsWkgwMVZ1NU5wRzUvV0dCcTNySm93NG5DKzcxeEFn?=
 =?utf-8?B?SnRXY0tQVWxsSmt3b0xUa2lkSHd5dEExOS91bGJ4VCtWbk11UFhidm5iajRx?=
 =?utf-8?B?MnhQQ1FrR0Vra1paRzhTTHlmVnpVaVZraGovRUV4MmhDc21DT004dGU2azZI?=
 =?utf-8?B?VXZwV2QvcWJsSXAzNitxbERmZ3BYdVZ3Wk04SkZIRGVaaEdHSjFVdmozd0h6?=
 =?utf-8?B?T1l5eDZ0SjJBM1JUZUxRUmtkdUlDVU1ZSHVlZFoza0EwN09uSkd0TVdxV3Zo?=
 =?utf-8?B?QlVneFJGY3RtVXJTd3MvcldTUTR6ZTh2b3hnMjBPWDgwQldYRnAzK0loUnZM?=
 =?utf-8?B?UjNCVUJCdjFQamRKZFZjclpRMUhRaFFOYzFoQUpqeGgrQ3ppL0szQ0QraGR2?=
 =?utf-8?B?TGJXb0lzRXJsc3ZHeVJ6U2lSTUdJUXZSK1RobUZ3dGxSRWZiaThaTTNTS3Bv?=
 =?utf-8?B?MndXNmF6THVtaGFCdnZQWjJjaHM2NnRyT1gwNjZYbkVmMzdsL2xEN09OcjU1?=
 =?utf-8?B?TGRDY3MrdGI4WDVNdThGcUwxc29yQ0E5aU4rZXB1VDh0RUZDOGJKeVpQTFg2?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F9326770C42844CBF12699303B47A20@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6aa7f5-85ec-44af-b21e-08daa263c1a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2022 21:44:16.0645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8l8jOHKVqLehxS1mcmYPodqfEwPSw+NIWtLB+6z+0XvVYJdrXarwgQJtiEp83Eu4MyC/qf/e+SADsZs5vOqPXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4354
X-Proofpoint-ORIG-GUID: yHS3KTf5Bsqr7U8b8b2VR4Gueco7Pp3E
X-Proofpoint-GUID: yHS3KTf5Bsqr7U8b8b2VR4Gueco7Pp3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_13,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxscore=0 mlxlogscore=846 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209290137
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBTZXAgMjksIDIwMjIsIEZlbGlwZSBCYWxiaSB3cm90ZToNCj4gVGhpbmggTmd1eWVu
IGhhcyBhZ3JlZWQgdG8gYmVjb21lIHRoZSBuZXcgZHdjMyBtYWludGFpbmVyIHNlZWluZyB0aGF0
DQo+IEkgaGF2ZW4ndCBoYWQgdGltZSB0byBkZWRpY2F0ZSB0byB0aGUgbWFpbGluZyBsaXN0Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogRmVsaXBlIEJhbGJpIDxiYWxiaUBrZXJuZWwub3JnPg0KPiAt
LS0NCj4gIE1BSU5UQUlORVJTIHwgMyArLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTDQo+IGluZGV4IGY1Y2E0YWVmZDE4NC4uMmNkMjliNGFkZDgxIDEwMDY0NA0KPiAt
LS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlOVEFJTkVSUw0KPiBAQCAtNTg5OCwxMCArNTg5
OCw5IEBAIFQ6CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvYmFsYmkvdXNiLmdpdA0KPiAgRjoJZHJpdmVycy91c2IvZHdjMi8NCj4gIA0KPiAgREVTSUdO
V0FSRSBVU0IzIERSRCBJUCBEUklWRVINCj4gLU06CUZlbGlwZSBCYWxiaSA8YmFsYmlAa2VybmVs
Lm9yZz4NCj4gK006CVRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4g
IEw6CWxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4gIFM6CU1haW50YWluZWQNCj4gLVQ6CWdp
dCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYmFsYmkvdXNi
LmdpdA0KPiAgRjoJZHJpdmVycy91c2IvZHdjMy8NCj4gIA0KPiAgREVWQU5URUNIIFNSRiBVTFRS
QVNPTklDIFJBTkdFUiBJSU8gRFJJVkVSDQo+IC0tIA0KPiAyLjM3LjMNCj4gDQoNCkFja2VkLWJ5
OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRo
aW5o
