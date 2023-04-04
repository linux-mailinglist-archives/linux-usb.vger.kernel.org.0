Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD96F6D5563
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 02:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbjDDAHg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Apr 2023 20:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjDDAHe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Apr 2023 20:07:34 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBAC3AA2
        for <linux-usb@vger.kernel.org>; Mon,  3 Apr 2023 17:07:33 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333LTvvg026609;
        Mon, 3 Apr 2023 17:07:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=48ShtCSAWVPFbln/B5q/GXco8XTvcjVmwjOZ74Z4R3o=;
 b=apjfDP1qIIGK4l0JDBsZNtnCUybZbT+No6SkXC3vznuKEhBbKmjUSeYxpBOjgaXziHBp
 LR9awcynRlI1N5MvWukIELMwQcvgjo4cXia1b/gv1au2SpSrXmFLvL9RHr7ntIu6D298
 +EVpCWZrBD0Hfye6iImh5CM+yf0nGWGmpykX0czfbWjc+KrkJQwiBJJIm0eE/CWJD+uL
 KOCvUzSLk5HGGpZ5YBgHk53NPqdctf6lKRUQduzh2PxRs1BxUHcq8vQIvItrWQsMkTTM
 +ZBNKWybNgk9CDpO2WTthGIk3Z9KZ+7EKNBDs1JRsoJy8RWP1IXBkL1uAqgvRBebM/ra cQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3ppk8j3s2a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Apr 2023 17:07:31 -0700
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1A47740099;
        Tue,  4 Apr 2023 00:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1680566850; bh=48ShtCSAWVPFbln/B5q/GXco8XTvcjVmwjOZ74Z4R3o=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dWsM/sU9AfNnLJD8L5DR9L2XHK/sqDyXibv+NQdrJ+giKij4oOvJrlWJNSGaaJRZb
         cEm2p9IO7O6x+dcsO7QmfPExgUWutXm2mXKuyHOonEaFTgwRCKFv6LBTllfAteCIQ6
         2ayse9ZkRRg0169hiEnLWdehxs/IVs1/KsU2Ek9Fa5xYK1frT/5Dwxge/FQSq+3VBO
         DVHdLveuXJhV6PM56WqeRbS9Lb0elF+A22k9x3EqnG6spbEee4h/5vE/viwyqmAd3/
         hyBixwDRet2dtBL6stjt1c0ygNATdRR5sMV+kfEo/wmFICbg+Irot/Cat7d9VZ5OXy
         FNeMAfc1+Y9UA==
Received: from o365relay-in.synopsys.com (us03-o365relay5.synopsys.com [10.4.161.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 48A5BA0071;
        Tue,  4 Apr 2023 00:07:28 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 682298017C;
        Tue,  4 Apr 2023 00:07:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="DE+XKOPw";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFvp8wuSNcYbM1NUP23RBM6ioIVAG5BGslYUSizID1c5Rs80bG8NfqRJ397gJMn87lX3yx+9Qj+iUik8Id1HvqCa4sT8XA7/CXzk7RmlY7pwNAYkktLpfPYo9KI9QeSpANr5h6/M3Oc7OjbyhDC80DofnxxjbzKGY2fApPJxSa7b039A4DXridkBeHy4LuAh0rvsQfrZ3hIsSJC8rW75g11SmzB3PY++YtIaSR8aKEIGeBELIQydPKx/GRZ4AJD56hKELOj0k5nMJ/iIFHqM5+pthGvoY3xaJKK6C9H0NHE6wdhXa8PpKkIhtCUtzsCmtExnhotcATXU1IVhn/Ms5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48ShtCSAWVPFbln/B5q/GXco8XTvcjVmwjOZ74Z4R3o=;
 b=Ce41UaK8nttaOGMu8D8UKdZypQGup1WpYe0tp/uxHv5XzLov4eRFLyymZQRLpNJTfisPyLlTGFynPLpVQ2AEKHxJ5vgLF3rkec4wyhOqjwCyJvz04AmXNTXHbBZ7I7QUVbSSDNgcqcxvjjbLrMv+kpLstBJdlcyDWYaI7icJb6K1x8tsFQ6HJN6DLriWvkJC6IX/vuD08NmZ2H5O1FPanqN9GYwtwi+It8r14YYsLtRyaH0TgWHb+FZovvipBL7zspCN9bOmwCYNBxirWh2xWqmHlecEAj3ND2U9XdK7aQwY1+BYCY4Hpd6DCuPO64QirWJgoy+aLwike6lIHN6xdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48ShtCSAWVPFbln/B5q/GXco8XTvcjVmwjOZ74Z4R3o=;
 b=DE+XKOPwhXRHpNP0DenXHzeTAjhI2WCcmNaS/h5dOWFUYGtsa5CX9ZubL3J3UdsdySvtRwPsdskQ5vwFSVYrQvOUyEyHKIIQ7lNYp9CBq3UIyAbPIpUT0RaOPXOaNZGp+OsdrxpKnFIZue9YbPmYhXpTwjg/6sKyOhAp1j30hb4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH7PR12MB6696.namprd12.prod.outlook.com (2603:10b6:510:1b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Tue, 4 Apr
 2023 00:07:25 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 00:07:25 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     James Ettle <james@ettle.org.uk>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ASM3242 SuperSpeed+ speed reporting
Thread-Topic: ASM3242 SuperSpeed+ speed reporting
Thread-Index: AQHZZZKmifUGUHjCtEqea20b7vzoc68aR7EA
Date:   Tue, 4 Apr 2023 00:07:24 +0000
Message-ID: <20230404000718.4aeboi4gs6orcete@synopsys.com>
References: <cbf6dfc7-7d0f-8b85-2f1e-de7d0129e742@ettle.org.uk>
In-Reply-To: <cbf6dfc7-7d0f-8b85-2f1e-de7d0129e742@ettle.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH7PR12MB6696:EE_
x-ms-office365-filtering-correlation-id: 73796dc3-4e75-472b-5f87-08db34a0919e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eSVKLRbIaYmuMxdsbdR8cq+G3x3+sxaj2gC7wIiYTO1cUIClqiKfarbG+V/LQQgy2Nh2MHqVYnmEYm1bHM2liuCB1cJGN5vlImj4gP+YKyZ0Hf9dehWaY1llY+v8dBrpOiDcKdtXk96yPoRL9Y8KYeobKGqqLv3ShmCD7Upw/hWRsTw6mRKGiQXx9qqL9gyEwktm+3GmnorIQSnlJuIsY022rG/t+PgK4l1Q/I3RsqsF2H2k5KXdcEN5WOExTGn2PrsKEPDnjxRbaKOk7VHZwwmylERAqdCTqEOE3Y49S7x6OTFVzbsqiZvnnE++0UXkX5hNyPjNDD4ikJIqIfKONZHb4ngYSZ+0lpkI3zyYjlu7BoIXcjaTswfHkNghKqGSYoam3mXQsIX7Bkl1nqV3t1lU40yZ8Di90mOHQwPke/sRa9fbE/Z929xsjLtn2zZxpmYQnJIoHMk1+R5i18KWnJuJCgDwYflujvF/mqZj4mWg6xdSIbc4dcgxhsrKcHAuxHhpYBxxssbqJ7a6588o6pBX50HWgmsyOWFeN1QTKmlc/0r2tJHUTMX6EKXcsrxRjpmXWH/3qzV88P96sg1wKRSsOAx68QzwlCt5xVrbm60SYXQgMdflkaufnSDFqjGQpggYLuX66ri91YwvNac62w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199021)(478600001)(1076003)(66476007)(6916009)(66946007)(66446008)(41300700001)(4326008)(316002)(76116006)(186003)(83380400001)(2616005)(966005)(66556008)(64756008)(6512007)(6486002)(71200400001)(6506007)(86362001)(26005)(36756003)(122000001)(8676002)(8936002)(2906002)(5660300002)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkxOa1lFZk1INXd1SXd1Tk1OR1NhV0thaEF3K2tqR3dQWmVwSGIxVmZkUER0?=
 =?utf-8?B?emxiWEhWT0puUVhrblhSM0IyRVBlaHlYVzE2K2xubEpFd2tyamwvQXpXMmhn?=
 =?utf-8?B?eGl3T3ZKTGV4R0tlb21UeDVyalQ5ZW44V2RnSjZjS3diUGFIalhDWFhLcU8w?=
 =?utf-8?B?bGpxOW5lOUJkQ1I2K2lSRm41aFlrdjhmRnVhRTdqcElsODFRNXBoUy9LOXRR?=
 =?utf-8?B?eW9sU295RGFxenZ3eGVjVkxYV2kwZ1QrbVQwbjVoUG5KR3FmdkhZVCt1TzRy?=
 =?utf-8?B?NlRiRFhEYTNSaDdDOUsrU0V0cFlseDhwOU9SbFNHVk5aaUJsSG5Dby9SdGl0?=
 =?utf-8?B?cnJEOTQ1ZFNnbjJtdkY5aCszMi9pQ0U0aVVURERvc21IOTN3a0tpYmw2eDZG?=
 =?utf-8?B?bStaYUZBWFpFOHFOaFFYSWRXWFdFM25Od2hUVzc3U3dZaC9KV3BxTEhGQ2lV?=
 =?utf-8?B?QXg2Uit5b2pobENrYzRnSHpwRDI0Mm9aVTVxWmlQcm1TSlBhdGJLMFBZeHlo?=
 =?utf-8?B?QzJnd0s4RTVDbUpodmFSbE5MeUx2RVBPeXNKVml6b2Z2dkxoSjVzSzhYZmJr?=
 =?utf-8?B?Z2xOR3JuV0M1eldSMlNNU2RnYlNjTmdvQm1zWi9nZjlGa3ZNMjFRcjZqOTFi?=
 =?utf-8?B?NkVsRUk5Tyt3KzZjM1RILzBFdEZuOWVIaXFkRkswL1pJNVV2cjhWZW1VNW5n?=
 =?utf-8?B?Zk9mWksvNnRFUHFxV3JjTEZrMWRKL0lRWjd6WHhDOWxmM3RWNmNtQ1FodCt5?=
 =?utf-8?B?SHN6L0FXV0p6UkhuMTRrQXFhSEQyaEdFcU92Vk1qRjRoV1FKMm1VUGZqRTNN?=
 =?utf-8?B?UDhqN2Z1bEFJcUZQaFdmRTFOQzVwSGY3eEM5N0xNRTk5QWhLN2FWUERQc2Nk?=
 =?utf-8?B?b0w4VDBEblhQd3ZGVFZVVVRRcmsxMlJUODFnUUZqalRvOWE1ZE0rN0wxL09N?=
 =?utf-8?B?TXc2VW1td3ZwdEdhMlUxMTd2bVEramlrT3ArczBxR1ZwYUk3aitReXRldmwv?=
 =?utf-8?B?ZjBFeFZ0WjhXUXpaNmxyRFVFWU4wbnhiVVMzUnhiNVgwTitvSzFILzFkakdZ?=
 =?utf-8?B?N0czSmd1WDMxTVVteEE4WVZOMENsOGVUQTAzSmMwTUlTdXpleWZmUk5BNEFw?=
 =?utf-8?B?MU5iMnJHRjFLNEc1WXl1TmV2M3BPcEExM2UwQjZyeHVFY3hFcTJtUjQza1hr?=
 =?utf-8?B?TkpEZHFLUzBIK3FwOWQ1cTk4Y3FNVkFFbDQzTkFnOEtXQzZLVUJOaGwvZUJM?=
 =?utf-8?B?Q1RpeTNRaGc0SlRGbkM0bU5VbTc4cE5zUkxuMGpvNGFKUi8vMDJ0OEdvMC8v?=
 =?utf-8?B?NDVGUUp2RnIzbUc3ZTE0bUYrdWpocHN5SHlhZzBJdnJuNm5wQm5iZkgyK3F2?=
 =?utf-8?B?eGhqTVRIOCt1NnBFZVZ6RFlRNVNnM1hWUnZEQitjWkxJN2JKWmxEeUM3Y0pI?=
 =?utf-8?B?TlUyVU5lNit1TnZXQXNWVkpPSlplZlZoSnRYeEhpMFhPa3VvNktuazJucHJX?=
 =?utf-8?B?NlRqYmx1c2FYSlhGd1dSRVJHMlZmQ1d1YTBra1JjUkJPMkUzOXVtc3cwZjRy?=
 =?utf-8?B?OTUrWGtpNlFOeldjMThWLzh6WGxIbUg1ZlZaUk94V3F5UmMzOVFKODdGZUNi?=
 =?utf-8?B?Z3UrM24vZExwVktjbFBtYzFXd283aUsvZ0ZkRVdjN2FaMzBrVDJ1bGIvT21i?=
 =?utf-8?B?MDBlSDIvTzNFNFBCSFU0Y0xHVk1maEtKWDluZXNLai9LMEhtTFpLeVljT0pi?=
 =?utf-8?B?RXpObWsyT2N6dzk1K3ZudVZRWldPMnJUc1YwcVdaZEI2d2hCRmtMelRjQUJx?=
 =?utf-8?B?aDZncVlDd3pHMXhwWDlVWXRUbVBiNmtjSExsaHhrY0F4b0lBeWxjaXR1dGNn?=
 =?utf-8?B?NmFmUmhHMDlVUXZsd25nM1kwSmcveWRHb3g0QjdSRUs5Mk5aM1RmbUY5Umhs?=
 =?utf-8?B?SThrbE1PTHZGY1lIUDJOY3B4MG9UZDBuUkRxNEdWMGVJTk90OFVFRElYTzV5?=
 =?utf-8?B?QmdmRTJuNDUreUtuVG5NaTNjSXV1NXFlYks4dnJPTFRQblF5LzFReU5NaExE?=
 =?utf-8?B?K3V2UlptR2FBbzRONytUd0RXSEtlQnc0R3dTOUFrK2R1ZFBBZ2ZOMXRQQXB0?=
 =?utf-8?Q?dkn2BTw1zYmQ5VnF7mjQ93+Ip?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15C2C5E25434804BA566A7931E886571@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6/7soxx5BGG8zgDxnNIyGrRpDzHMeLQRGsoxn4nlVVp3GJMwoAzZh8Xn4Sx4efPwEfspYo30m1jaHQjaE4KEV0UfiCT3L4slL9Nrg3i8SybWYy/URHrxgEeYOjvgnUWmGBmOq1OIAh6Q6/E0P4e8MTea2QmYeE476bBAYenI0ZcgbM9G7QoF6Vp5r5w8rxGOLDPzKFgR8F4kBuuLfd8NBc/dB9D6/1b2ATysmA3kKAHCc5ZF7o963EpQLzBkQcla+RWBpauJlSKSQduYc3NqQ9kFumeCJXt9r8Gq6IZD2fecfjgQmqQrgUIfx7MrHKYEPUh4QhMseo60I3TGWJYvRNBBOdNL7Drb50W+QfzjnJSo7Q0oLmtF3KaZz947Slxo2Z8jFIq9CpoKaOxhoM6UGivbHYHVkxLTqH/8UTIbM9ztQwuVGy6VigtDK0fmE+A7YD6Neg4KxU0iHeLlukjZ42c6HrsvskQmGJ4F9US331jbAYenpooU5d2MMml++nRhelY0L6bNa58B4wmE83iSatPBh2/sdBy4LtOAGUjs9lyqpqoMbWYyTIDJFmNS4iNKMv1GAa45g1AFcxllB0r26xRux67Dt4U1/wjLA1F3rGFFXfq0k2vlXB8OPfqVjuADpQ3V9lkoAEeGIXvItIM70AxJVRkKOcoYmO2FM1by9GmOfPupajewjGOxdYXey9BM4ajaTgn+LhjHIPNRQ9Js0M4L/graN77x7dDoIlqUMR4o0lNoof03z0+mFRvjGejH7yGU9gD3To8CmLE88SgFIBXT/GovnlXBnPBzzt8aUxNJyCj6prUlTn6aF4zxVxSlIKzRqfxw854U5EVwYNCEUw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73796dc3-4e75-472b-5f87-08db34a0919e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 00:07:24.5430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ci0C5U/+WGCetOBe294Hz+cR9onNiWKOlNCbktZCCkh008csys7jHBW1JW+1WnVdQ0hTgp/nYgTMn8xxAfKV4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6696
X-Proofpoint-GUID: oDbmxDOAIA-0xTDcuxNnSYF-5JZs9Hnq
X-Proofpoint-ORIG-GUID: oDbmxDOAIA-0xTDcuxNnSYF-5JZs9Hnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_18,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 phishscore=0 mlxlogscore=799 clxscore=1011 mlxscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304030192
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIFN1biwgQXByIDAyLCAyMDIzLCBKYW1lcyBFdHRsZSB3cm90ZToNCj4gSGVsbG8s
DQo+IA0KPiBJIGhhdmUgYSAyMEdicHMgVVNCLUMgcG9ydCBvbiBhIHBsdWctaW4gY2FyZCB0aGF0
IHVzZXMgYW4gQXNtZWRpYSBBU00zMjQyDQo+IGNvbnRyb2xsZXIuIFdoZW4gSSBhdHRhY2ggZGV2
aWNlcyBjYXBhYmxlIG9mIDEwR2JwcyBvciAyMEdicHMsIGxzdXNiIC10DQo+IHJlcG9ydHMgdGhl
eSBhcmUgY29ubmVjdGVkIGF0IDVHYnBzLiBNeSB0ZXN0IGRldmljZXMgYXJlOg0KPiANCj4gKiAx
MEdicHMgVVNCIGh1Yg0KPiAqIFJUTDkyMTBCIGJhc2VkIE5WTUUgZW5jbG9zdXJlLCAxMEdicHMN
Cj4gKiBBU00yMzZYIGJhc2VkIE5WTUUgZW5jbG9zdXJlLCAyMEdicHMNCj4gDQo+IE5vdyB3aGVu
IEkgZG8gdHJhbnNmZXIgdGVzdHMgb24gdGhlIE5WTUUgZW5jbG9zdXJlcyBJIGdldCBzcGVlZHMg
dG9vIGhpZ2gNCj4gZm9yIDVHYnBzLiBJbiBmYWN0IGV2ZXJ5dGhpbmcgaXMgY29uc2lzdGVudCB3
aXRoIHRoZW0gY29ubmVjdGluZyBhdCB0aGVpcg0KPiBiZXN0IHBvc3NpYmxlIFNTUCBzcGVlZHMu
IFNvIGl0IGxvb2tzIGxpa2UganVzdCB0aGUgc3BlZWQgcmVwb3J0aW5nIGlzDQo+IGluY29ycmVj
dC4NCj4gDQo+IEl0IHNlZW1zIHRoaXMgcHJvYmxlbSBoYXMgYmVlbiBlbmNvdW50ZXJlZCBiZWZv
cmUgaW4gdGhlIGZvbGxvd2luZyB0aHJlYWQsIGENCj4gYml0IG92ZXIgYSB5ZWFyIGFnbzoNCj4g
DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvQ0FLUmExVTZydWtCQndXeDB2TjJ3cWlITWJVSDl6V3NjLXkxd2tuT0N2aHVlcVdzVDd3QG1h
aWwuZ21haWwuY29tL19fOyEhQTRGMlI5R19wZyFiZUFlSVVub2hwa0FFczkyaVBCaGc5eEZGM3d5
X25lQ004QWJLT2tDdW80UW84dzZYdkVEMUljU3RpN3o1QVFwTUJtTlhvamR5d2E3TlVvck55cmsk
DQo+IA0KPiBpbiB3aGljaCBUaGluaCBOZ3V5ZW4gcG9zdGVkIHRoZSBmb2xsb3dpbmcgcGF0Y2g6
DQo+IA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzY5MDhhYTY5LTQ2OWItOGY5Mi04ZTE5LTYwNjg1ZjUyNGY5Y0BzeW5vcHN5cy5jb20v
X187ISFBNEYyUjlHX3BnIWJlQWVJVW5vaHBrQUVzOTJpUEJoZzl4RkYzd3lfbmVDTThBYktPa0N1
bzRRbzh3Nlh2RUQxSWNTdGk3ejVBUXBNQm1OWG9qZHl3YTdOVC1WazdDaiQNCj4gDQo+IEkndmUg
YXBwbGllZCB0aGlzIHRvIDYuMi45IGFuZCBub3cgdGhlIHNwZWVkIGFyZSBjb3JyZWN0bHkgcmVw
b3J0ZWQgaW4NCj4gbHN1c2IuIENhbiBJIHBvbGl0ZWx5IGFnaXRhdGUgZm9yIGdldHRpbmcgdGhp
cyBwYXRjaCByZXZpdmVkIGFuZCBwdXNoZWQNCj4gdXBzdHJlYW0/DQo+IA0KDQpJdCB3YXMganVz
dCBhIHRlc3RpbmcgcGF0Y2ggdG8gdmVyaWZ5IGlmIHRoZSB3b3JrYXJvdW5kIHdvcmtzLiBJdCdz
IG5vdA0Ka2VybmVsIHJlYWR5LiBBIHByb3BlciBwYXRjaCByZXF1aXJlcyBhIG5ldyB4aGNpIHF1
aXJrIG1hdGNoaW5nIHRhcmdldGVkDQpBc21lZGlhIGhvc3QuIElmIHNvbWVvbmUgd2FudHMgdG8g
dGFrZSB0aGlzIGRpZmYgc3VnZ2VzdGlvbiBhbmQgcmVzcGluDQppdCBmb3IgYSBwcm9wZXIgcGF0
Y2ggKHdpdGggcHJvcGVyIHRlc3RpbmcpLCBJIGNhbiBoZWxwIHJldmlldyBpdC4NCg0KVGhhbmtz
LA0KVGhpbmg=
