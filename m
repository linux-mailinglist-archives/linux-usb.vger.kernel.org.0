Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD078705FB5
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 08:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjEQGFB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 02:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjEQGFA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 02:05:00 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D9D40DA
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 23:04:58 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34H4bPA8014998;
        Tue, 16 May 2023 23:04:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=fERfkJVn1FNbK1GYLP/OpBc2F1TU4VJ/vJvwWrBCDnU=;
 b=T/lBnjfkszfo6n/9ykEAJ0WrZhWy51Yr4Gt/htZ9s4d7+B2sZby0wFLxrgg4Q3DLGoVe
 XYkv6Tdx9qAaHex6j0FqUqpw2YJGxIn1zKkhBuyOZgA1A1qdf7nlf3QGcUAbzH+i1g7K
 vJN0yEngfSp3HRVVTcOXU6+NqWqvD8zpSzGRNXJ8ngstVxjWe1v+kXjEstjUqM8cFA6k
 NSa5n8bTVX/W5sh9zE64tJ/aaTGCAtE9V9JktBBc/trJq0j1l9466ONVgp1kgGV+9irR
 dZ1hxG373dD7b5W/oBm3GDcflta6Me28gfFtWDlgmv2brjpM+IffEL3Z03DE0zV+Nf/G cw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qj9ftjq29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 May 2023 23:04:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684303475; bh=fERfkJVn1FNbK1GYLP/OpBc2F1TU4VJ/vJvwWrBCDnU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=BUKAWcdPgMfIr9h4juIhBqcVIzfnfWFKcf38DuuKIFk9DTMzCzoqu16gbRp+UYM0G
         iz2WvlTHJAXRg3ZiOmJ/wiKZfJD3RrnvX4fb4GfotPOWzbSDMGsrVlEuOHKaLKQEaF
         3FvcDSxAAOYUDtWn7wRVJBrNNjzUyTPhP6lq6a5NGQ+8v8373hZyh9V5ZiFZqqU/5C
         zV/dfGlFZjRR23bIKaE18BNFtnA0PAyT7+WQinLsVL2ndedP4T2xtYQ3ElwPfAKmlJ
         H9BzJom1wwHnhga7ZMexCsFQcb1W4HnJBjjyVOozP3bFfaVZWocYv/slXgVreL5ps4
         HYSrEzdCZOq0Q==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CEB3B4063D;
        Wed, 17 May 2023 06:04:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3B1B6A0062;
        Wed, 17 May 2023 06:04:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=J5dEc0oN;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9AABF404CE;
        Wed, 17 May 2023 06:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMra6V0wTSU/wSx4y2xIob7GAVO//SUop52ldsMxuXUP2OBrhfmcqB8Ju34CjS3oEg4J7nC30003974Lhd9dUsuKfMfEL8T10/HPeUI3fKZPrpKVglMAxhh1mcFa2its/GJtjagzPn1A5R/1HiPbu092WMBojpPsUwC1QfiBb3I/oF2LDRNrUkbPI9z5UhcR8LXzZmuFQ5JK4ietXZsl1VVIdaLv6TFSTqWvy72MC+n7sOCkHjp/zY/6OaXGoWhJ62O7f5vjL7TjDu/zTH80DR23OtoEEuRQlkKrCYQ2zR+Ob/dLsDPWUBdc53Pgxv8uIpJtkIDgS7W6JuffNows/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fERfkJVn1FNbK1GYLP/OpBc2F1TU4VJ/vJvwWrBCDnU=;
 b=PhUvvrAMeqv/N+RwHoB725QUGdY/JSuqIoY2AilGTQLZyFTTCYGtLuHpAbFiC/Yj9neY5cfM8U9IRnGv4QOEjRSQDz8utN96Pc8AqCsicQGzPgivxSs0mT9qiYWJ5Bz8YlAvr0OfaMPnp1a6v1fvwclAE3NfJJBvOLsVz4/FbpuxnKHFfiYauLzURLQUe46SflJfFTwfPYgO0vQ3E+emK9fpL/ef4Th27W6ch38jlju9s1FM5RroW21rviz9PRlsEgEdrKSyI3i/Fjkbvi7MiUI2fF6WxbnAcIWik0ZxBXFNb+JKyIberLzH6tEnkWQSS+E5qwiZcIgxTcCAnTCoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fERfkJVn1FNbK1GYLP/OpBc2F1TU4VJ/vJvwWrBCDnU=;
 b=J5dEc0oNjEKdhyFzV2/L/+A9/h+hCmUg2/Z67EOrDKSql+aRiSWDLtgrAceAjk1++YzBx4tUY+TUUthi/xbShwquBx0pQyL81vEO9NPEUJtHcCQlvIpWyNOuz9Gv/LCiDoy2k6g1t1B0wGizlU+8yD3y0vlSrdjvEQB/yIGbVgA=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 06:04:31 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::788d:db33:93b1:53f8]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::788d:db33:93b1:53f8%4]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 06:04:30 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     PALAK SHAH <palak.shah@raritan.com>,
        Maynard CABIENTE <maynard.cabiente@raritan.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AdlBdN39U3B888NgQMeEtY3CZon8l67bcCYwgACjvICAdTpx0IAAvFDpgABzRADRMq4GAIAHf6GAgADY0ICAAJzGAA==
Date:   Wed, 17 May 2023 06:04:30 +0000
Message-ID: <0f75819a-cf35-d66a-4a66-bc2ffb0d9526@synopsys.com>
References: <HE1PR0601MB25868E34AF4BA6CEAFE06F5F8DA39@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB339948C507588E0E68556ADBA7AA9@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586BFAE94813BA86BAB12708DAA9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BN8PR12MB3395053B96DF2333794DBBEDA7AB9@BN8PR12MB3395.namprd12.prod.outlook.com>
 <PAXPR06MB85319DCC50F69D0790D5F4198D719@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531E23298F9BA26C1E651AC8D769@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531BF29DA170252843DD5598D769@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531D31F642598C1D9B8555B8D749@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <BYAPR12MB3399F12C79131BE0BEC2B9B0A7799@BYAPR12MB3399.namprd12.prod.outlook.com>
 <PAXPR06MB8531AB0E54440379049AD5D68D799@PAXPR06MB8531.eurprd06.prod.outlook.com>
In-Reply-To: <PAXPR06MB8531AB0E54440379049AD5D68D799@PAXPR06MB8531.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|PH7PR12MB5950:EE_
x-ms-office365-filtering-correlation-id: 0b7d21fe-8b9c-45f5-4392-08db569c9409
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I1WlYA5G2YfEC1RRpeq2u2+jbNy+8DT06jMVBsX7RMEvVBdilyarJDMr3Wx+Eg2/AgpziSaf2LljbWFdUVDBRHFf/qc3anNHw5UCfmCHo9nfJkHpFxCB1tgpujoUI3a88DNT3JZAr3s9ZdRzpX/fgVISXSfkZCkRWeif05mRD8SfjYbeg4bWEnivaKCapSWZbzBQPJvjkauW09fE8TTWNcCB366FFB/3rOLOsd4LZSnBk8a1eJ92DAW6j7hHG2/D5V9pj/XhK4XP7GIpDEmU1Un0crZa/CVYT8vFi9WOqU8aZ+q0yj/3niheIaF8SZRlcd95V6AezBoaFizCR8d9kzYYl1fvWIjhbyB4FI2QDkAaOT8vgAA165PujpcXsScY2C2FS/LOnMChkyjnz+dow8URouNK7c/N/TRw8KfzqHlEGxrpn2P60yq17mnnpPAlz0XBPQeu037t0gr848pukHAg47jywlLwCfvY8AMP9Gk+IOREMjrIhPgwm8dn37iJdGUAMKNyvkFiytMUR7NP+wYO9vw4FtJRxCek3wRr9ByTNlzuKFyAYgKP1U4Zz/8YXdb7i2O2A3z47viOFfvsWhyXPtSquXj3Dk++eq4E18sxkY3sVMwvb+Bo10U8wMV5r1x4415jFcZTSV4IQvyi9LDrEU2wRrIxfgbU8AtfVOd2FaH6aJL/iay6eiWWTtDvngI+0c1KSX/A8b2BVdNlwrn5LtNlJmy0n1NsawrALwE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199021)(83380400001)(66574015)(76116006)(64756008)(66476007)(66446008)(91956017)(2616005)(66946007)(26005)(6486002)(478600001)(66556008)(110136005)(186003)(31696002)(5660300002)(86362001)(8936002)(8676002)(6512007)(38070700005)(316002)(122000001)(2906002)(36756003)(41300700001)(53546011)(6506007)(4326008)(38100700002)(71200400001)(31686004)(45980500001)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzBrYVh3QXZJdUlhMFNkK2NTQTJMUDF3VkF5ZEMrVG9lelZ6b0E3dnIrZHlE?=
 =?utf-8?B?SFFmYWhFbDU2TnlhUkk1WVNKcnRyQ3ZIbmhDbmgxK3hUSHNWSGdYTXUxSDVV?=
 =?utf-8?B?NEsrUFNIS2QzZVBnMWVQSXJCTkhPTjZtaC9OZTkxaVUxWFdlK0ZEUFRrK0cv?=
 =?utf-8?B?dC8zeW1ZZUNVMW95YnpWUDNXSFF0TldSUEVYQklvQ3ZEdFRQd2MrZXo0WDhv?=
 =?utf-8?B?bHBhRFoxQkVOaHJRdjZuQWRlcW1MdFlJbStEU1pzaTFhT3lGakt0VmJyYTBp?=
 =?utf-8?B?ajY5Q3VwYzI2TmFlR2duNjdhSmRPeEpieXEvdXV4cFVXQi90clM0c3dmTDBZ?=
 =?utf-8?B?QzRuWU1MaTFSYXV0bzZ4b2REY1RLMC9pMHkwRDhWZnFpY3dOdUlxbWVDVHJZ?=
 =?utf-8?B?ZmlFaVVLTEt2S0QzR1loa2RadHFZMHRFc2NSZ1REdm82VTBwYlg2T2Z0QVFq?=
 =?utf-8?B?QWNWTVhJMEs1V1hwalpwdEdMWjJtTGcvcGVsMFZ4SWFyM2ZzdGR3djJCZmM2?=
 =?utf-8?B?N0JjaG9wVVlqcHh1UTlZV1AwMHZNUmlXS2wrSmZaQ0VWTGo1Q05HVmZBT2Ew?=
 =?utf-8?B?cnJ5eGJDOHdmcS9UZHJsS2d1QTcyMGlxV0gvL3VFc1lRQTU4RDdMWHBmRVJZ?=
 =?utf-8?B?T3BmcllPdXZyeWpHRWdqUjJZV2FvQ3ZUay9scXF6S2NXTUh1aXU3K1RYMUU1?=
 =?utf-8?B?cWNCS002YXQ2alZZQUJhNG0vdFl6SE5mSDFWbWZhUjEyTUtTU2pNRFc5bDFY?=
 =?utf-8?B?OENObnk3YTB1SUJxWjJwK3ZJcnlqZlFFUEM3eklUNnFmLzhUOGYwWXpoQk9J?=
 =?utf-8?B?eVJ1Rk1KRFhuYUZnWHlpUjN6RG42bEZyWUNWeHlKM1FweW1jT0U5dGMraWRO?=
 =?utf-8?B?MStOVm82NXNBNTFCaWU4WDJHU0Fmd1IvNjFVTmNhZzNjY1I4NkdCeEMrOXlr?=
 =?utf-8?B?a3ZQVlpUNGFxb2dzVGpZZ3NFY2RyWU1IaXBsbklMOFRINStITk8zeHUzU2dZ?=
 =?utf-8?B?K2FlbFlmSS9MM0Y4Qk9TUVdiUXBIWmFBbmRSVXNiMEc0UFI1dFh4ZmE3a21h?=
 =?utf-8?B?R1kzVHlKRTRnYWZQRVp0SmhDR3pjM3kxTm0waEpsK3JqTjBEOFJHY1Rvc0lM?=
 =?utf-8?B?QnJCTnFpejl2NEJQRUNHTmxtdzlpcU5CQlE1Q2FCY0oxa1k1dW5GUnNlclpp?=
 =?utf-8?B?SldOcVZ0cmNzUHNZSmFNTTR2ZEwzQzU5UUlwMklIM1NEN01JQ3lwajM2L013?=
 =?utf-8?B?RkZISitGQWpDVVgzNldBYWRoLzRDeDBNZmRvakh4dm5rdjZSQ1huUGtwTmxZ?=
 =?utf-8?B?NkdzOVlHV0JOVDZzbjNWRm9DcnFFbDdEcElPL0lPRFFRSmJxOFRSaTFyMlNr?=
 =?utf-8?B?NURoWW9mNkNhU3lHdEc3QnRLdEJjRjFQVXhWTC8wS0JmSnk5cGFNUW1qM3pS?=
 =?utf-8?B?TnFSME5hS2xna1pSc1I1enZWbTRjRCtYUTdQc3JJYUVBaFlxdTA3dlA4VEw0?=
 =?utf-8?B?SFdWUVRLYUtJR2RYWmpSVGRVTlhiZVdJVnlhZHNScE1Xa1J0dkpVNG5LajFx?=
 =?utf-8?B?eVZyekFkdlFkWVVoNVZlalNSN01rTTZpVFpZMHI2Tm4vRWxaZ2Z0WFBHWHNU?=
 =?utf-8?B?SE5vNFBYMURIMVV2SHZVL3hjRWZqV0lBUzQxYlZzaWhhR1ZtUXB4VlYyNjVr?=
 =?utf-8?B?bkgySi9CNGViS0JKcHdWSzlTTDBzZktHcTNxemMxaW9CS2diV0MvWUkwMkJZ?=
 =?utf-8?B?WVRadEdPZUVadTNNVmZtei9sbDNVZDA1UjhJRlBDa0J0VGF6RzdLQ2o3UTlT?=
 =?utf-8?B?VjJURXh1S0V1Q3VpUFlmVFZzSDBUTHVIVU8rR1RaVDd6SEIzYUc2THhUVmpC?=
 =?utf-8?B?cXNObldSODNBaU4rQytaYVJCanl1NHNaa1lkSHhtdEZjWUVaSWo2NUcxcjZS?=
 =?utf-8?B?V2JjKzlQQ0lnQ2FHc3prNHpDbDZ0YkduRjdaa0s4U3FFUkFqa2srcGFPUzBZ?=
 =?utf-8?B?RVUwZVJCNGkrdmdLakdlU1dKbmd6dFJPSEhSM0hTR3E0SlNDWDJndnRkdTg0?=
 =?utf-8?B?emFkTjNTbFNTNGM1bStpOXBEM3hFTnRtQ0V0QlpnNFZYT0pJWXRkWTJUeGIy?=
 =?utf-8?Q?yI8BN71USs28CJhs50P2rElvb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <578F5D59C3856943B985EB1424A0D0E3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GHwOja3jypfhqWdfhWr20XVgdnzLofE/y9gMmLdo0RjM2wDxdJWxQn0/+eK4rDWd30Bs/bGS5N24S8/243pR8v3uGe9SNmEiqpkzOEWwIt5A/n07jOBLtp7h61ZJypcPaF4OLTWJ5UgbKqyP/VEWcuoruQn+uGTvAcWiySVuC3EpmyGmu/Wk7XljjkZD8IX8amIDRbG8GHdeBfqKTSu3x4/ksrW35uSKxtZc9Tel5IbP+j47jaeuuqk/qGyyocajtg7zKW/awVVE43SNGlGQobPm4yoaBdHdkKRCQrFrGcFXytVQFmS3kV7vImQjFlOq2JwKZqkGHFB0d3VIxemi/vllA4aAXL3G6DRV4SvjK9XMt4cEt/W/ky/tDW6GbbI179VAcxjwhmeLtiKBh9Jt3kGGLJc21Kqv80wu7O5TYcQcaetX7MuAIDgzugiEFO0K9EbVcizkjmOzm+5YrknWstljcALOO0NC8BOpprtMPVveqoxIA8q56ywHD9LcuUF4TDN/3pQ5IXAnqnQFQUnOGSnbutvJY2YYfuElLB7ZR3VU+zQ/C170X/kNbHKf0BfieBxlpX2cXS7qreYNCHdpzJNZ2V+OXgYGSAOLZPDIRDyj1+l3ic+4C0vnMxX1DlucJsEi/nHxPurMy8bmz3+8j6XyyzI+JtpIFaree71dnyPBEnLJ3I/JjyJwVkwXhxapOtuTmowClrdu3dWvkp7hqAN7DWblhMo+9AyfC6ABizke9BszMtzle09sV7Ug0flEzIucSa2dMTHgtkp2mGoLTUyRJgT24efzDLfDbgTfRK5x1e1uhUon3gXGEdUHJD0038KUunn8YZ9QWgDN0spJGQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7d21fe-8b9c-45f5-4392-08db569c9409
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 06:04:30.1058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pj979N7EPEp6sq7xabHyTD8mw8f2D3RRkr/DUh6WilGttZMQYFFkGOpWOFu7ZPZUvTnpXfqGMI1ebSJ3RyeK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
X-Proofpoint-GUID: byyodhKL8U9Cp1kYbi4ZugWzbwrXpMrp
X-Proofpoint-ORIG-GUID: byyodhKL8U9Cp1kYbi4ZugWzbwrXpMrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_14,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305170051
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGFsYWssDQoNCk9uIDUvMTcvMjMgMDA6NDMsIFBBTEFLIFNIQUggd3JvdGU6DQo+IEhpIE1p
bmFzLA0KPiAxLiBEZXBlbmQgb24gd2hpY2ggdWFjKHVhYzEgb3IgdWFjMikgeW91IHVzZSwgaW5j
cmVhc2UgMiB0byAzMg0KPiANCj4gSSBjaGFuZ2UgdGhlICNkZWZpbmUgVUFDMV9ERUZfUkVRX05V
TSAgICAgICAzMi4NCj4gDQo+IFdoZW4gSSBkbyB0aGlzLCB3aGF0IEkgc2VlIGlzLCB0aGF0IHdo
ZW4gSSBwbGF5IGF1ZGlvIG9uIHRoZSB0YXJnZXQsIEkgZG9u4oCZdCBzZWUgdGhlIEVORFBPSU5U
IHNodXRkb3duLiBIT1dFVkVSLCB3aGVuIEkgdHJ5IHRvIHJlY29yZCB0aGUgZGF0YSwgSSBETyBO
T1QgUkVDT1JEIGFueSBkYXRhLg0KPiBUaGUgYXJlY29yZCBmaWxlIGlzIGVtcHR5IHdpdGggb25s
eSA0NCBieXRlcy4gSSBzYXcgdGhlIHNhbWUgYmVoYXZpb3IgMiBtb250aHMgYWdvIHdpdGggdGhl
IG9sZGVyIHZlcnNpb24gb2Yga2VybmVsLg0KPiANCg0KU28sIHRvIHNldCByZXEgbnVtIHRvIDMy
IHJlc29sdmUgdGltZSBnYXAgaXNzdWUgYW5kIElTT0MgT1VUIHRyYW5zZmVycyANCihhcGxheSkg
Z29pbmcgT0suIFBsZWFzZSBrZWVwIHRoaXMgMzIgc2V0dGluZyBhbHdheXMuDQoNCkFyZWNvcmQu
IEluIGxhdGVzdCBsb2cgSSBzZWUgdGhhdCBmdW5jdGlvbiBkcml2ZXIsIGJlc2lkZXMgRVAxT1VU
ICh3aGljaCANCmZvciBhcGxheSBhbmQgaXQgbm9ybWFsbHkgd29ya3MpLCBxdWV1ZWQgMzIgcmVx
dWVzdHMgdG8gRVA0SU4sIHdoaWNoIEkgDQphc3N1bWUgZW5kcG9pbnQgZm9yIElTT0MgSU4gZm9y
IGFyZWNvcmQuIEJ1dCB0cmFuc2ZlciBvbiBFUDRJTiBuZXZlciANCnN0YXJ0LiBQbGVhc2UgcHJv
dmlkZSBtZSBsb2cgYW5kIHVzYiB0YXJjZSB3aGVuIHlvdSBkb2luZyBhcGxheSB3aXRoIA0KYXJl
Y29yZC4NCg0KPiBUaGUgbG9ncyBzaG93IHRoYXQgdGhlIGRhdGEgY29tZXMgb24gRVAxKE9VVCkg
YW5kIHRoZSBidWZmZXIgcXVldWVzIHVwdG8gIzI1NSBhbmQgdGhlbiB3cmFwcyBhcm91bmQgdG8g
MC4gVVNCIHNuaWZmZXIgYWxzbyBzaG93cyBkYXRhIGNvbWluZyBpbi4NCldyYXBwaW5nIGZyb20g
IzI1NSB0byAjMCBpcyBPaywgZHJpdmVyIGFsbG9jYXRlIDI1NiBkZXNjcmlwdG9ycw0KDQoNClRo
YW5rcywNCk1pbmFzDQoNCj4gDQo+IFsgNDAyMi41OTM5MzJdIGR3YzIgZmZiNDAwMDAudXNiOiBk
d2MyX2hzb3RnX2VwaW50OiBlcDEob3V0KSBEeEVQSU5UPTB4MDAwMDAwMDENCj4gWyA0MDIyLjU5
Mzk0NV0gZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBpbnQ6IFhmZXJDb21wbDogRHhF
UENUTD0weDgwMDQ4MGM4LCBEWEVQVFNJWj0xNDExZjBjMA0KPiBbIDQwMjIuNTkzOTYyXSBkd2My
IGZmYjQwMDAwLnVzYjogY29tcGxldGU6IGVwIDVhMzRmNjY0IGVwMW91dCwgcmVxIDA3MTYwN2Ew
LCAwID0+IDIwOWQwMDYxDQo+IFsgNDAyMi41OTM5ODFdIGR3YzIgZmZiNDAwMDAudXNiOiBlcDFv
dXQ6IHJlcSAwNzE2MDdhMDogMjAwQGYyNjhiNzE5LCBub2k9MCwgemVybz0wLCBzbm9rPTANCj4g
WyA0MDIyLjU5NDAwNV0gZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJfZ2FkZ2V0X2ZpbGxfaXNvY19k
ZXNjOiBGaWxsaW5nIGVwIDEsIGRpciBvdXQgaXNvYyBkZXNjICMgMjU1DQo+IFsgNDAyMi41OTQw
MTddIGR3YzIgZmZiNDAwMDAudXNiOiBkd2MyX2dhZGdldF9jb21wbGV0ZV9pc29jX3JlcXVlc3Rf
ZGRtYTogY29tcGxfZGVzYyAjIDIyMw0KPiANCj4gWyA0MDIyLjU5NDkyMl0gZHdjMiBmZmI0MDAw
MC51c2I6IGR3YzJfaHNvdGdfZXBpbnQ6IGVwMShvdXQpIER4RVBJTlQ9MHgwMDAwMDAwMQ0KPiBb
IDQwMjIuNTk0OTM1XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9oc290Z19lcGludDogWGZlckNv
bXBsOiBEeEVQQ1RMPTB4ODAwNDgwYzgsIERYRVBUU0laPTE0MDlmMDYwDQo+IFsgNDAyMi41OTQ5
NTFdIGR3YzIgZmZiNDAwMDAudXNiOiBjb21wbGV0ZTogZXAgNWEzNGY2NjQgZXAxb3V0LCByZXEg
YmJhMDNhOGYsIDAgPT4gMjA5ZDAwNjENCj4gWyA0MDIyLjU5NDk3MV0gZHdjMiBmZmI0MDAwMC51
c2I6IGVwMW91dDogcmVxIGJiYTAzYThmOiAyMDBAYTk2YTVkNDIsIG5vaT0wLCB6ZXJvPTAsIHNu
b2s9MA0KPiBbIDQwMjIuNTk0OTk0XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9nYWRnZXRfZmls
bF9pc29jX2Rlc2M6IEZpbGxpbmcgZXAgMSwgZGlyIG91dCBpc29jIGRlc2MgIyAwDQo+IFsgNDAy
Mi41OTUwMDZdIGR3YzIgZmZiNDAwMDAudXNiOiBkd2MyX2dhZGdldF9jb21wbGV0ZV9pc29jX3Jl
cXVlc3RfZGRtYTogY29tcGxfZGVzYyAjIDIyNA0KPiANCj4gSSBzZWUgdGhpcyBnb2luZyBvbiBp
bmRlZmluaXRlbHkgaW4gbG9ncy4gQnV0IHdoZW4gSSBkbyBhcmVjb3JkIGFuZCB0cnkgdG8gY2Fw
dHVyZSwgSSBkb27igJl0IGdldCBhbnl0aGluZyByZWNvcmRlZC4NCj4gDQo+IElzIHRoZXJlIGFu
eXRoaW5nIG1vcmUgdGhhdCBuZWVkcyB0byBiZSBlbmFibGVkLCB0byBnZXQgdGhpcyB3b3JraW5n
PyBUaGUgZW5kcG9pbnQgaXMgbm90IHNodXR0aW5nIGRvd24gYnV0IHRoZSBkYXRhIGlzbuKAmXQg
Z2V0dGluZyByZWNvcmRlZC4NCj4gDQo+IE1heSBiZSB0aGlzIGlzIHRoZSBnb2luZyBpbiB0aGUg
cmlnaHQgZGlyZWN0aW9uIGJ1dCBuZWVkcyBzb21ldGhpbmcgbW9yZSB0byBiZSBkb25lPw0KPiAN
Cj4gQXR0YWNoZWQgdGhlIGxvZ3MgZmlsZSBoZXJlLCBzaG93aW5nIG5vIGVuZHBvaW50IHNodXRk
b3duLCBidXQgYXJlY29yZCBmaWxlIHNob3dpbmcgTk8gZGF0YS4NCj4gDQo+IDIuIENoYW5nZSBk
ZXNjcmlwdG9yIERNQSAoRERNQSkgbW9kZSB0byBidWZmZXIgRE1BIChCRE1BKSBtb2RlDQo+IFdo
ZW4gSSBjaGFuZ2UgdGhpcywgSSBhbSBzZWVpbmcgYSBrZXJuZWwgY3Jhc2guIEkgd2lsbCBpbnZl
c3RpZ2F0ZSB0aGlzIGZ1cnRoZXIuDQo+IA0KPiBUaGFua3MsDQo+IFBhbGFrDQo+IA0KPiANCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWluYXMgSGFydXR5dW55YW4gPE1p
bmFzLkhhcnV0eXVueWFuQHN5bm9wc3lzLmNvbT4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE2LCAy
MDIzIDM6NTQgQU0NCj4gVG86IFBBTEFLIFNIQUggPHBhbGFrLnNoYWhAcmFyaXRhbi5jb20+OyBN
YXluYXJkIENBQklFTlRFIDxtYXluYXJkLmNhYmllbnRlQHJhcml0YW4uY29tPg0KPiBDYzogbGlu
dXgtdXNiQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogdXNiOiBnYWRnZXQ6IGR3YzI6
IG5vdCBnZXR0aW5nIGF1ZGlvIGRhdGENCj4gDQo+IEhpIFBhbGFrLA0KPiANCj4gT24gNS8xMS8y
MyAxNzoxNiwgUEFMQUsgU0hBSCB3cm90ZToNCj4+IEhpIE1pbmFzLA0KPj4NCj4+IENhbiB5b3Ug
cGxlYXNlIHJlc3BvbmQgdG8gdGhpcz8gV2UgbmVlZCBVU0IgQXVkaW8gR2FkZ2V0IHdvcmtpbmcg
YW5kDQo+PiB3ZSBjYW5ub3QgcHJvY2VlZCB3aXRob3V0IFN5bm9wc2lzIHN1cHBvcnQgb24gdGhp
cy4NCj4+DQo+PiBUaGFua3MsDQo+Pg0KPj4gUGFsYWsNCj4+DQo+PiAqRnJvbToqIFBBTEFLIFNI
QUgNCj4+ICpTZW50OiogVHVlc2RheSwgTWF5IDksIDIwMjMgMTA6NTIgQU0NCj4+ICpUbzoqIE1p
bmFzIEhhcnV0eXVueWFuIDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5vcHN5cy5jb20+OyBNYXluYXJk
DQo+PiBDQUJJRU5URSA8bWF5bmFyZC5jYWJpZW50ZUByYXJpdGFuLmNvbT4NCj4+ICpDYzoqIGxp
bnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4+ICpTdWJqZWN0OiogUkU6IHVzYjogZ2FkZ2V0OiBk
d2MyOiBub3QgZ2V0dGluZyBhdWRpbyBkYXRhDQo+Pg0KPj4gSGkgTWluYXMsDQo+Pg0KPj4gSSBo
YXZlIHVwZGF0ZWQgdGhlIGtlcm5lbCB0byA1LjEwLjEwMC4gSSBoYXZlIGRvbmUgdGhlIElQIGNv
cmUgdGVzdA0KPj4gYW5kIGFsbCB0aGUgdGVzdHMgKGVzcC4gdDE1IGFuZCB0MTYgZm9yIElTT0Mp
IHBhc3Mgb24gb3VyIHN5c3RlbS4NCj4+DQo+PiBIb3dldmVyLCBJIGFtIHN0aWxsIHNlZWluZyB0
aGUgb3JpZ2luYWwgcHJvYmxlbS4gVVNCIGdhZGdldCBEV0MyDQo+PiBkcml2ZXIgaXMgZ2V0dGlu
ZyBzdHVjayBhbmQgbm90IGdldHRpbmcgdGhlIHRyYW5zZmVycyBjb21wbGV0ZWQuDQo+Pg0KPj4g
V2hlbiBJIGFtIHJ1bm5pbmcgYXVkaW8gb24gdGhlIGhvc3QsIGFuZCB0cnlpbmcgdG8gY2FwdHVy
ZSB0aGUgZGF0YSBvbg0KPj4gRVAxKG91dCkgZW5kIHBvaW50IC0NCj4+DQo+PiBbICAyNzAuODU1
MTc0XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9oc290Z19pcnE6IGdpbnRzdHM6IDA0MmM4MDI4
LA0KPj4gZ2ludHN0cyAmIGdpbnRtc2s6IDAwMGMwMDAwLCBnaW50bXNrOiAoZDA4YzNjNDQpIHJl
dHJ5IDggWw0KPj4gMjcwLjg1NTE4OV0gZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJfaHNvdGdfaXJx
OiBkYWludD0wMDAyMDAwMiBbDQo+PiAyNzAuODU1MjA1XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdj
Ml9oc290Z19lcGludDogZXAxKG91dCkNCj4+IER4RVBJTlQ9MHgwMDAwMDAwMQ0KPj4gWyAgMjcw
Ljg1NTIxOF0gZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBpbnQ6IFhmZXJDb21wbDoN
Cj4+IER4RVBDVEw9MHg4MDA0ODBjOCwgRFhFUFRTSVo9MTFlNTU2ODANCj4+IFsgIDI3MC44NTUy
MzhdIGR3YzIgZmZiNDAwMDAudXNiOiBjb21wbGV0ZTogZXAgODIyNDczYmQgZXAxb3V0LCByZXEN
Cj4+IDc2YmY3N2U4LCAwID0+IDc3OGRhOWE4IFsgIDI3MC44NTUyNjBdIGR3YzIgZmZiNDAwMDAu
dXNiOiBlcDFvdXQ6IHJlcQ0KPj4gNzZiZjc3ZTg6IDIwMEAxYzgyMWQ0ZSwgbm9pPTAsIHplcm89
MCwgc25vaz0wIFsgIDI3MC44NTUyNzldIGR3YzINCj4+IGZmYjQwMDAwLnVzYjogZHdjMl9nYWRn
ZXRfZmlsbF9pc29jX2Rlc2M6IEZpbGxpbmcgZXAgMSwgZGlyIG91dCBpc29jDQo+PiBkZXNjICMg
MTk1IFsgIDI3MC44NTUyOTJdIGR3YzIgZmZiNDAwMDAudXNiOg0KPj4gZHdjMl9nYWRnZXRfY29t
cGxldGVfaXNvY19yZXF1ZXN0X2RkbWE6IGNvbXBsX2Rlc2MgIyAxOTMNCj4+DQo+PiBbICAyNzAu
ODU2MjQyXSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9oc290Z19pcnE6IGdpbnRzdHM6IDA0Mjg4
MDI4LA0KPj4gZ2ludHN0cyAmIGdpbnRtc2s6IDAwMDgwMDAwLCBnaW50bXNrOiAoZDA4YzNjNDQp
IHJldHJ5IDggWw0KPj4gMjcwLjg1NjI1NV0gZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJfaHNvdGdf
aXJxOiBkYWludD0wMDAyMDAwMCBbDQo+PiAyNzAuODU2MjY4XSBkd2MyIGZmYjQwMDAwLnVzYjog
ZHdjMl9oc290Z19lcGludDogZXAxKG91dCkNCj4+IER4RVBJTlQ9MHgwMDAwMDAwMQ0KPj4gWyAg
MjcwLjg1NjI4Ml0gZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBpbnQ6IFhmZXJDb21w
bDoNCj4+IER4RVBDVEw9MHg4MDA0ODBjOCwgRFhFUFRTSVo9MTFkZDU2MjANCj4+IFsgIDI3MC44
NTYzMTFdIGR3YzIgZmZiNDAwMDAudXNiOiBjb21wbGV0ZTogZXAgODIyNDczYmQgZXAxb3V0LCBy
ZXENCj4+IDVhZjRhNjYwLCAwID0+IDc3OGRhOWE4IFsgIDI3MC44NTYzNDZdIGR3YzIgZmZiNDAw
MDAudXNiOiBlcDFvdXQ6IHJlcQ0KPj4gNWFmNGE2NjA6IDIwMEBmODgyMDk1MCwgbm9pPTAsIHpl
cm89MCwgc25vaz0wIFsgIDI3MC44NTYzNzFdIGR3YzINCj4+IGZmYjQwMDAwLnVzYjogZHdjMl9n
YWRnZXRfZmlsbF9pc29jX2Rlc2M6IEZpbGxpbmcgZXAgMSwgZGlyIG91dCBpc29jDQo+PiBkZXNj
ICMgMTk2IFsgIDI3MC44NTYzOThdIGR3YzIgZmZiNDAwMDAudXNiOg0KPj4gZHdjMl9nYWRnZXRf
Y29tcGxldGVfaXNvY19yZXF1ZXN0X2RkbWE6IGNvbXBsX2Rlc2MgIyAxOTQNCj4+DQo+PiBbICAy
ODEuNzAwNTM3XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9oc290Z19pcnE6IGRhaW50PTAwMDIw
MDAyIFsNCj4+IDI4MS43MDA1NTJdIGR3YzIgZmZiNDAwMDAudXNiOiBkd2MyX2hzb3RnX2VwaW50
OiBlcDEob3V0KQ0KPj4gRHhFUElOVD0weDAwMDAwMDEwDQo+PiBbICAyODEuNzAwNTY0XSBkd2My
IGZmYjQwMDAwLnVzYjoNCj4+IGR3YzJfZ2FkZ2V0X2hhbmRsZV9vdXRfdG9rZW5fZXBfZGlzYWJs
ZWQ6IHRhcmdldF9mcmFtZSA9IDB4MDAwMDEzZDAgWw0KPj4gMjgxLjcwMDU4MF0gZHdjMiBmZmI0
MDAwMC51c2I6IGR3YzJfZ2FkZ2V0X2ZpbGxfaXNvY19kZXNjOiBGaWxsaW5nIGVwDQo+PiAxLCBk
aXIgb3V0IGlzb2MgZGVzYyAjIDAgWyAgMjgxLjcwMDU5NF0gZHdjMiBmZmI0MDAwMC51c2I6DQo+
PiBkd2MyX2dhZGdldF9maWxsX2lzb2NfZGVzYzogRmlsbGluZyBlcCAxLCBkaXIgb3V0IGlzb2Mg
ZGVzYyAjIDENCj4+DQo+PiBBdCAyNzAgc2Vjb25kcywgdGhlIHJlcXVlc3QgIzE5NCB3YXMgY29t
cGxldGVkIGFuZCByZXF1ZXN0ICMxOTYgd2FzDQo+PiBxdWV1ZWQuIEJ1dCByaWdodCBhZnRlciB0
aGF0LCB0aGVyZSB3YXMgYSAxMSBzZWNvbmQgZ2FwIGFuZCB0aGUNCj4+IHJlcXVlc3QNCj4+ICMx
OTUgd2FzIG5ldmVyIGNvbXBsZXRlZC4NCj4+DQo+PiBGb3Igc29tZSB1bmtub3duIHJlYXNvbiwg
dGhlIERXQzIgY29yZSBqdXN0IHN0b3BzLiBUaGVyZSBpcyBub3RoaW5nIGluDQo+PiBvdXIgc3lz
dGVtIHRoYXQgY2F1c2VzIGl0IHRvIGdldCBzdHVjay4gVGhlIGludGVycnVwdHMgYXJlIG5vdCBk
aXNhYmxlZC4NCj4+IFRoZSBVU0Igc25pZmZlciBkYXRhIHNob3dzIHRoYXQgdGhlIGRhdGEgaXMg
Y29taW5nIGluLiBIb3dldmVyLCBkd2MyDQo+PiBpcyBub3QgcnVubmluZy4NCj4+IEFmdGVyIHRo
ZSB0aW1lIGdhcCwgZXZlcnl0aGluZyBzdG9wIHdvcmtpbmcuDQo+Pg0KPj4gSSBoYXZlIGF0dGFj
aGVkIHRoZSBsb2cgZmlsZSBoZXJlLiBDYW4geW91IHBsZWFzZSBoZWxwIG1lIGZpeCB0aGlzDQo+
PiBkd2MyIGNvcmUgaXNzdWU/DQo+Pg0KPj4gVGhhbmtzLA0KPj4gUGFsYWsNCj4+DQo+Pg0KPiAN
Cj4gQXMgSSByZWNvbW1lbmRlZCBlYXJsaWVyLCBwbGVhc2UgdHJ5Og0KPiANCj4gMS4gRGVwZW5k
IG9uIHdoaWNoIHVhYyh1YWMxIG9yIHVhYzIpIHlvdSB1c2UsIGluY3JlYXNlIDIgdG8gMzINCj4g
DQo+IDIuIENoYW5nZSBkZXNjcmlwdG9yIERNQSAoRERNQSkgbW9kZSB0byBidWZmZXIgRE1BIChC
RE1BKSBtb2RlDQo+IA0KPiBUaGFua3MsDQo+IE1pbmFzDQo+IA0KPiANCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gDQo+IENlIG1lc3NhZ2UsIGFpbnNpIHF1ZSB0b3VzIGxl
cyBmaWNoaWVycyBqb2ludHMgw6AgY2UgbWVzc2FnZSwgcGV1dmVudCBjb250ZW5pciBkZXMgaW5m
b3JtYXRpb25zIHNlbnNpYmxlcyBldC8gb3UgY29uZmlkZW50aWVsbGVzIG5lIGRldmFudCBwYXMg
w6p0cmUgZGl2dWxndcOpZXMuIFNpIHZvdXMgbifDqnRlcyBwYXMgbGUgZGVzdGluYXRhaXJlIGRl
IGNlIG1lc3NhZ2UgKG91IHF1ZSB2b3VzIHJlY2V2ZXogY2UgbWVzc2FnZSBwYXIgZXJyZXVyKSwg
bm91cyB2b3VzIHJlbWVyY2lvbnMgZGUgbGUgbm90aWZpZXIgaW1tw6lkaWF0ZW1lbnQgw6Agc29u
IGV4cMOpZGl0ZXVyLCBldCBkZSBkw6l0cnVpcmUgY2UgbWVzc2FnZS4gVG91dGUgY29waWUsIGRp
dnVsZ2F0aW9uLCBtb2RpZmljYXRpb24sIHV0aWxpc2F0aW9uIG91IGRpZmZ1c2lvbiwgbm9uIGF1
dG9yaXPDqWUsIGRpcmVjdGUgb3UgaW5kaXJlY3RlLCBkZSB0b3V0IG91IHBhcnRpZSBkZSBjZSBt
ZXNzYWdlLCBlc3Qgc3RyaWN0ZW1lbnQgaW50ZXJkaXRlLg0KPiANCj4gDQo+IFRoaXMgZS1tYWls
LCBhbmQgYW55IGRvY3VtZW50IGF0dGFjaGVkIGhlcmVieSwgbWF5IGNvbnRhaW4gY29uZmlkZW50
aWFsIGFuZC9vciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50IChvciBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yKSBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRlc3Ryb3kgdGhpcyBlLW1h
aWwuIEFueSB1bmF1dGhvcml6ZWQsIGRpcmVjdCBvciBpbmRpcmVjdCwgY29weWluZywgZGlzY2xv
c3VyZSwgZGlzdHJpYnV0aW9uIG9yIG90aGVyIHVzZSBvZiB0aGUgbWF0ZXJpYWwgb3IgcGFydHMg
dGhlcmVvZiBpcyBzdHJpY3RseSBmb3JiaWRkZW4u
