Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BFA6FBAF8
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 00:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbjEHWT0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 18:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233842AbjEHWTY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 18:19:24 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6014EE4
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 15:19:19 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348JnZcn025453;
        Mon, 8 May 2023 15:19:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=IXjyn4utp301w/UdcuSTVfntlNlchZAm7rdH6Sjwrt4=;
 b=ELdg0NF6RIqSVk/buA/5oSHfw5hKJkmY0Ab87EU7mBuP/2+M+TsMTO6VOFLjaErsN/Dx
 oqGq3Q+xHHKfev5bwfQmELNBuXflKyTAVs165O2EDAAGac2ko86aQQgEvIaZ2tsTJpqi
 TmsZw9+L0mJlBjYbEwi8zcD9WO7inbXjod60SxL2d4Fnky+q7OkC+X2qt74+wBjVHdP2
 emH7SGiw9kYJaJES7Mw4nKIzwk2iPyLvaz18kyL4COOIbKkKn1v+I2r5eXaQiOCTCcUK
 cgzl0v91/s+zWVmGU4naXLNgQq4j4l/dhwEATwBu80e8TpyUGrvG0zIrfBBQapkTzUWF 9g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf7700pf6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 May 2023 15:19:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683584355; bh=IXjyn4utp301w/UdcuSTVfntlNlchZAm7rdH6Sjwrt4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=kdvbbNz8qTtJlscPjTa60sgmeBerHjXMtGqXy8QqWkzRQWV7QkWDRO5RWvKZCflH8
         jiZBaBuBY1zoWmNtHWs4BWBBb0RajUpCLoEXbHv9IbBiQVDYRid27rZvh+Gs6iyIqA
         kccS7KP/Hwt4zMhzTEW/+wig84twDQLEC4WRgPezafsTSmvcj/p21OXB9wIZckkHr1
         KLZi2pYqN4BnerZpB+vw5GlCQ5RUGRsGzFm/+9wIXIkBofKxPeDFxHiZhX12lyClTj
         jeybjh63O23shKAeaVudkASHCTRz1fSoDhzQtdB9SzeA5Osuj+ODSnzipE6x8WWchQ
         KCMSXi/Vf/eXw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E1E440681;
        Mon,  8 May 2023 22:19:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5ED90A0062;
        Mon,  8 May 2023 22:19:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gPoLkM8H;
        dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E4D93405C5;
        Mon,  8 May 2023 22:19:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXSTWbmuqrJ4N7ZlzBYxxkuyee/zNEds9v/+fGDyV8Mz/Q6fKdO3Q+4Rxi9oRUAc8mA8H5fpwsX6Q8SNGsZQHdh/DdXaZhU7lvqvTwFg3GVAcwRDRTDtMp2NOHEx92uFFMY707jdxxlmJHu4J+ncBKM+EFu3/KwHV30q2UEBKBOCkaQ0ZFQSD2vtqnUnhgLY6aS7V+j7T3PitOb+owJx2h/ntjU7r/rQRliLq78tg/UYY6SrtZyCvs2Yh427+MoJ2fSaOvsI+9O7BWRqZuVvACPRmLwHV6HhGsFTlxNyVi+r7O9WrKPUMEAYPvhTrH2gnkdkGByN8WMONWpI19ZqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXjyn4utp301w/UdcuSTVfntlNlchZAm7rdH6Sjwrt4=;
 b=EBsXyR8LNlzArnkUzHJZoi6y2xzXZuRDpCNfRJGe8wmzre6blPj+hugd9OT/LYnYnJAU93lzb4XFR3lqqJUMbnPyAdvn35iHMkcZlFofBrKPAjEdHEckE6zBR6FbFPr+VhMNH+Ws8o5bCrp5bASsbuSvPgY63IbXEmfI8X0di94gCB7+igBRwd7iby/uB3mDcHPEA5955Je5i887rrW371CpXTZanM3Eql8AKgcIgVhDeoYsDxh1IGS+THNjOv4seOcKnJ0sZ2SOdnrbFFgbXGgUn3kUl5/jDq6pZkqGjOOVEKa7+n0GK5UKVr+uor7wDkEOR9MNdmHsQYTHVrSwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXjyn4utp301w/UdcuSTVfntlNlchZAm7rdH6Sjwrt4=;
 b=gPoLkM8HqIsc6k9XUwJhVL5YviAfceVVD/h1IHFv8v9eQP/OZLREVQSYIgO9MWWdoEYgoak3YuVxcZn8mFLZFGAgKEDndJoy82R+8uINe73T39k0wvL2UrHQYAnadWE/VsxkK/AkU+tzzVyi98ZCjtfVvg32Hxx2FX1v9TAGtXY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SA0PR12MB4543.namprd12.prod.outlook.com (2603:10b6:806:9d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 22:19:09 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 22:19:09 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Topic: [PATCH v6] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Index: AQHZfvPS7HdhOwEuuEGw/l7NE0fH5q9MZmKAgAM8pgCAAVOoAIAAAZwA
Date:   Mon, 8 May 2023 22:19:09 +0000
Message-ID: <20230508221906.c7zag2pggcxnqyjk@synopsys.com>
References: <20230505014902.27313-1-quic_linyyuan@quicinc.com>
 <20230506003149.obpauq727sgmiobe@synopsys.com>
 <fb2162fb-f3b4-0af1-387b-b07770a4c39e@quicinc.com>
 <20230508221320.m5donpfzn5dcnha6@synopsys.com>
In-Reply-To: <20230508221320.m5donpfzn5dcnha6@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SA0PR12MB4543:EE_
x-ms-office365-filtering-correlation-id: d7df959b-a7ba-4180-37f5-08db50123ebe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: riHKjzaWBbGba+jPchR2cUxPHFjHIV1crlwcdiWFgERmmQ2wk23px88Vp3ZF7YoUb8f9t8pk7+G0/bG4926n3E5KTrAOtKrLYIt66I8JUgRdSEDizoART/4DiGhMc9oifDxrcMdNmBqnAO9SoJYFN1aoAyydkNN7yDUIrX/8BMZGhXk6iDEy3MTYlrHd6iV8EzFGYHOYJy37Q+is41RrCA/oEHqtV/yqxKG2tkYHBsMD13W/wm/u4w5vJeSl/z8SgfrXjRGlLRX2dLrDDYuJ6bMj9qnA5mEYO8JVNYGAMyUDqjB3RtTwyvZdoWkHms6XjTcnYX3g3wluE0r9nN5ToRqr9uxaP+dMnTaKbJtpgqr54TKza/MZ+IhuwkIo0FNLEinSfphZmOOcGObRzbZK1BDJwSqrIPCmyGQlkM+zQzB3ElcW8I5xDa2fV8fuQmRT9Wsf4y4EjhvoKsdnNot00APJVq5MpiyitFYRGa/J84kWnQ57BDaBXb3MwfWq07S6z+Pk8FgkCAvCBgKgamZYR4BIFukkK5afeWNcmVO3VIGBbyBG7MYs1qevRDzzOIxo+52lhb3UkxWEA3J4HLGB+5VKD9a+8EaEyRRvkT5LcrxUSjfHwv83jipUtc90HgkVPFEhcL+p0OjDvGW53TaWsQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(966005)(83380400001)(2616005)(478600001)(54906003)(71200400001)(6486002)(6506007)(26005)(186003)(53546011)(6512007)(1076003)(2906002)(15650500001)(38100700002)(36756003)(66476007)(41300700001)(66946007)(66446008)(64756008)(76116006)(66556008)(122000001)(4326008)(6916009)(38070700005)(8676002)(8936002)(5660300002)(86362001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3pwZzFMZUw1Q2VLaXZoS0IxWklYeGtteThqYUE5cE5RaVhoQVp3S1lTYkp4?=
 =?utf-8?B?VkZBTXhOcjE5dWNFVXhOWStvRWRpSFFXQTZCZms1MFlYbE1haUthbU5oNU1R?=
 =?utf-8?B?SDIzWWhLa3FvTGpXL3owZkljNkM2emF1Wjg0cjRGMmc2UTNhbjNmT0gxb0xh?=
 =?utf-8?B?YzJTajBSb2ZkamliLzdNOTRHWXBUNlZJTmNPclhNRUpxTG42VkdqOS93RmdH?=
 =?utf-8?B?bTMvaWJWUGNUUk9ORkV5WndiUk1zeUlIU0Z4ZEZxSjA4Mk1GQU9HSmE3RUtv?=
 =?utf-8?B?M1paaE5DQndZeTBNbGFZaGJabVlCSDh4ZEJZODZmS2ZEa2pRamZnNHhPN0F5?=
 =?utf-8?B?b3pFR1NvYXVvOVZab1pJc3EydkpXMjQ1RGpNcU1ka2FqeUN0dTZmYlhWeXg3?=
 =?utf-8?B?Z3BjNTE3VHNLR1VJVFZGSXV4b25Tc09HRWdPVXZyY2hKbWpNaHVyaGZGMHRu?=
 =?utf-8?B?YXVyUkFoSVN0RzBWbFVpUklpWlhqb1grcEhMOUpzM0RlVjdRMjUzYWVIVERK?=
 =?utf-8?B?QWVHY0ZWY0wvNGZ5VUJ1N3BxSm9NSFRRdEgxUE1XNVl2eW1RTkMwQlk4cjRE?=
 =?utf-8?B?a3dsWncxaVBPQnJOWUZDKzZIRkFTQklVeGM2SW9XTmtuTm51c0N3ZFhWbU1S?=
 =?utf-8?B?a0Mxb0Y5dWZWWWlWeSsvM1FmQXhvbytZRVVMbUdjOHpHenBFQmJyZVI1TFdK?=
 =?utf-8?B?QUZ1cUR5WXMxYVlKUklOYlpVVmEwaWl5N2N5L1VrWXA2bmc5bXFUUmtLS0hJ?=
 =?utf-8?B?ZVhoKy9MV0tOQzEwMFF0a0Z3ZHdTemE3K3V3MHptWmFETnRoTGJxejNiWXh3?=
 =?utf-8?B?bDJyZUFjV3pNL1RKTU9uNXVNR0VtOUNPU3VDRjZYT3pybmVHaXlxODA4ZW1k?=
 =?utf-8?B?NmtpMWFnWVFrZzdCU1Z5N1lsY1Njd2I3dmpyWUtnZnR6SlFIaVpJZlBxKzhB?=
 =?utf-8?B?Q0hNcDFZaks0Z1ArQkNnMWlVclQrdHlHWFNsVlc1NDN5UlRCL29yM3RIc000?=
 =?utf-8?B?SHpybUhKL0l2QlZQQlhrd1Q3RTZqVDRlR0gwcmRwc3BEUllDYVkzRnpNOUFC?=
 =?utf-8?B?OEVxZ2JWZ1RXZXRvOEkyQ3RjRnV3N2hZSXZwS1VPOE8zRGxBUWk4eVBieis4?=
 =?utf-8?B?REJMekgzc2Z1MGVGWk5kWnNSNDdWRDB4aStmdjJ5cVN4UEpMcVdvM1BsZ1A5?=
 =?utf-8?B?bFhUbEx5RXl1V003ZG1nb2RaK2RGOGtCZHZaeDFjNVZpNC83ZVd1cnFEb0tt?=
 =?utf-8?B?cXBXdkEyaWZtQ2wxMXJ1a2F5M2xka1NtV1BOdjU1TGthdEd0U09KKy9NRkVa?=
 =?utf-8?B?WjhxcVNvQmxTRnRNVENUWUNwSG1LR0t4K2JmSlhsNnhoUmNKbUFXbEpsV1dF?=
 =?utf-8?B?dTdtSjJQa2p0WTF1YTgxWUlpNUpqQW1FdGhzakYyR20vZUh3OTBtYXVtbmdh?=
 =?utf-8?B?N25zeGZvMWNGVThKdXd5TW1FcGRqOENqYlVQQW4xc1lhSyszMDF6dlQwcnRE?=
 =?utf-8?B?WEVKcXlJby9zempRUzNnMGliN2Z4c2ZZTTJHSVFXN1E3UHFtV2FKMkpBanZ0?=
 =?utf-8?B?aW1JN2laNkZsUDlMUDFnSnZ6eHBYVE1VaC9YUVBkbUV1NFY3Yk5VQkFHbE9i?=
 =?utf-8?B?NXRsUlJEek84bTRBalI0MS9IYUduWGJxSmdzb1hDazBDWmZTT1FqbWx3aysw?=
 =?utf-8?B?Y1JpZGJZRlVJd0l6Um9QblJ1OTdrcTN5Y1JEWFdCZ3AzZWFDbFZPZ3IveXdj?=
 =?utf-8?B?YlpoRnlrcHZ2T1A3SGJGSkFDNHJqd0EwSnNFMG1sK0hXUDBIRWxoRXlrRzlv?=
 =?utf-8?B?UzZMWlFUdlJYU2hETEp3VzY1ZmxMSUpYM2FrRi96TEFZVDRXbVNsZE81R0JL?=
 =?utf-8?B?UW9iZFpYdGVSdzAzR2tXWVNSeHRWS01BSThud0ZpTjFQRzhoUC9JMndZNTk4?=
 =?utf-8?B?Y0t1dlpBaGQyYmxpaGlYUVlMM2pSRlBmR3hqWFp0b0lQU0JtcWdxVEt6b0lv?=
 =?utf-8?B?ckloMmtQZ0w1TEM2bnBZZ2d4MS9pSHVEckt0ampFdkU2a1NTMzVqYksrYnpC?=
 =?utf-8?B?VEV1d291UmNycWhZS3kvSjFqM3lWRjRxcjVHYWVMbGxvakk5ZFZJTkhDSVhk?=
 =?utf-8?Q?7DNpzPvXUZpETeEzYbIg1lBxV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B478F60B1BD9B4F9423A46FDB74B943@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zVML7Idw9XCtSryzpLgQ8Emu/rWe9FQgExWmLXlllmSHO/0K9koCeZUXEMAy+367GOocUGYvBxjqERjZgnuZzYpC2eR1TR9Wsb1NDyr8A72cTjU8j+g3Ef342PbL9viUzFlIclqB9De7d+/wxLLClVfXq6sAO3JqZbPzAEfennJ/KD3Ep8XAuXnfiBWGVKF2D53bYBp9Oso9bUsETGIuVy6laoY1K2eVdy9NV7Eaz4h5mHkztkcZ1fGKI5z1qD54wx6j2nWXyj934ZmZcI/P+I2lziDQ8H6ucyV2nYzLXrVjL+vCNaNBWpZgP2m1pusbESjs9r7hzl9zg5x4Grtqjc0H9HKoaxkxeXpI5cDJ6DxXvIxr98AS4PKuenIowaPA6XJfKWyUaj6OZ53G5I8S9O2ek5piA6oMASR8mzItPN+Akn5Ji4I+AGkHKHNXCq6sSQiMGA+R3lcLi7fcDOHhlYxDxJSdFeJjh7uVRV6M0JY2NuPrGBJIorYiW56SG9I9OSnuMyNYLV0Mh6tVOTld5NDt3psKixMI0SzCBXI+vV45l7kKTzgDwn1vkzmxXmIzA/caxFc/ml1UyNLf275QB9+/FFP1FapEXXia8dqOmlTSS7FwMPIeGRSRzXa9SwzaCTaAKZSrCTazxYcH/6bqBFRK40LHvSwukDUv5NXiZ55nLn70YjO+6ht/aJlPZyT8LVSN/zUTpvxkG7owajJBBMzgA53gb4k36f8myr7XXjYC6yd+a4JSUc5Wo+zTTCaQBHk4Pb0i2kH0+jHgV29+amc/ezwCMtw2k645TZBPTLQOTWqyxmInqDSvzdrBbzohLazjyK3AwNRaknwdDATWvtvgQMxe/PXkTqY7WDkh89olYbvhmuYmSRAao50DoZD9ocZQ35qRUo9x2DGZuS7upg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7df959b-a7ba-4180-37f5-08db50123ebe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 22:19:09.4807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t2VmrPVr1b66dQpG50PALNWdWJ3ePs29sTtTMOP8TBilmf5oouHNQRxyWWkOeWRUQc13WSbQ3S4fgxxIuDaksQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4543
X-Proofpoint-GUID: xEP148tVvfh-RjiVTFwWBQAxM5fLtyGV
X-Proofpoint-ORIG-GUID: xEP148tVvfh-RjiVTFwWBQAxM5fLtyGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305080148
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCBNYXkgMDgsIDIwMjMsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gTW9uLCBNYXkg
MDgsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+ID4gDQo+ID4gT24gNS82LzIwMjMgODozMiBB
TSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBNYXkgMDUsIDIwMjMsIExpbnl1
IFl1YW4gd3JvdGU6DQo+ID4gPiA+IFdoZW4gd29yayBpbiBnYWRnZXQgbW9kZSwgY3VycmVudGx5
IGRyaXZlciBkb2Vzbid0IHVwZGF0ZSBzb2Z0d2FyZSBsZXZlbA0KPiA+ID4gPiBsaW5rX3N0YXRl
IGNvcnJlY3RseSBhcyBsaW5rIHN0YXRlIGNoYW5nZSBldmVudCBpcyBub3QgZW5hYmxlZCBmb3Ig
bW9zdA0KPiA+ID4gPiBkZXZpY2VzLCBpbiBmdW5jdGlvbiBkd2MzX2dhZGdldF9zdXNwZW5kX2lu
dGVycnVwdCgpLCBpdCB3aWxsIG9ubHkgcGFzcw0KPiA+ID4gPiBzdXNwZW5kIGV2ZW50IHRvIFVE
QyBjb3JlIHdoZW4gc29mdHdhcmUgbGV2ZWwgbGluayBzdGF0ZSBjaGFuZ2VzLCBzbyB3aGVuDQo+
ID4gPiA+IGludGVycnVwdCBnZW5lcmF0ZWQgaW4gc2VxdWVuY2VzIG9mIHN1c3BlbmQgLT4gcmVz
ZXQgLT4gY29ubmRvbmUgLT4NCj4gPiA+ID4gc3VzcGVuZCwgbGluayBzdGF0ZSBpcyBub3QgdXBk
YXRlZCBkdXJpbmcgcmVzZXQgYW5kIGNvbm5kb25lLCBzbyBzZWNvbmQNCj4gPiA+ID4gc3VzcGVu
ZCBpbnRlcnJ1cHQgZXZlbnQgd2lsbCBub3QgcGFzcyB0byBVREMgY29yZS4NCj4gPiA+ID4gDQo+
ID4gPiA+IFJlbW92ZSBsaW5rX3N0YXRlIGNvbXBhcmUgaW4gZHdjM19nYWRnZXRfc3VzcGVuZF9p
bnRlcnJ1cHQoKSBhbmQgYWRkIGENCj4gPiA+ID4gc3VzcGVuZGVkIGZsYWcgdG8gcmVwbGFjZSB0
aGUgY29tcGFyZSBmdW5jdGlvbi4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExp
bnl1IFl1YW4gPHF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4g
PiB2NjogKHJlZmVyIHY1IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC11c2IvMTY4MjQ3Njc4MC0yMzY3LTEtZ2l0LXNlbmQtZW1haWwtcXVp
Y19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchZElRMlZIY2NtWlRYcDEtNTlo
VEZmRWhjNjVXMGdhdGYxbjJ3bUJmczVZYjBpcGpIa3NEX0VTUVNtZ1hreTFvMXNjNHdFWjVxcDlK
S1Y3SUttazVLbTRiSnppMnBHZyQgKQ0KPiA+ID4gPiAxKSBjaGFuZ2Ugc3ViamVjdA0KPiA+ID4g
PiAyKSBvbmx5IGtlZXAgc3VzcGVuZGVkIGZsYWcgcmVsYXRlZCBjaGFuZ2UNCj4gPiA+ID4gDQo+
ID4gPiA+IHY1OiAocmVmZXIgdjQgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8xNjgyMzkzMjU2LTE1NTcyLTEtZ2l0LXNlbmQtZW1h
aWwtcXVpY19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchZElRMlZIY2NtWlRY
cDEtNTloVEZmRWhjNjVXMGdhdGYxbjJ3bUJmczVZYjBpcGpIa3NEX0VTUVNtZ1hreTFvMXNjNHdF
WjVxcDlKS1Y3SUttazVLbTRaWG1zS1N2USQgKQ0KPiA+ID4gPiAxKSByZW5hbWUgc3VzcGVuZF9p
cnFfaGFwcGVuIHRvIHN1c3BlbmRlZCBhbmQgZG9jdW1lbnQgaXQNCj4gPiA+ID4gMikgYWRkIG9s
ZF9saW5rX3N0YXRlIGZvciBsaW5rIGNoYW5nZSBpbnRlcnJ1cHQgdXNhZ2UgYW5kIGNoYW5nZSBh
Y2NvcmRpbmdseQ0KPiA+ID4gPiANCj4gPiA+ID4gdjQ6IChyZWZlciB2MyBodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2ODIwNTM4
NjEtMjE3MzctMS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEh
QTRGMlI5R19wZyFkSVEyVkhjY21aVFhwMS01OWhURmZFaGM2NVcwZ2F0ZjFuMndtQmZzNVliMGlw
akhrc0RfRVNRU21nWGt5MW8xc2M0d0VaNXFwOUpLVjdJS21rNUttNGFxV05VaC1RJCApDQo+ID4g
PiA+IDEpIHJlbW92ZSBsaW5rIHN0YXRlIGNoZWNraW5nIGluIGR3YzNfZ2FkZ2V0X3dha2V1cF9p
bnRlcnJ1cHQoKQ0KPiA+ID4gPiAyKSByZW1vdmUgdHdvIHN3aXRjaC9jYXNlIHRvIGlmIG9wZWFy
dGlvbg0KPiA+ID4gPiANCj4gPiA+ID4gdjM6IChyZWZlciB2MiBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2ODIwNDI0NzItMjEy
MjItMS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5
R19wZyFkSVEyVkhjY21aVFhwMS01OWhURmZFaGM2NVcwZ2F0ZjFuMndtQmZzNVliMGlwakhrc0Rf
RVNRU21nWGt5MW8xc2M0d0VaNXFwOUpLVjdJS21rNUttNGJSbW4wSE5BJCApDQo+ID4gPiA+IG5v
IGNvZGUgY2hhbmdlIHNpbmNlIHYyLCBjaGFuZ2VzIGNvbXBhcmUgdjEgYXMgYmVsb3csDQo+ID4g
PiA+IDEpIGFkZCBhIGZsYWcgc3VzcGVuZF9pcnFfaGFwcGVuIHRvIHNpbXBsaWZ5IGR3YzNfZ2Fk
Z2V0X3N1c3BlbmRfaW50ZXJydXB0KCksDQo+ID4gPiA+ICAgICBpdCB3aWxsIGF2b2lkIHJlZmVy
IHRvIHNvZnR3YXJlIGxldmVsIGxpbmtfc3RhdGUsIGZpbmFsbHkgbGlua19zdGF0ZSB3aWxsDQo+
ID4gPiA+ICAgICBvbmx5IHVzZWQgaW4gZHdjM19nYWRnZXRfbGlua3N0c19jaGFuZ2VfaW50ZXJy
dXB0KCkuDQo+ID4gPiA+IDIpIHJlbW92ZSBzdyBzZXR0aW5nIG9mIGxpbmtfc3RhdGUgaW4gZHdj
M19nYWRnZXRfZnVuY193YWtldXAoKQ0KPiA+ID4gPiAzKSBhZGQgZHdjM19nYWRnZXRfaW50ZXJy
dXB0X2Vhcmx5KCkgdG8gY29ycmVjdCBzZXR0aW5nIG9mIGxpbmtfc3RhdGUNCj4gPiA+ID4gICAg
IGFuZCBzdXNwZW5kX2lycV9oYXBwZW4uDQo+ID4gPiA+IA0KPiA+ID4gPiB2MjogdXBkYXRlIGFj
Y29yZGluZyB2MSBkaXNjdXNzaW9uDQo+ID4gPiA+IHYxOiBodHRwczovL3VybGRlZmVuc2UuY29t
L3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2NzUyMjEyODYtMjM4MzMt
MS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19w
ZyFkSVEyVkhjY21aVFhwMS01OWhURmZFaGM2NVcwZ2F0ZjFuMndtQmZzNVliMGlwakhrc0RfRVNR
U21nWGt5MW8xc2M0d0VaNXFwOUpLVjdJS21rNUttNFpCbl9UUEV3JA0KPiA+ID4gPiANCj4gPiA+
ID4gICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgMiArKw0KPiA+ID4gPiAgIGRyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMgfCA3ICsrKysrKy0NCj4gPiA+ID4gICAyIGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgN
Cj4gPiA+ID4gaW5kZXggZDU2NDU3YzAyOTk2Li5lZmFjYWFjYmJlYjIgMTAwNjQ0DQo+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5oDQo+ID4gPiA+IEBAIC0xMTE2LDYgKzExMTYsNyBAQCBzdHJ1Y3QgZHdjM19z
Y3JhdGNocGFkX2FycmF5IHsNCj4gPiA+ID4gICAgKiBAZGlzX21ldGFzdGFiaWxpdHlfcXVpcms6
IHNldCB0byBkaXNhYmxlIG1ldGFzdGFiaWxpdHkgcXVpcmsuDQo+ID4gPiA+ICAgICogQGRpc19z
cGxpdF9xdWlyazogc2V0IHRvIGRpc2FibGUgc3BsaXQgYm91bmRhcnkuDQo+ID4gPiA+ICAgICog
QHdha2V1cF9jb25maWd1cmVkOiBzZXQgaWYgdGhlIGRldmljZSBpcyBjb25maWd1cmVkIGZvciBy
ZW1vdGUgd2FrZXVwLg0KPiA+ID4gPiArICogQHN1c3BlbmRlZDogc2V0IGlmIHN1c3BlbmQgaXJx
IGhhcHBlbiB0byBhdm9pZCBwb3NzaWJsZSBjb25zZWN0aXZlIHN1c3BlbmQuDQo+ID4gPiBDYW4g
d2UgcmVwaHJhc2UgdG86ICJzZXQgdG8gdHJhY2sgc3VzcGVuZCBldmVudCBkdWUgdG8gVTMvTDIi
DQo+ID4gDQo+ID4gDQo+ID4gdGhhbmtzLCBzdXJlLg0KPiA+IA0KPiA+IA0KPiA+ID4gDQo+ID4g
PiA+ICAgICogQGltb2RfaW50ZXJ2YWw6IHNldCB0aGUgaW50ZXJydXB0IG1vZGVyYXRpb24gaW50
ZXJ2YWwgaW4gMjUwbnMNCj4gPiA+ID4gICAgKgkJCWluY3JlbWVudHMgb3IgMCB0byBkaXNhYmxl
Lg0KPiA+ID4gPiAgICAqIEBtYXhfY2ZnX2VwczogY3VycmVudCBtYXggbnVtYmVyIG9mIElOIGVw
cyB1c2VkIGFjcm9zcyBhbGwgVVNCIGNvbmZpZ3MuDQo+ID4gPiA+IEBAIC0xMzMyLDYgKzEzMzMs
NyBAQCBzdHJ1Y3QgZHdjMyB7DQo+ID4gPiA+ICAgCXVuc2lnbmVkCQlkaXNfc3BsaXRfcXVpcms6
MTsNCj4gPiA+ID4gICAJdW5zaWduZWQJCWFzeW5jX2NhbGxiYWNrczoxOw0KPiA+ID4gPiAgIAl1
bnNpZ25lZAkJd2FrZXVwX2NvbmZpZ3VyZWQ6MTsNCj4gPiA+ID4gKwl1bnNpZ25lZAkJc3VzcGVu
ZGVkOjE7DQo+ID4gPiA+ICAgCXUxNgkJCWltb2RfaW50ZXJ2YWw7DQo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQu
Yw0KPiA+ID4gPiBpbmRleCBjMGNhNGQxMmY5NWQuLjJjNzUwNTM0YjQwNSAxMDA2NDQNCj4gPiA+
ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jDQo+ID4gPiA+IEBAIC00MzAzLDggKzQzMDMsMTAgQEAgc3RhdGlj
IHZvaWQgZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4g
PiA+ID4gICB7DQo+ID4gPiA+ICAgCWVudW0gZHdjM19saW5rX3N0YXRlIG5leHQgPSBldnRpbmZv
ICYgRFdDM19MSU5LX1NUQVRFX01BU0s7DQo+ID4gPiA+IC0JaWYgKGR3Yy0+bGlua19zdGF0ZSAh
PSBuZXh0ICYmIG5leHQgPT0gRFdDM19MSU5LX1NUQVRFX1UzKQ0KPiA+ID4gPiArCWlmICghZHdj
LT5zdXNwZW5kZWQgJiYgbmV4dCA9PSBEV0MzX0xJTktfU1RBVEVfVTMpIHsNCj4gPiA+ID4gKwkJ
ZHdjLT5zdXNwZW5kZWQgPSB0cnVlOw0KPiA+ID4gPiAgIAkJZHdjM19zdXNwZW5kX2dhZGdldChk
d2MpOw0KPiA+ID4gPiArCX0NCj4gPiA+ID4gICAJZHdjLT5saW5rX3N0YXRlID0gbmV4dDsNCj4g
PiA+ID4gICB9DQo+ID4gPiA+IEBAIC00MzEyLDYgKzQzMTQsOSBAQCBzdGF0aWMgdm9pZCBkd2Mz
X2dhZGdldF9zdXNwZW5kX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiA+ID4gPiAgIHN0
YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiA+ID4g
PiAgIAkJY29uc3Qgc3RydWN0IGR3YzNfZXZlbnRfZGV2dCAqZXZlbnQpDQo+ID4gPiA+ICAgew0K
PiA+ID4gPiArCWlmICAoZXZlbnQtPnR5cGUgIT0gRFdDM19ERVZJQ0VfRVZFTlRfU1VTUEVORCkN
Cj4gPiA+IE1pbm9yIG5pdDogc3BhY2luZyBiZXR3ZWVuIGlmIGFuZCAoLg0KPiA+IA0KPiA+IA0K
PiA+IHRoYW5rcyBmb3IgcG9pbnQgaXQgb3V0Lg0KPiA+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBX
aGlsZSB0aGlzIG1heSB3b3JrIGJlY2F1c2UgdGhlIG5leHQgc3VzcGVuZCBldmVudCB3b24ndCBj
b21lIHVudGlsIGENCj4gPiA+IHJlc3VtZS9yZXNldC9kaXNjb25uZWN0IGV2ZW50IG9jY3VyLCBs
ZXQncyBjbGVhciB0aGlzIG9ubHkgb24gcmVzZXQsDQo+ID4gPiByZXN1bWUsIGFuZCBkaXNjb25u
ZWN0IGV2ZW50cy4NCj4gPiANCj4gPiANCj4gPiBzZWVtIG9ubHkgY2xlYXIgb24gdGhlc2UgdGhy
ZWUgZXZlbnRzIGlzIG5vdCBjb3JyZWN0Lg0KPiA+IA0KPiA+IGhvdyBhYm91dCBzdXNwZW5kIC0+
IHdha2V1cCAtPiBzdXNwZW5kIGludGVycnVwdCBzZXF1ZW5jZXMgPw0KPiA+IA0KPiA+IHRoaXMg
aXMgbWVudGlvbmVkIGluIFYxLg0KPiA+IA0KPiA+IA0KPiANCj4gSSBtZWFudCAiV2FrZXVwIiBl
dmVudCwgdGhlcmUncyBubyByZXN1bWUgZXZlbnQuIFdoZW4gdGhlIGhvc3Qgc2VuZHMgYQ0KPiBy
ZXN1bWUgc2lnbmFsIGFuZCB0aGUgZGV2aWNlIGlzIGFibGUgdG8gcHJvY2VzcyBpdCwgdGhlbiB0
aGUgZHJpdmVyIGdldHMNCj4gdGhlIFdha2V1cCBldmVudC4NCj4gDQoNCkFjdHVhbGx5LCB3ZSBk
byBjYWxsIGl0ICJyZXN1bWUvcmVtb3RlIHdha2V1cCBldmVudCIsIGJ1dCB3ZSBqdXN0IG5hbWVk
DQppdCAid2FrZXVwIiBpbnRlcnJ1cHQgaGVyZSBpbiBkd2MzLg0KDQpBbm90aGVyIHRoaW5nLCBj
YW4geW91IGNsZWFyIHRoZSBzdXNwZW5kZWQgZmxhZyB3aGVuIHJlbW90ZSB3YWtldXAgaXMNCnN1
Y2Nlc3NmdWwgYWxzbz8NCg0KVGhhbmtzLA0KVGhpbmg=
