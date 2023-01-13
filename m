Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 867956688E2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jan 2023 02:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbjAMBJD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 20:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbjAMBJB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 20:09:01 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6EF626A
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 17:08:59 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30D05TCq030760;
        Thu, 12 Jan 2023 17:08:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=ern6wx6iOihY5DhdTySb1SyCINTF0Wu0CDY2QvfBgAg=;
 b=vCZRyAojbRCDlgl2cK35zOXzBcKUfkqPmDipIykpbOT5EXW0mQSt/MQHxYPS61sGFQwv
 eVQjXAfv1qlmWXQYtXHJLhW1tEvDcUbvgzuliSYYUYnjBGO5QEQC9KWSQt6BYU6wDhgF
 5iGV/yQBcA9oIVL3qUrRvlhnqt8ik+vCjfMruZALjlLuz/YkCKrt0gqTWmmR7JFDzFK5
 GGSoB0CPsbu9is6+psptqN6K7laKrIjhAH+H9fm3vpJkcYz5ytN9+ldPkHdTC/x00uQx
 JRvQ4eMLPE4UVO4oQKGkJaHsqxG0oGpxLktkzUQBOb/dfQX+bmO+TlYLUWSu0MI/gpYu yg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n1k4dhk33-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Jan 2023 17:08:51 -0800
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 329EA40099;
        Fri, 13 Jan 2023 01:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1673572131; bh=ern6wx6iOihY5DhdTySb1SyCINTF0Wu0CDY2QvfBgAg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Pk3QFUNNytziPyABGAvkZtTxlR2hCXKea0a7JwbRiJlONilgTMvwEUobkXZottofr
         UKEICVKDYp8uP6qbhXLdfLtEloNo+Z8Gv8uKiGDEXeJi/9yC3z5lSPV6GTZ/Fl+huO
         wale9Il5pDYj57LwCFuAcnu1hQSW8TeuH92LLw4i21rA3gDgffEv5eqfMiv8l7F4Fe
         Aw9Cy1+uA6faUZrKy7uBDzt+BusVF2R3OD/a3sT3q1ZoXAGg31I6A5NnPKcBzSse/Z
         +jWlpQg4sN7dLy5ZVakGOKcUgRw2YGPYFP4cf7/oC9/AZdrzNRX5oX4jY5WtnergRA
         2IxMacZuuXvLg==
Received: from o365relay-in.synopsys.com (us03-o365relay7.synopsys.com [10.4.161.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 91615A007F;
        Fri, 13 Jan 2023 01:08:50 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 64290A004A;
        Fri, 13 Jan 2023 01:08:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mumHKXiL";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2wN7bqauOQpaiLEIUPWZqtW0sitxyjH/yinBA2N9D0sCXtf+3fA76t3fcZLjnayFsLM4Nk3UbtaBkDSKJbtGrmsDSVbXDj1WfZV2eOAlHHwDXkoc3cqtG2fPO7BUsdus0hKAw553OkoX87NVx0DuwJs+hEDcbSHjvBcy2y271mCJBtkkz9yCY4MbVBbJjwT82YVeyYHE9x+rZ0qKpzD6Wx0FVS5w1Ovk+ObOfSOMQzz0lYqgYiA/4nr7fQnvjjHSVnMzZ8N7MY/9534WFOpBXKXOJbStreMf+sV0IBZFlXmgWMEO3fCCgDjrGVctadeNYpEoxC5teqqKZ9plC5PFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ern6wx6iOihY5DhdTySb1SyCINTF0Wu0CDY2QvfBgAg=;
 b=CS/s1SUQnzRBKqTo0625Ec/DrqRoHt2cBRUfpPvltduJOmooicKwpLWbCT6Unov3cyP0nDbhSHzOOt2fFwmqP9ejwaZun0k8B+qDWW5sSZyeD+u628Qts6zPfB/I1BGwyNtbb9LSwk0TjGS3vHtoZZoSGgAwQ4XQGo23ItLIdce5zWJFIsMnKeI5XD9ksusHRY5CX3ltSCDCDjrm15cmt+VcyVUj5s7S/Y9zH2psfdiNLF12ehxTl8O1MR/i4Kx1ClZxGac7+/7U9czjxZWNO1medkMmiM8jFZEviZk/pZTJwVV6GwwKl/AJ98sCpeTIg9+aSoZC/+min2yKKtIyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ern6wx6iOihY5DhdTySb1SyCINTF0Wu0CDY2QvfBgAg=;
 b=mumHKXiLsHS1gVIg7QAsSHd6HyqQyBNG4svqX6ch0+i2hWYGVDOL1cZEItPVE7daaG5+SA69yqwmQGJjcfKaf7fckd1aM113wlnXM6MXpNPm678TJRIOKUa3STV9b+w2ZNWZIEQepC6nfvRr/wLJ1F1CH7T9ArcjPP1RJKfbCKA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MW3PR12MB4570.namprd12.prod.outlook.com (2603:10b6:303:5f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 01:08:47 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 01:08:46 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Topic: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Index: AQHZIbBPDcqFUUga/0S7en4fefnHfa6Vct4AgAACR4CAA2I5gIABN2uAgAGE/IA=
Date:   Fri, 13 Jan 2023 01:08:46 +0000
Message-ID: <20230113010841.ougwmotzlm56nciz@synopsys.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-2-git-send-email-quic_linyyuan@quicinc.com>
 <PA4PR04MB9640E527BFC0CDA519DD3BF989FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <e8ab0a98-c53b-5db0-d9c2-04258eabd945@quicinc.com>
 <PA4PR04MB964044E1882A24A5EC122B6D89FC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <3706dc91-9126-bef2-4926-ee184002e889@quicinc.com>
In-Reply-To: <3706dc91-9126-bef2-4926-ee184002e889@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MW3PR12MB4570:EE_
x-ms-office365-filtering-correlation-id: a4837251-998d-4f0a-a631-08daf502b8dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vg1rx9qiqTxR/SCtegp4etk4UeEnhB5PSf0foHNJ+h2B/wcycb1P5X7p7v0lvaLeGLRNJAL63w2Cciue8B/wzCEbalurw7OZV8R7v/3LKbAuuwq5livlfFv/J9KbEBum32rQX16ObJbt6wVZLhLoGvx3qGhEAFN4qwm1FQqoYd7S4QwiV/Kto16D1cZVOko1+JdNiSQounNmJIxd/32WlTL8s+NZKLUvaIXGOTJnuIP5THC1OjLlZt/c7n1ZqSyQWZ5h1RLYQRt92VCftpPjflfhGaCutLN0qCZFK0k45J0lKEUqTwHwWNFpuajfFjYbkjZyRZ1YH2hOoeyCE7czawH2bpMyxhhSeOUhl9llPH8IbqkMf9JXIrzGgtetydsPO2fmAs3EC2wRGp3v5IUhktrpORWtRuuBZDZLHfILDTn/EO6VOzImk6FUNE4ROM6sfvra5wXeakl3LhUwiMdIg8+tAlWSihdx0AdsPyrx32QuFysK2GEnKG8FTMwGzl4SL0VSBB0V2Jv3m2kqqVZpKixZ6hY0bllcJ3JzZgmXWH2vvG0SZxt61j7/iEvk301uSGMXJVmTan+BWrEIenXzV5xSZQsMO6eQ98DTzvHvvZXomjKe5qs9BHw9pENPztLeZ3c9svy7csaUpwrt9yu9JIeVkQdDYjoScPMfAD6cPy51PCU1wNXlZJczLG3zpA+7YEZb2bk5ANE62aHfjH1CyYv41uIA9pgW36cYoufoICQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199015)(6506007)(6916009)(5660300002)(2906002)(64756008)(36756003)(66446008)(53546011)(8936002)(83380400001)(122000001)(8676002)(66476007)(6512007)(966005)(38100700002)(41300700001)(4326008)(38070700005)(478600001)(6486002)(26005)(66556008)(186003)(66946007)(76116006)(71200400001)(86362001)(1076003)(2616005)(316002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGVPNmFvelEyVEE2YXd0eHgwYjRuZHBxSnlzT1BmYjNUcyt0UncvU285OG4x?=
 =?utf-8?B?OVh2Z1NwVTFVdmtGMjB5TXg1WVJ3bTZDZkhkZnM4VmNqQnYvckZrWHFmMWox?=
 =?utf-8?B?T245SlFBUEMwNXd1eXA1dWpoeUV2SzN0NEltaFdpY1FhN3FlYXhzZjdodEQ2?=
 =?utf-8?B?RWIxQlJuaTJ6NEZFM1FHRnk1b2l6alhnaFBFamlOTnpmMlMwbEg3OVBzbzZV?=
 =?utf-8?B?Uy9vZll2VWtCQmNUVlZCM3Exa25GOGhxYlkzS2lUT212ZU5uTE8xY05tVURw?=
 =?utf-8?B?OWQ2ZzlwRHA2R01OWVI3c1V1KzNVcEFxNTJYS1E2YnUzQVN6N2FiZFZwVXVR?=
 =?utf-8?B?NzNKbEljT1MyeXFOb2I2MGZPc25EUllqZ1FPNkFuemZGMU5ERk95dW81Q0h6?=
 =?utf-8?B?ZUNMQlR3Vjg0cVNqb29CMExYazlCZ21WK0xEeDZ4L3cwTXRwS3pnM2xkdnBJ?=
 =?utf-8?B?b0xqS3lJWmdRR3RGbmp5cW15Q29iVnZHTlNJSGRhYm85QzJhcWUrNFNMVUV5?=
 =?utf-8?B?Vk5UYmtWQTZCOWFwT2lNVmExOE80aTBsenhTb1VwRUIyd2lDaWlLTFdYMmdE?=
 =?utf-8?B?MWVld2N6Y01pWmUxcHgxcE5kSXhKdE5ESEZ3YmhvZFZuNFAxNlpLWmtyRVJK?=
 =?utf-8?B?QlpReEU2UzljcGIzQU5YQmswZmFnR2hoTDdqbzg5ZktJaWx1MTFjTmRpc2Qz?=
 =?utf-8?B?MTJFTC85TTFxejZhdXNlUlRUTEhlTDAzVmx2RGwzWk1RVDNyQlBsN3pVZ2k3?=
 =?utf-8?B?dVg1cksvZkZjOU1CMXpMbyszakZuMndGOVJsNWd1OUtxU1NJREhGbExpeE5L?=
 =?utf-8?B?UCtqUzRQeStCWldQVzBHRVkvWG5IRnZYSjdmYTZ5aWtMRDR1VVlpb0dtNXlF?=
 =?utf-8?B?RjM4bUt2ZkRZTEFlcTcyNmhHSEtEMUdJZXk1VkdmR2o3QjVlMkQrK0k4SWl3?=
 =?utf-8?B?dlZtUTg4NVpyVUxOdG1CUks1RUVIVi9KRVRFdXk4ZmJENHRLdzBnUkNmS3pV?=
 =?utf-8?B?ZlhlWmh4NVE3a3BJbmhMMDYwVzBvWUdwVzVndC80SHpXTElVN0V2dXhjdlhQ?=
 =?utf-8?B?bjBPcnhNOGJSWEJuZVpQN09HWENTKzRjZk5ta0NMZmI5aWhvQ0dtQyt5SUpR?=
 =?utf-8?B?Q2d0TlhldkJQL0lJTitxcEdoaDBHTEpLdlJlTU5jQVVBUTl6YW1zMjBDQW56?=
 =?utf-8?B?QktZUXVJSFYvWEdxRG0rallnNWlvNmpzTndTa2pING5adWJhcG9kL0lIQmFo?=
 =?utf-8?B?VnJsQ2JvRTB3SWlMV0c3anNrbEluaCtUTlRTL1JvL2lDeVF0dzBPblVaVTVa?=
 =?utf-8?B?QjJSM1pHdEZPT1VXLzhRY0tpbkZ2L0E4dlQrK291dWFVNVJoOTA5cjM1OHdZ?=
 =?utf-8?B?ZUpwQ3k4Z2NQbVluc21XVzlQbzJqWVJKZEtnQlRwUU9JejZDUGppbnZKL1Jx?=
 =?utf-8?B?b2Z1WUQzSmNMc3ZtM3lxM2xDbFlDMFBoN0I1ckZVRXZ6czdSTThHWGpRczZD?=
 =?utf-8?B?TTlzWHN5WHFnV1RuNUhNdU8zazJYZG9JQWhaNU1lSjRtRzYvbUlOOGY5UkxD?=
 =?utf-8?B?ZFhQenZoWkc0Z1NCbitIazErUG1JWjlVVkxkU3JDc0k2MC80STdGZjJqcE54?=
 =?utf-8?B?eDR0Q25oR3dZa1FNalZ0ejI3QTRtZEJhTzF5V05QaEt2aXdUUE9NcHhaV2dG?=
 =?utf-8?B?RXphSW1Bdmx3MG9lU2FvaFl6ZU9SRkt5SzdVMnpFTFRIZStJZVN1VDRJQnVB?=
 =?utf-8?B?eUtJRGJaV2I0YUlZMit4WjYrdUwyYjlHT2d5b1B6K3gzNjVLbG9aZWdYZExa?=
 =?utf-8?B?NmZsV3ljd21QN1hkSldzalZ1d016MG9zVjZxWC9ONDFzK3VjZHp6TjVYZkZD?=
 =?utf-8?B?dXJhVTY1d0ZTNFFGWmRtdXNIaG1NVGVzejFXUUxpZW5WQ3doVzBXR0RMMFFk?=
 =?utf-8?B?OGZjUjMwMThCOW5aTEdWVWhpVG1hMVZKbFRTNnlJdVhoK3pZdXU5SXJNNVhR?=
 =?utf-8?B?eUN6Q3ZJbUMzTTNjaWtRZ0lodmsxWm9hcDJXeVlrZDlCL3ZGK3dvSHJCeEwz?=
 =?utf-8?B?ZTM0a2RFa3c1WUhQUndVTFduTlEya0dvcVBQUXEwYUVRd1RGR1hsV1VOVHdQ?=
 =?utf-8?B?QjhzdmIyOC8ydCtMTi82Nk1tbkQrQTU4a0IwVW9YblI2RU9uOHlGZUVQYzBa?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B7F6ED8BFB6E94FA859A18ED304426F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: v3/lF+WokXuS74nYLyFwpxPZ14DTAjeNWLWlGRIN5fc6agI3813fdnzCv5FwQzhIjwDNUuRiErgAMAYoD2CZG3E+RADyDcbAzZKlUrf+crhbGYfMS1XnXBbTDJnKYOc/kTPqXRMxeOj0iWsG0WLxHzBAe7MR58ix3uKG3cY8uOhOifSQNu1Gz1oTo5vcwBB3KcxP8BWvJ0G63qM6V029UBfqsBY1WVLB+DRWsKGk23Y5UCc0IWpEvHD1hmsQU+izaOhQgiygykkiHeGYi9PYoayC/PAQAqcrnsdKWweVrqqrqYjaIj0RxbWkxi23zSAMFsk6uDqyAbSc8PYEyf9td1gDnAt2uW/fOiL6QY5MQl0dmAPdM3LDZjO29k3+H1FlOEotLUOfSE8RTayly3c/Jdx8Tfm7btw4qYEiDIuthbQAsWBHZuZoANYnA1l+VfS0qyli6Ij7poy37WFKHHxETHsirytNyCH4JXw0S3uATNIzZxHfAHI0jXne22q4ckauJIGjkn689rC8tjueCCDoraZPWuS7FecUyvWscE2QQn2sRbXWzdFoE/DiPdLpdOjDaonfA/xbjUdjCk+9zo/vCs+YQMDVspRFgZCmqSIhV6WX5D3zHQT2t2Uezv/h5L/0ohsY3E+nS2G7H6npQe3ft8FfqjmunOZ52VYP9QIWDdljzw3Rp4+xwQpYUFjt961KhamjFPZMgLjFrcvhPRpM7ZAsdMUDxdyQXwJp4n5cZvDgmHYayolSBko8ezEYdgVWz8Q71D5wvEmPg+raNW4fvc51NDvqtevfbXcrhzAP4RebcVzE5WIAW5F5NHVViYxbomBvQRT99wL7Qzb5HmaeFuPnZiugFBTL5ap49LS1IHrCpZnS30Uv/TVOmG+CkZEVAWVXfJmT0UZLIGzeZkUIFIhdDIMZgeEe6R8bV1jsuLE=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4837251-998d-4f0a-a631-08daf502b8dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 01:08:46.6085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zAIMXUpkhert/6KjQ0bVlOn9koKp6uUPmlW0f9jidT2aTPixeMBWZtG9fgn8CwjEY6FF8lqtABSWGZjGK0GZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570
X-Proofpoint-ORIG-GUID: aX_yGaQCRu61VQAKx-hhs2b2vBYweV0F
X-Proofpoint-GUID: aX_yGaQCRu61VQAKx-hhs2b2vBYweV0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_14,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1011
 mlxlogscore=832 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301130006
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQpIaSwNCg0KT24gVGh1LCBKYW4gMTIsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IA0KPiBP
biAxLzExLzIwMjMgMzoyMSBQTSwgSnVuIExpIChPU1MpIHdyb3RlOg0KPiA+IA0KPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IExpbnl1IFl1YW4gPHF1aWNfbGlu
eXl1YW5AcXVpY2luYy5jb20+DQo+ID4gPiBTZW50OiBNb25kYXksIEphbnVhcnkgOSwgMjAyMyAx
MTo0MiBBTQ0KPiA+ID4gVG86IEp1biBMaSAoT1NTKSA8anVuLmxpQG9zcy5ueHAuY29tPjsgR3Jl
ZyBLcm9haC1IYXJ0bWFuDQo+ID4gPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBUaGlu
aCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+ID4gPiBDYzogbGludXgtdXNi
QHZnZXIua2VybmVsLm9yZzsgSmFjayBQaGFtIDxxdWljX2phY2twQHF1aWNpbmMuY29tPjsgV2Vz
bGV5DQo+ID4gPiBDaGVuZyA8cXVpY193Y2hlbmdAcXVpY2luYy5jb20+DQo+ID4gPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIvM10gdXNiOiBkd2MzOiBhZGQgZHdjM19yZWFkbF9ub3RyYWNlKCkgZnVu
Y3Rpb24NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBPbiAxLzkvMjAyMyAxMTozMyBBTSwgSnVuIExp
IChPU1MpIHdyb3RlOg0KPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
PiA+ID4gRnJvbTogTGlueXUgWXVhbiA8cXVpY19saW55eXVhbkBxdWljaW5jLmNvbT4NCj4gPiA+
ID4gPiBTZW50OiBGcmlkYXksIEphbnVhcnkgNiwgMjAyMyA1OjIyIFBNDQo+ID4gPiA+ID4gVG86
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBUaGluaCBO
Z3V5ZW4NCj4gPiA+ID4gPiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gPiA+ID4gPiBD
YzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgSmFjayBQaGFtIDxxdWljX2phY2twQHF1aWNp
bmMuY29tPjsNCj4gPiA+ID4gPiBXZXNsZXkgQ2hlbmcgPHF1aWNfd2NoZW5nQHF1aWNpbmMuY29t
PjsgTGlueXUgWXVhbg0KPiA+ID4gPiA+IDxxdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tPg0KPiA+
ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCAyLzNdIHVzYjogZHdjMzogYWRkIGR3YzNfcmVhZGxfbm90
cmFjZSgpIGZ1bmN0aW9uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhlcmUgYXJlIG11bHRpcGxl
IHBsYWNlcyB3aGljaCB3aWxsIHJldHJ5IHVwIHRvIDEwMDAwIHRpbWVzIHRvIHJlYWQNCj4gPiA+
ID4gPiBhIHJlZ2lzdGVyLA0KPiA+ID4gPiBJdCdzICJ1cCB0byIsIEkgdGhpbmsgYXQgbm9ybWFs
IGNhc2UsIGl0J3MgYSBzbWFsbCBudW1iZXIsIGlmIGEgbGFyZ2UNCj4gPiA+ID4gSXRlcmF0aW9u
IG51bWJlciBpcyBvYnNlcnZlZCwgcHJvYmFibHkgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIHNo
b3VsZA0KPiA+ID4gPiBiZSBjaGVja2VkPw0KPiA+ID4gZG8geW91IG1lYW4gdGhlIG9yaWdpbmFs
IGxvb3AgY291bnQgY2FuIGJlIHJlZHVjZWQgPw0KPiA+IE5vLiBJIG1lYW4gdGhlIG1heCBsb29w
IG51bWJlciBpcyBub3QgYSBwcm9ibGVtIGF0IGdvb2QgSFcuDQo+ID4gV2hhdCdzIHRoZSBhY3R1
YWwgbG9vcCBudW1iZXIgb24geW91IEhXPw0KPiANCj4gDQo+IGkgZGlkbid0IGNoZWNrIGl0LiBo
b3cgYWJvdXQgeW91ID8gbm8gbWF0dGVyIHdoYXQgaXMgZ29vZCBIVyBvciBiYWQgSFcsDQo+IGN1
cnJlbnQgY29kZSBkZWZpbmUgYSBiaWcgbnVtYmVyLg0KPiANCj4gDQo+IGFjdHVhbGx5IGkgdGhp
bmsgd2Ugc2hvdWxkIG5vdCBkaXNjdXNzIGlzIGl0IGEgZ29vZCBudW1iZXIgb3Igbm90Lg0KPiAN
Cj4gd2hhdCBpcyBwdXJwb3NlIHRvIHVzZSBzdGF0dXMgcmVnaXN0ZXIgcmVjb3JkID8gZG8gaXQg
Z2l2ZSB5b3UgYW55DQo+IGluZm9ybWF0aW9uIHRvIHVuZGVyc3RhbmQgdGhlIElQIGJlaGF2aW9y
ID8NCj4gDQoNCldoaWxlIHNvbWUgcG9sbGluZyBudW1iZXJzIHNlZW0gbGFyZ2UsIHdlIHNob3Vs
ZCBub3QgcmVtb3ZlIHRoZSB0cmFjaW5nDQpldmVudHMgZHVyaW5nIHBvbGxpbmcuIFRoZXJlIGFy
ZSB1c2VmdWwgaW5mbyBpbiB0aGUgc3RhdHVzIHJlZ2lzdGVyIHdoZW4NCnRoZXJlJ3MgYSB0aW1l
b3V0LiBBbHNvLCB0aGUgbnVtYmVyIG9mIHBvbGxzIG5lZWRlZCBmb3IgY2VydGFpbiBzdGF0ZQ0K
Y2hhbmdlIGlzIHVzZWZ1bCBkYXRhIHBvaW50IGZvciBkZWJ1Zy4NCg0KV2hhdCB3ZSBtYXkgd2Fu
dCB0byB1cGRhdGUgaXMgbm90IGRlcGVuZCBvbiB0aGUgcmVnaXN0ZXIgcmVhZCBkZWxheSBmb3IN
CnRoZSBwb2xsaW5nIGR1cmF0aW9uLiBEaWZmZXJlbnQgc2V0dXAgd2lsbCBoYXZlIGRpZmZlcmVu
dCBkZWxheS4NCg0KSWYgd2Ugd2FudCB0byBkaXNhYmxlIGl0IGZvciBkZWJ1Z2dpbmcgcHVycG9z
ZSwgbWFrZSBzdXJlIHRvIGhhdmUgdGhlDQpkZWZhdWx0IG9wdGlvbiBhcyBlbmFibGVkLg0KDQpB
cyBmb3IgdGhlIGluY29uc2lzdGVudC9sYXJnZSBwb2xsaW5nIGNvdW50LCB3ZSBjYW4gcmV2aWV3
IGFuZCByZXZpc2l0DQp0aGUgY2hhbmdlIExpIEp1biBkaWQgYSB3aGlsZSBhZ28gdG8gdXNlIHJl
YWRsX3BvbGxfdGltZW91dF9hdG9taWMNCmluc3RlYWQ6DQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC11c2IvODdibG15bXdsei5mc2ZAa2VybmVsLm9yZy9ULyN0DQoNClRoYW5rcywNClRo
aW5oDQoNCj4gDQo+ID4gDQo+ID4gPiA+ID4gd2hlbiB0cmFjZSBldmVudCBlbmFibGUsIGl0IGlz
IG5vdCBnb29kIGFzIGFsbCBldmVudHMgbWF5IHNob3cgc2FtZSBkYXRhLg0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IEFkZCBkd2MzX3JlYWRsX25vdHJhY2UoKSBmdW5jdGlvbiB3aGljaCB3aWxsIG5v
dCBzYXZlIHRyYWNlIGV2ZW50DQo+ID4gPiA+ID4gd2hlbiByZWFkIHJlZ2lzdGVyLg0KPiA+ID4g
PiBTaW1wbHkgZHJvcCBwYXJ0IG9mIHJlZ2lzdGVyIHJlYWQgaXMgbm90IGdvb2QsIHRoaXMgY2F1
c2UgdGhlIGZpbmFsIGlvDQo+ID4gPiA+IHRyYWNlIG9mIGR3YzMgaXMgbm90IGNvbXBsZXRlLCBJ
IHRoaW5rIGEgZnVsbC9jb21wbGV0ZSBmb290IHByaW50IG9mDQo+ID4gPiA+IGlvIHJlZ2lzdGVy
IHJlYWQvd3JpdGUgc2hvdWxkIGJlIGtlcHQuDQo+ID4gPiBpZiB5b3UgcHJlZmVyIHNhdmUgdGhl
bSwgaXMgdGhlcmUgYSBiZXR0ZXIgc29sdXRpb24gPw0KPiA+IElmIHRoZSBhY3R1YWwgbG9vcCBu
dW1iZXIgaXMgbm90IGEgcHJvYmxlbSwgdGhlbiBJIHRoaW5rIGN1cnJlbnQNCj4gPiB0cmFjZSBp
cyBqdXN0IGZpbmUuDQo+ID4gDQo+ID4gTGkgSnVuDQo+ID4gDQo+ID4gPiA+IExpIEp1bg0KPiA+
ID4gPiANCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMaW55dSBZdWFuIDxxdWljX2xpbnl5dWFu
QHF1aWNpbmMuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICAgIGRyaXZlcnMvdXNiL2R3
YzMvY29yZS5jICAgfCAgMiArLQ0KPiA+ID4gPiA+ICAgIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMgfCAxMiArKysrKystLS0tLS0NCj4gPiA+ID4gPiAgICBkcml2ZXJzL3VzYi9kd2MzL2lvLmgg
ICAgIHwgMTAgKysrKysrKysrKw0KPiA+ID4gPiA+ICAgIGRyaXZlcnMvdXNiL2R3YzMvdWxwaS5j
ICAgfCAgMiArLQ0KPiA+ID4gPiA+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBpbmRleA0KPiA+
ID4gPiA+IDQ3NmI2MzYuLjU1MGJiMjMgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0K
PiA+ID4gPiA+IEBAIC0yOTcsNyArMjk3LDcgQEAgaW50IGR3YzNfY29yZV9zb2Z0X3Jlc2V0KHN0
cnVjdCBkd2MzICpkd2MpDQo+ID4gPiA+ID4gICAgCQlyZXRyaWVzID0gMTA7DQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gICAgCWRvIHsNCj4gPiA+ID4gPiAtCQlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+
cmVncywgRFdDM19EQ1RMKTsNCj4gPiA+ID4gPiArCQlyZWcgPSBkd2MzX3JlYWRsX25vdHJhY2Uo
ZHdjLT5yZWdzLCBEV0MzX0RDVEwpOw0KPiA+ID4gPiA+ICAgIAkJaWYgKCEocmVnICYgRFdDM19E
Q1RMX0NTRlRSU1QpKQ0KPiA+ID4gPiA+ICAgIAkJCWdvdG8gZG9uZTsNCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+ID4gPiBpbmRleA0KPiA+ID4gPiA+IDc4OTk3NjUuLmYy
MTI2ZjI0IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMN
Cj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ID4gPiA+ID4gQEAg
LTk3LDcgKzk3LDcgQEAgaW50IGR3YzNfZ2FkZ2V0X3NldF9saW5rX3N0YXRlKHN0cnVjdCBkd2Mz
ICpkd2MsDQo+ID4gPiA+ID4gZW51bSBkd2MzX2xpbmtfc3RhdGUgc3RhdGUpDQo+ID4gPiA+ID4g
ICAgCSAqLw0KPiA+ID4gPiA+ICAgIAlpZiAoIURXQzNfVkVSX0lTX1BSSU9SKERXQzMsIDE5NEEp
KSB7DQo+ID4gPiA+ID4gICAgCQl3aGlsZSAoLS1yZXRyaWVzKSB7DQo+ID4gPiA+ID4gLQkJCXJl
ZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0RTVFMpOw0KPiA+ID4gPiA+ICsJCQlyZWcg
PSBkd2MzX3JlYWRsX25vdHJhY2UoZHdjLT5yZWdzLCBEV0MzX0RTVFMpOw0KPiA+ID4gPiA+ICAg
IAkJCWlmIChyZWcgJiBEV0MzX0RTVFNfRENOUkQpDQo+ID4gPiA+ID4gICAgCQkJCXVkZWxheSg1
KTsNCj4gPiA+ID4gPiAgICAJCQllbHNlDQo+ID4gPiA+ID4gQEAgLTEyOCw3ICsxMjgsNyBAQCBp
bnQgZHdjM19nYWRnZXRfc2V0X2xpbmtfc3RhdGUoc3RydWN0IGR3YzMgKmR3YywNCj4gPiA+ID4g
PiBlbnVtIGR3YzNfbGlua19zdGF0ZSBzdGF0ZSkNCj4gPiA+ID4gPiAgICAJLyogd2FpdCBmb3Ig
YSBjaGFuZ2UgaW4gRFNUUyAqLw0KPiA+ID4gPiA+ICAgIAlyZXRyaWVzID0gMTAwMDA7DQo+ID4g
PiA+ID4gICAgCXdoaWxlICgtLXJldHJpZXMpIHsNCj4gPiA+ID4gPiAtCQlyZWcgPSBkd2MzX3Jl
YWRsKGR3Yy0+cmVncywgRFdDM19EU1RTKTsNCj4gPiA+ID4gPiArCQlyZWcgPSBkd2MzX3JlYWRs
X25vdHJhY2UoZHdjLT5yZWdzLCBEV0MzX0RTVFMpOw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ICAg
IAkJaWYgKERXQzNfRFNUU19VU0JMTktTVChyZWcpID09IHN0YXRlKQ0KPiA+ID4gPiA+ICAgIAkJ
CXJldHVybiAwOw0KPiA+ID4gPiA+IEBAIC0yMzksNyArMjM5LDcgQEAgaW50IGR3YzNfc2VuZF9n
YWRnZXRfZ2VuZXJpY19jb21tYW5kKHN0cnVjdCBkd2MzDQo+ID4gPiA+ID4gKmR3YywgdW5zaWdu
ZWQgaW50IGNtZCwNCj4gPiA+ID4gPiAgICAJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0RH
Q01ELCBjbWQgfCBEV0MzX0RHQ01EX0NNREFDVCk7DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gICAg
CWRvIHsNCj4gPiA+ID4gPiAtCQlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19ER0NN
RCk7DQo+ID4gPiA+ID4gKwkJcmVnID0gZHdjM19yZWFkbF9ub3RyYWNlKGR3Yy0+cmVncywgRFdD
M19ER0NNRCk7DQo+ID4gPiA+ID4gICAgCQlpZiAoIShyZWcgJiBEV0MzX0RHQ01EX0NNREFDVCkp
IHsNCj4gPiA+ID4gPiAgICAJCQlzdGF0dXMgPSBEV0MzX0RHQ01EX1NUQVRVUyhyZWcpOw0KPiA+
ID4gPiA+ICAgIAkJCWlmIChzdGF0dXMpDQo+ID4gPiA+ID4gQEAgLTM3NSw3ICszNzUsNyBAQCBp
bnQgZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoc3RydWN0IGR3YzNfZXAgKmRlcCwNCj4gPiA+ID4g
PiB1bnNpZ25lZCBpbnQgY21kLA0KPiA+ID4gPiA+ICAgIAl9DQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gICAgCWRvIHsNCj4gPiA+ID4gPiAtCQlyZWcgPSBkd2MzX3JlYWRsKGRlcC0+cmVncywgRFdD
M19ERVBDTUQpOw0KPiA+ID4gPiA+ICsJCXJlZyA9IGR3YzNfcmVhZGxfbm90cmFjZShkZXAtPnJl
Z3MsIERXQzNfREVQQ01EKTsNCj4gPiA+ID4gPiAgICAJCWlmICghKHJlZyAmIERXQzNfREVQQ01E
X0NNREFDVCkpIHsNCj4gPiA+ID4gPiAgICAJCQljbWRfc3RhdHVzID0gRFdDM19ERVBDTURfU1RB
VFVTKHJlZyk7DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQEAgLTIzMjQsNyArMjMyNCw3IEBAIHN0
YXRpYyBpbnQgX19kd2MzX2dhZGdldF93YWtldXAoc3RydWN0IGR3YzMgKmR3YykNCj4gPiA+ID4g
PiAgICAJcmV0cmllcyA9IDIwMDAwOw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ICAgIAl3aGlsZSAo
cmV0cmllcy0tKSB7DQo+ID4gPiA+ID4gLQkJcmVnID0gZHdjM19yZWFkbChkd2MtPnJlZ3MsIERX
QzNfRFNUUyk7DQo+ID4gPiA+ID4gKwkJcmVnID0gZHdjM19yZWFkbF9ub3RyYWNlKGR3Yy0+cmVn
cywgRFdDM19EU1RTKTsNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgICAJCS8qIGluIEhTLCBtZWFu
cyBPTiAqLw0KPiA+ID4gPiA+ICAgIAkJaWYgKERXQzNfRFNUU19VU0JMTktTVChyZWcpID09IERX
QzNfTElOS19TVEFURV9VMCkgQEAgLTI1MTAsNw0KPiA+ID4gPiA+ICsyNTEwLDcgQEAgc3RhdGlj
IGludCBkd2MzX2dhZGdldF9ydW5fc3RvcChzdHJ1Y3QgZHdjMyAqZHdjLCBpbnQNCj4gPiA+ID4g
PiAraXNfb24sIGludA0KPiA+ID4gPiA+IHN1c3BlbmQpDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
ICAgCWRvIHsNCj4gPiA+ID4gPiAgICAJCXVzbGVlcF9yYW5nZSgxMDAwLCAyMDAwKTsNCj4gPiA+
ID4gPiAtCQlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19EU1RTKTsNCj4gPiA+ID4g
PiArCQlyZWcgPSBkd2MzX3JlYWRsX25vdHJhY2UoZHdjLT5yZWdzLCBEV0MzX0RTVFMpOw0KPiA+
ID4gPiA+ICAgIAkJcmVnICY9IERXQzNfRFNUU19ERVZDVFJMSExUOw0KPiA+ID4gPiA+ICAgIAl9
IHdoaWxlICgtLXRpbWVvdXQgJiYgISghaXNfb24gXiAhcmVnKSk7DQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvaW8uaCBiL2RyaXZlcnMvdXNiL2R3
YzMvaW8uaCBpbmRleA0KPiA+ID4gPiA+IGQ5MjgzZjQuLmQyNDUxM2UgMTAwNjQ0DQo+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9pby5oDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9pby5oDQo+ID4gPiA+ID4gQEAgLTM3LDYgKzM3LDE2IEBAIHN0YXRpYyBpbmxpbmUg
dTMyIGR3YzNfcmVhZGwodm9pZCBfX2lvbWVtICpiYXNlLA0KPiA+ID4gPiA+IHUzMg0KPiA+ID4g
PiA+IG9mZnNldCkNCj4gPiA+ID4gPiAgICAJcmV0dXJuIHZhbHVlOw0KPiA+ID4gPiA+ICAgIH0N
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiArc3RhdGljIGlubGluZSB1MzIgZHdjM19yZWFkbF9ub3Ry
YWNlKHZvaWQgX19pb21lbSAqYmFzZSwgdTMyIG9mZnNldCkNCj4gPiA+IHsNCj4gPiA+ID4gPiAr
CS8qDQo+ID4gPiA+ID4gKwkgKiBXZSByZXF1ZXN0ZWQgdGhlIG1lbSByZWdpb24gc3RhcnRpbmcg
ZnJvbSB0aGUgR2xvYmFscyBhZGRyZXNzDQo+ID4gPiA+ID4gKwkgKiBzcGFjZSwgc2VlIGR3YzNf
cHJvYmUgaW4gY29yZS5jLg0KPiA+ID4gPiA+ICsJICogVGhlIG9mZnNldHMgYXJlIGFsc28gZ2l2
ZW4gc3RhcnRpbmcgZnJvbSBHbG9iYWxzIGFkZHJlc3Mgc3BhY2UuDQo+ID4gPiA+ID4gKwkgKi8N
Cj4gPiA+ID4gPiArCXJldHVybiByZWFkbChiYXNlICsgb2Zmc2V0KTsNCj4gPiA+ID4gPiArfQ0K
PiA+ID4gPiA+ICsNCj4gPiA+ID4gPiAgICBzdGF0aWMgaW5saW5lIHZvaWQgZHdjM193cml0ZWwo
dm9pZCBfX2lvbWVtICpiYXNlLCB1MzIgb2Zmc2V0LCB1MzINCj4gPiA+ID4gPiB2YWx1ZSkgew0K
PiA+ID4gPiA+ICAgIAkvKg0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2Mz
L3VscGkuYyBiL2RyaXZlcnMvdXNiL2R3YzMvdWxwaS5jIGluZGV4DQo+ID4gPiA+ID4gZjIzZjRj
OS4uN2IyMjBiMCAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL3VscGku
Yw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvdWxwaS5jDQo+ID4gPiA+ID4gQEAg
LTM5LDcgKzM5LDcgQEAgc3RhdGljIGludCBkd2MzX3VscGlfYnVzeWxvb3Aoc3RydWN0IGR3YzMg
KmR3YywgdTgNCj4gPiA+ID4gPiBhZGRyLCBib29sIHJlYWQpDQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gICAgCXdoaWxlIChjb3VudC0tKSB7DQo+ID4gPiA+ID4gICAgCQluZGVsYXkobnMpOw0KPiA+
ID4gPiA+IC0JCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dVU0IyUEhZQUNDKDAp
KTsNCj4gPiA+ID4gPiArCQlyZWcgPSBkd2MzX3JlYWRsX25vdHJhY2UoZHdjLT5yZWdzLCBEV0Mz
X0dVU0IyUEhZQUNDKDApKTsNCj4gPiA+ID4gPiAgICAJCWlmIChyZWcgJiBEV0MzX0dVU0IyUEhZ
QUNDX0RPTkUpDQo+ID4gPiA+ID4gICAgCQkJcmV0dXJuIDA7DQo+ID4gPiA+ID4gICAgCQljcHVf
cmVsYXgoKTsNCj4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+IDIuNy40
