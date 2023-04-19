Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5170D6E8407
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 23:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjDSV62 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 17:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbjDSV60 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 17:58:26 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A8746AB
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 14:58:22 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33JGnj5T016928;
        Wed, 19 Apr 2023 14:58:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=isLlPgGbVmsS3wZJMHLk6Lyd1AGXssea466BF3mLQy0=;
 b=l65B5wEuo8mz8W6fmUw40qwzpJXjCTQd58uwvl9vgktL/VonR8hGqEV/ZLxRGDc12ZE0
 X7WgWgGK08809omTpKbB2pI5R9o6TvLKzC5lc/wOi+ZjU5cagcy2bTUeFqV7jpiQC/q9
 oOoVzm0z1WsY8pxsY4p6t9RIqI19OIicNE2S6if/lwuS7sX91tE7IBeMAK9eucj4SQbS
 +RbNqMMPLqbNuP8BlnQmpeL5TUoaJzWI/Fm3BozNH1uS/bAE6K6Ab0NjU5Zez+JfmwCV
 Cr2y1uRLQr9vRg+B9zIq5kLRGNf1Ag+Qvk8NVJco3IhQh0PDl7uWz06VWrh6Z5IHracG tQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3pytjfd8f1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 14:58:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681941497; bh=isLlPgGbVmsS3wZJMHLk6Lyd1AGXssea466BF3mLQy0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=GrNiJ9kjqSnrS7OeIQOGO+5mCGKusKyWq13e5fLn7URpsn4IrwJNjvL5XYFp5tbOv
         zTHUXS9DcaTKbycU+6CIje4O9uX0Bw7S6keVSbzeh2kZ/Jp7ZcsAGs26X7Lt0FY3vI
         GtjPdcc5rmMdLTqqhM+g9m6L47BOYfKKhoZus1KkYy6/Ksm0xbETowIO5EI/z/nP2g
         WrSGzn6LBLiT6IYEsT2dB+uMtmTloi28MccvZnRaee8ePgrw7k1sj/vLCYb+HpOgsR
         4skuhul0GZXYC5Ta29lzaFK1vDFqEsVEWKYrwlv35iSbCssOBup08fOiQeCe5FGLP1
         ESv3qzgZSBI0w==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0E2C040757;
        Wed, 19 Apr 2023 21:58:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (unknown [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 99DBFA0068;
        Wed, 19 Apr 2023 21:58:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nxHEMY8D;
        dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 118FE406F9;
        Wed, 19 Apr 2023 21:58:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnOl8abXeFUzcpbUDUxJGhb1pxUuyYO1ApBrhkgD5NCSEwltL8ZdsziqYwGU3lXKLUT6hNN+qG4I3gfLuq7zD5Mhtf8COoeNdr/JPdoBMIVatsD293tZ2yzu1KqNkmWSja9ys1RPGz7kHv2b8hjA+gwyUQiTfReZBSVhK5wZN3il1OH3+pQt/zCsgbX4ROBXfRBZYuz3Pq2WEXguBU6HmNQBaOZsBXYW4OhECaVt+4aO1/WCng0I49i/Tw0ZMeFGyMP3q7elyz/wSJcJfcK5KxtSO0B9ppWW/Xlepu7Y+zhY/aUfX8q7jJfH1llEYUb+MFEYCyGOAcsiZftlHJlO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isLlPgGbVmsS3wZJMHLk6Lyd1AGXssea466BF3mLQy0=;
 b=fcntdFU3QyG8lmorUNHtfITS3+wZMwp8E3/cm6+ae6pu46E409OEMdz1Q3ux3K+0jEKe00cCim9oE0YfxYxnZxE10UcQvd/bALvvyPAzePPNKsXXTDv8cmEJo299TU+mPQO/SLAfKla8XHc+xClrak9LqTdNmJWMFTbLqs/aZyrhhkZyYQB8Tvr9CKzKqkXLT3COXf4ebwTQwHIBjYZwBitpVAjAkNbi5dvshTYpqhSB+rdJu2njcDY7U6EMjTHTAKF0WMY6OSPmBzITBLsedPUFONn5jWVBZorEOa9wSAIZgaPe32XM2gKjZ66SYTjHYVStP9zyWAZGdP9Z8XRjcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isLlPgGbVmsS3wZJMHLk6Lyd1AGXssea466BF3mLQy0=;
 b=nxHEMY8DkICKFuh/1pIDRKza+V7EQVcqHV2tUPTZhghgyWjhnDfghQ9othcOl+luCIeKonR6tQlUISC6i1hPlC9G54LLsdEUCIE4Io0s2q+WnQCjTDcX4Z+aViHA/uGiNB1tQixRtWKvBPxtFl3nRASByVNZOc9CFhYYGnkLLXE=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 21:58:13 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::a6ef:a9e2:ad28:f5cf]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::a6ef:a9e2:ad28:f5cf%7]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 21:58:13 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAF/uAgAACIQCAAFWhgIABFUMA
Date:   Wed, 19 Apr 2023 21:58:13 +0000
Message-ID: <20230419215810.cak2565iqx74s755@synopsys.com>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <20230419001143.pdxflhzyecf4kvee@synopsys.com>
 <20230419001920.7gughc2sqwwx3a4e@synopsys.com>
 <CAMHf4WL4+onLbav5rWoGZLMxhwtZTu8adfoz_8b5Uh__hdKZHw@mail.gmail.com>
In-Reply-To: <CAMHf4WL4+onLbav5rWoGZLMxhwtZTu8adfoz_8b5Uh__hdKZHw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|DS0PR12MB7536:EE_
x-ms-office365-filtering-correlation-id: 63d74bc9-339c-452c-ace2-08db41212c01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HtZhmOg7oISfDxiwocZCvLkCi3y1OlZwmRYhkQuPGd2q6kreNzRzaFsT4oOzH+iGoyKFNYzfyYH8oE5IEUzN21f8bVi/+ujVWZTYGwCOmcoSlV6raYszgcJUA9OGDLSm6JW+8UpeGAS6AJ/XCG/Vx1knuJOA0OHMSKs9G+pSdWE/Tgbk7bWIBB4ey1cEKE4s/+8LrY8pKAu0sfYAI4pXwaSezHwkdS5rcarlB6xQyhTTDkb+yVPHgELec0s0hW0/1oHAKsxKIMKloEIB09jenB6JxIxRSArRna5z0TUdIYKZKKejKqFI9fipJsG2d7C2rE5qplQxIufbsWBIdQliMXc8TelkP7HyMZyGlvdrDNWvWx1YDlV0c50lEL4PqkuaJa5oNfFY9O19VBLcfhPKHNu99lpjL7p47Zpg5mhwmRFj3xMLrZHyP22TQEcZIMErlkMVJNvZbq+t7C28TDFZXWxyKzIytHKlFJStnbfKGNl7ogouAdrj7dK7N7FFwl8kE148n8kBJdgX1Nb0PKvpaN12uDEWj5DyhmJPDurvBVlOEQ7AmQS0KfcUgYRnh8zIGOzqMVUQC9DHEDH1SSUGbsQrq23UEh2rLgshqNJ4d0bXNVunoSoGuMU/pgxRVYOj07GedNfATc+9mEwkCgxoNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199021)(86362001)(2906002)(30864003)(38070700005)(36756003)(66899021)(6486002)(71200400001)(186003)(53546011)(83380400001)(2616005)(6506007)(26005)(6512007)(1076003)(966005)(76116006)(91956017)(64756008)(478600001)(6916009)(66946007)(66476007)(4326008)(66556008)(66446008)(122000001)(41300700001)(38100700002)(54906003)(316002)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW1TS3RIMHNMYzhnOFZUc1dzY1pMaCttR3RkMWRFWkZ3OTBVbnBibmc1ckFt?=
 =?utf-8?B?NFpmbUU5clRXL1Z4Z3RmbElNMUswT21sbWxoaXNDMStST1REN1ZCVnh2RW5j?=
 =?utf-8?B?TVQzb0JaN083T0VXbGE4SnUvNE5DMDVCWUQ4Y1RkdnVYNkZiM0xFUHlkZHJC?=
 =?utf-8?B?MzJnQnNLVUd3VldGTGtKY09KVVlralJzeWRZVzNnM0wzLzJpbzlndVl4TkNa?=
 =?utf-8?B?ellrNnpsYmdNWWpIdnl2c01yM0NqTDdZUTZGTFcrc1lnSTl1bDdZWFZUWWVC?=
 =?utf-8?B?MWt6dEhOSmJ2elRvdHJVcGQ0Q3NMTnJka2QxZ1Z2MGNvUVl5QkFidmZIU291?=
 =?utf-8?B?eHU4a2hYb29TYzJJMUtnSFpKNlp3S2Z5MmRsc09YRFRCOVFFb09PTEpQR0NX?=
 =?utf-8?B?bVJuM09IMVVZMCtJSXhWWUhuUmdlME45K0g4WS82dHE4MUtnTi8xbFRUdDlZ?=
 =?utf-8?B?NnM0NDdmMGJCMHBKNDVkaTlFdWFNQnpNOVhDeG5RSjZrMUdXSjJsTEcrVGFZ?=
 =?utf-8?B?em5QMDAzUzRxbTA3U1F1Z0tLTlFqQ29DOUkwNHRxLzRKMjdwSG1RQzlscHh0?=
 =?utf-8?B?TndOanFVblFWbkQwcUxrVnB2UWdJVUVpZEpxRWswNkZtMDd3UWJYVDJuaUNn?=
 =?utf-8?B?aDlrVTlvcGo2M0lVeGNQR1JOTVlXRTlxb0ZFZnRrWHd0eml5dnhhNjhXWU1V?=
 =?utf-8?B?MHM2aGlHS0F2QXJrVmtxQVVSNHpHVlRJQXVxUDlIUVUwWEdQVFlIeTArT1hm?=
 =?utf-8?B?bk1iS2lqUGZoelpqejB6cFgrWjdOKzhaR1ZYblhwK2JXUEV4aUNTTTVUNWFM?=
 =?utf-8?B?S0JmdlNxWEtmY3dmcHlENmUvZDg0YjFyQVkrN2J2eHpZVmVhcys1VFNaNkl5?=
 =?utf-8?B?Qk5FdFRiOWJGNGt4clVEMC95cEUvQXJBSzE1dTUreFprN1FZZUg3MjVnOTRQ?=
 =?utf-8?B?WkNBR1pzNCt1MlJHcHp6WjZacTFDRmZ4SkJIUmtBTUpnY0VnZEpaNmM3RnAx?=
 =?utf-8?B?bTVuZVdmamIrcjhCbmN4SGlBeDcrVEorQU0reVM3Q0VVY1FIZWp5R1FnaXpO?=
 =?utf-8?B?U0s1d1RSdUxUeWNlS1c2Y0F0elFmNnpOVGNvWWxFTmR3dndQRy92N0M2Vjdv?=
 =?utf-8?B?ZmdOWkJkM21hRGNzYzJCdEdsa3QxWUM0VEt0LzJ1Y2R0Y3gvWEVSUC84Vkc2?=
 =?utf-8?B?c3JHeTFoM2JpTnhpemtBT0NXeWRFQ3pLRmprN3Q3UTFoSGtmNWpreitYbllB?=
 =?utf-8?B?T3BBNEZGRWJPcEVZQ0tWd2dHSndMaG4zVlRTdTc1YzRsVEJiSkZMK3JVYVlF?=
 =?utf-8?B?TjQ4cVo1aTM2RDBwU1FOcHBEVUNRUjFad2JPNDJrdVBibTNMZkZDMVc1bjk0?=
 =?utf-8?B?UERFeWVza2M3V1JHSFBlVTQ0d1BheWdoWVlrMjFseVNIWHhmRFFoNjJIbkVi?=
 =?utf-8?B?UzQ1eEgrR0RvVWRJcUZENFVtUWhPbUhLSy9odm00ZnNDU3R0OXNlYmtJK3BK?=
 =?utf-8?B?V3QrOG1YWFhCaERDOEw0S3g0dDZkTWE1T3d2VXFGeUF3ZlRXeUhUK0ZXMVpw?=
 =?utf-8?B?eUNwWENkOXJGNVhYS3N1dFZzQW1JMWNuV1ZGMkxxQzVhUGRuMG5paDhWdGNM?=
 =?utf-8?B?YXhZSW1NNzA0cVhrNHVNMndXbDk3aytZMldJMlNxUXZDZytvV0Q3NjB3ampK?=
 =?utf-8?B?bmk1N1VzdFl1UTNmT0dpY25BYmIrQ2pieVZhZDk5UGl5NDl0QlozNkV1UThT?=
 =?utf-8?B?WS91Nk1uaFVNaUF5QmJwSTBTQTBBV3NVZG53ODlPaWpMSzI4VE1OMU52MWtI?=
 =?utf-8?B?VEcvbE5LTGQzbFVLSlRmNDhlMzdDcG5SSmpVVWQzRzhVV1luaXJjL1NNNSs4?=
 =?utf-8?B?Z0hZYng5TXczTUd0UHRHalk2clROVVE5RDZGdTU2TFJZU20yR09RQnBUVTVW?=
 =?utf-8?B?aGIySTB6NUFzK3lCMDkwOHlwZFI2VDVNbkI1OVZUSnI2U3VqRzZqeEJJam1B?=
 =?utf-8?B?Wm9PVWNSeHBpTjBqM0M0UDNacVZHcS9TOW44ZWxzVjZ6RENrZ2tCQnpsTXRs?=
 =?utf-8?B?a0tnd0tYbnEwK2h4K1hBQW12aWtSajhSb0UyRG1NUnZiVDVBZDk4VW5Tcll6?=
 =?utf-8?Q?vWfrhODeBgiDvcdErWQpyzQZX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBDC24F1C07FF949934EB33F66872CBB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?T09TTkJ4YWV4QTRaWHdWK2dESWs0dUo1TWJKc0NIWXl0SGphRVBlb0FoOTBS?=
 =?utf-8?B?ZXViUHdiVFJWSXBzQlpXOWhXS09DL0pNZXFFK25sUTVBeEVWd3lsVnR2QUZB?=
 =?utf-8?B?TDlhSGZFcUdpaXJBMVd3VVdGVEZidHZBdFNMeUVwTnFBVXJmVHoyd3IzcDIy?=
 =?utf-8?B?QWFpMG42Tm00V0UxbVI1Uk1MMkwvMVJrY25SNlA2aTJGVWhtZGk4WEFPenFR?=
 =?utf-8?B?MVpmbzJIdTFDdk9OcDdWMDVTbUtPdVZFWFVWVmJ2SDFzTERQNXFHeXYvOGFU?=
 =?utf-8?B?aTZHc0ZSbmk2REY1ekV6aStxemdTU1VzOFU2RzFPSVl1bzBDNTR3bVA0Zm9M?=
 =?utf-8?B?QkRlZ2VXRS9uY0pObzlJRFNLQ0dpV0p5Zk1HNmlxRG1LY1FmaDFsbFovajV2?=
 =?utf-8?B?OFZISUZodjh4UGRvQ2ZPNXE4M0RSZE82NGljZ3RsUnY4WXRjSVRZMlNVd0dS?=
 =?utf-8?B?KzlSM1lZSjQwalhMTEU1SG9LSnJTWDVHa0o0OWx1WEhNS2ZCK1RhTHBnNGtO?=
 =?utf-8?B?eitGUFN2enJwcHFuZFkxUW1OZmZreG1oSk9ZZnR0dzlKeFlFWTBzMmFIdStx?=
 =?utf-8?B?b2dmVndIZ2xONUNUS05od2ZPUzJYVk92Q3ZxWUwrQTFNRktZWmtxeHBwRlBV?=
 =?utf-8?B?ZGRQb1dDOGJhK0p2YWx4cDVmVnBHZktqOUxSNkU5YStKWU9yVm5OZ3JCa2Q3?=
 =?utf-8?B?ZXpKaHNmQklPQlZYdldTeEVTeFdaZ1Y1ZjloNFREd0hYNGRDV1FWNzB5WlZu?=
 =?utf-8?B?Nm16Q2FYRFBkSmlqVE5OVityZE1BSDBibHZRV0cxNVpLay9ZMU93cXI3N0tq?=
 =?utf-8?B?OTlKKzQ5dXEvL1QyVzF2OVA0dW1tMHM0d0F3Y0lPVFdLdkN2aklDanQ2N1Bo?=
 =?utf-8?B?WDFYNkxDblJLVnJkK2VmNVRoamQwMjdqaHNvWHJiV2ovZTFuUS9mNzFTM1JH?=
 =?utf-8?B?VUtya1RIUTFtNkdiZGJWT1gvek9Rby9rRTJpeUVzRFk2UTdCNms5ZS9TMWdU?=
 =?utf-8?B?TlJtdW1MY3ZCZkFIekdSMUcrU1lyemFwdDY4VjMwSTVQSDlwRjFGS1VrTFRq?=
 =?utf-8?B?elN0VitaTUgwR2VDRG1tZWx0Tjd0RDJpR01ZTU5HUnhVa0NjY0dlL2xPOEoy?=
 =?utf-8?B?bCtLdlFZQ1haRHQwd2UvTm9OWFNnSEVvQTM2TzVRcjlIc1lEUHBYODNRVzV4?=
 =?utf-8?B?UHVlcGVhVXEzWVlDZVBYaG91K0oxK1BCWVpaUEQ2RHJKSmRBM3RPS2ZJL25n?=
 =?utf-8?Q?w/CT7EK4J4pQIM0?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d74bc9-339c-452c-ace2-08db41212c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 21:58:13.0886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1KQquI8+du1lWS+Z9D1Ltl6YCWSSc2x5K0R46aJX8eErauXZiPX/wXU60ecz33UxpXgxj5jLNd1T3Noxf0gcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536
X-Proofpoint-GUID: rUBS-wZfSf3vEM4VvpW_COlpYHUXOuPh
X-Proofpoint-ORIG-GUID: rUBS-wZfSf3vEM4VvpW_COlpYHUXOuPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_14,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304190189
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBBcHIgMTgsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiBPbiBUdWUsIEFw
ciAxOCwgMjAyMyBhdCA1OjE54oCvUE0gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3Bz
eXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IE9uIFdlZCwgQXByIDE5LCAyMDIzLCBUaGluaCBOZ3V5
ZW4gd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEFwciAxOCwgMjAyMywgQXZpY2hhbCBSYWtlc2ggd3Jv
dGU6DQo+ID4gPiA+IE9uIFR1ZSwgQXByIDE4LCAyMDIzIGF0IDEyOjQw4oCvUE0gVGhpbmggTmd1
eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IE9uIE1vbiwgQXByIDE3LCAyMDIzLCBBdmljaGFsIFJha2VzaCB3cm90ZToNCj4gPiA+ID4g
PiA+IE9uIE1vbiwgQXByIDE3LCAyMDIzIGF0IDc6NDnigK9QTSBUaGluaCBOZ3V5ZW4gPFRoaW5o
Lk5ndXllbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiBPbiBNb24sIEFwciAxNywgMjAyMywgQXZpY2hhbCBSYWtlc2ggd3JvdGU6DQo+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBPbiA0LzE3LzIzIDA2OjQ5LCBHcmVnIEtIIHdyb3RlOg0K
PiA+ID4gPiA+ID4gPiA+ID4gT24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgMDI6MDM6MDJQTSAtMDcw
MCwgQXZpY2hhbCBSYWtlc2ggd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+ID4+IFRoaXMgcHJvYmxlbSBtYXkgYmUgZnVydGhlciBleGFnZ2VyYXRlZCBieSB0aGUgRFdD
MyBjb250cm9sbGVyIGRyaXZlcg0KPiA+ID4gPiA+ID4gPiA+ID4+ICh3aGljaCBpcyB3aGF0IG15
IGRldmljZSBoYXMpIG5vdCBzZXR0aW5nIHRoZSBJTUkgZmxhZyB3aGVuDQo+ID4gPiA+ID4gPiA+
ID4gPj4gbm9faW50ZXJydXB0IGZsYWcgaXMgc2V0DQo+ID4gPiA+ID4gPiA+ID4gPj4gKGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY2VkMzM2
Yzg0NDM0NTcxMzQwYzA3OTk0ZTM2NjdhMGVlMjg0ZmVmZS4xNjY2NzM1NDUxLmdpdC5UaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tLyk/X187ISFBNEYyUjlHX3BnIWZCMGtyVVg2cXNPWHJCc09Iekxz
dFZGV3FUTEw5bmN3R0ZYeGx4SzBlZWRMWV8yOVhkd2pYUnRiTy1FV3YxZVg1b2tOMXJPZUJac3Ba
MjFLU2I1YiQNCj4gPiA+ID4gPiA+ID4gPiA+PiBVVkMgR2FkZ2V0IERyaXZlciBzZXRzIHRoZSBu
b19pbnRlcnJ1cHQgZmxhZyBmb3IgfjMvNCBvZiBpdHMgcXVldWVkDQo+ID4gPiA+ID4gPiA+ID4g
Pj4gdXNiX3JlcXVlc3QsIHNvIGFuIElTT0MgZmFpbHVyZSBtYXkgbm90IGltbWVkaWF0ZWx5IGlu
dGVycnVwdCB0aGUgVVZDDQo+ID4gPiA+ID4gPiA+ID4gPj4gZ2FkZ2V0IGRyaXZlciwgbGVhdmlu
ZyBtb3JlIHRpbWUgZm9yIHRoZSBmcmFtZSB0byBmaW5pc2ggZW5jb2RpbmcuDQo+ID4gPiA+ID4g
PiA+ID4gPj4NCj4gPiA+ID4gPiA+ID4gPiA+PiBJIGNvdWxkbid0IGZpbmQgYW55IGNvbmNyZXRl
IGVycm9yIGhhbmRsaW5nIHJ1bGVzIGluIHRoZSBVVkMgc3BlY3MsIHNvDQo+ID4gPiA+ID4gPiA+
ID4gPj4gSSBhbSBub3Qgc3VyZSB3aGF0IHRoZSBwcm9wZXIgc29sdXRpb24gaGVyZSBpcy4gVG8g
dHJ5IG91dCwgSSBjcmVhdGVkDQo+ID4gPiA+ID4gPiA+ID4gPj4gYSBwYXRjaCAoYXR0YWNoZWQg
YmVsb3cpIHRoYXQgZGVxdWV1ZXMgYWxsIHF1ZXVlZCB1c2JfcmVxdWVzdHMgZnJvbQ0KPiA+ID4g
PiA+ID4gPiA+ID4+IHRoZSBlbmRwb2ludCBpbiBjYXNlIG9mIGFuIElTT0MgZmFpbHVyZSBhbmQg
Y2xlYXJzIHRoZSB1dmMgYnVmZmVyDQo+ID4gPiA+ID4gPiA+ID4gPj4gcXVldWUuIFRoaXMgZWxp
bWluYXRlZCB0aGUgcGFydGlhbCBmcmFtZXMgd2l0aCBubyBwZXJjZWl2YWJsZSBmcmFtZQ0KPiA+
ID4gPiA+ID4gPiA+ID4+IGRyb3BzLg0KPiA+ID4gPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPiA+
ID4gPj4gU28gbXkgcXVlc3Rpb25zIGhlcmUgYXJlOg0KPiA+ID4gPiA+ID4gPiA+ID4+IDEuIElz
IHRoaXMgYSBrbm93biBpc3N1ZSwgYW5kIGlmIHNvIGFyZSB0aGVyZSB3b3JrYXJvdW5kcyBmb3Ig
aXQ/DQo+ID4gPiA+ID4gPiA+ID4gPj4gMi4gSWYgdGhlIGFuc3dlciB0byBhYm92ZSBpcyAiTm8i
LCBkb2VzIHRoZSBleHBsYW5hdGlvbiBhbmQgbWl0aWdhdGlvbg0KPiA+ID4gPiA+ID4gPiA+ID4+
IHNlZW0gcmVhc29uYWJsZT8NCj4gPiA+ID4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+ID4gPiA+ID4+
IFBhdGNoIGZvbGxvd3MgKG1vc3RseSBmb3IgaWxsdXN0cmF0aW9uLCBJIGNhbiBmb3JtYWxpemUg
aXQgaWYNCj4gPiA+ID4gPiA+ID4gPiA+PiBuZWVkZWQhKS4gSXQgYWRkcyBhIG5ldyAncmVxX2lu
ZmxpZ2h0JyBsaXN0IHRvIHRyYWNrIHF1ZXVlZA0KPiA+ID4gPiA+ID4gPiA+ID4+IHVzYl9yZXF1
ZXN0cyB0aGF0IGhhdmUgbm90IGJlZW4gZ2l2ZW4gYmFjayB0byB0aGUgZ2FkZ2V0IGRyaXZlciBh
bmQNCj4gPiA+ID4gPiA+ID4gPiA+PiBkcm9wcyBhbGwgdGhlIHF1ZXVlZCByZXF1ZXN0cyBpbiBj
YXNlIG9mIGFuIElTT0MgZmFpbHVyZS4gVGhlIG90aGVyDQo+ID4gPiA+ID4gPiA+ID4gPj4gY2hh
bmdlcyBhcmUgZm9yIHRoZSBleHRyYSBib29ra2VlcGluZyByZXF1aXJlZCB0byBoYW5kbGUgZHJv
cHBpbmcgYWxsDQo+ID4gPiA+ID4gPiA+ID4gPj4gZnJhbWVzLiBJIGhhdmVuJ3QgYmVlbiBhYmxl
IHRvIGNvbmZpcm0gaXQsIGJ1dCBhcyBmYXIgYXMgSSBjYW4gdGVsbA0KPiA+ID4gPiA+ID4gPiA+
ID4+IHRoZSBpc3N1ZSBleGlzdHMgYXQgVG9UIGFzIHdlbGwuDQo+ID4gPiA+ID4gPiA+ID4gPj4N
Cj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gUGVyaGFwcyB0aGlzIGNvbnZlcnNhdGlvbiB3
aXRoIEplZmYgbWF5IGV4cGxhaW4gdGhlIGlzc3VlcyB5b3Ugb2JzZXJ2ZWQ6DQo+ID4gPiA+ID4g
PiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMjEwMjExNjQzNDkuZmZ0NHlxbnh1enRzcWRldUBzeW5vcHN5cy5jb20vX187ISFBNEYy
UjlHX3BnIWVLM1Z5QXE3dlg3MHZBLVdKTEE2X2JQTWJaRngwbjMzd0gzOUpJdEh6d0NOVnFLU2tO
MmFHMGl6RjBHWlBXcVl4a2dMLWZOaW5XbElXNzFIYkdHQyQNCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gVG8gc3VtbWFyaXplZCB0aGUgbG9uZyBjb252ZXJzYXRpb24sIHRoZSBVVkMgbmVl
ZHMgdG8gbWFpbnRhaW4gYQ0KPiA+ID4gPiA+ID4gPiBjb25zdGFudCBxdWV1ZSBvZiB1c2IgcmVx
dWVzdHMuIEVhY2ggcmVxdWVzdCBpcyBzY2hlZHVsZWQgZm9yIGEgc3BlY2lmaWMNCj4gPiA+ID4g
PiA+ID4gaW50ZXJ2YWwuIElmIHRoZSBVVkMgY291bGRuJ3Qga2VlcCB1cCBmZWVkaW5nIHJlcXVl
c3RzIHRvIHRoZQ0KPiA+ID4gPiA+ID4gPiBjb250cm9sbGVyLCB0aGVuIHdlIHdpbGwgaGF2ZSBz
dGFsZSByZXF1ZXN0cyBhbmQgbWlzc2VkIGlzb2MuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiA+IEZyb20gdGhlIGRpc2N1c3Npb24gYW5kIHJldmlldywgdGhlIFVWQyBjb3VsZG4ndCBxdWV1
ZSByZXF1ZXN0cyBmYXN0DQo+ID4gPiA+ID4gPiA+IGVub3VnaC4gVGhlIHByb2JsZW0gaXMgZXhh
Y2VyYmF0ZWQgd2hlbiB5b3UgcmVkdWNlIHRoZSBpbnRlcnJ1cHQNCj4gPiA+ID4gPiA+ID4gZnJl
cXVlbmN5IHdpdGggbm9faW50ZXJydXB0IHNldHRpbmcuIFRoZSBkd2MzIGRyaXZlciBoYXMgc29t
ZSBiYXNpYw0KPiA+ID4gPiA+ID4gPiBtZWNoYW5pc20gdG8gZGV0ZWN0IGZvciB1bmRlcnJ1biBi
eSBjaGVja2luZyBpZiB0aGUgcXVldWUgaXMgZW1wdHksIGJ1dA0KPiA+ID4gPiA+ID4gPiB0aGF0
J3Mgbm90IGVub3VnaCB0byB3b3JrYXJvdW5kIGl0Lg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiBZb3VyIHN1Z2dlc3Rpb24gdG8gZGVxdWV1ZSB0aGUgcmVxdWVzdCB3b3VsZCBtZWFuIHRo
ZSBjb250cm9sbGVyIGRyaXZlcg0KPiA+ID4gPiA+ID4gPiB3aWxsIHJlc2NoZWR1bGUgdGhlIGlz
b2MgdHJhbnNmZXIgYWdhaW4sIHdoaWNoIHJlc2NoZWR1bGUgdGhlIG5leHQNCj4gPiA+ID4gPiA+
ID4gcmVxdWVzdCBmb3IgYSBuZXcgaW50ZXJ2YWwgKHBvdGVudGlhbGx5IGF2b2lkIGJlaW5nIHN0
YWxlKS4gVGhhdCdzIGZpbmUsDQo+ID4gPiA+ID4gPiA+IGJ1dCB0aGF0IG1heSBub3QgYmUgYSBn
cmVhdCBzb2x1dGlvbiBiZWNhdXNlIHdlJ3JlIHN0aWxsIHBsYXlpbmcgY2F0Y2gNCj4gPiA+ID4g
PiA+ID4gdXAgYW5kIHRoZSBtaXNzZWQgaXNvYyBhbHJlYWR5IGhhcHBlbmVkLg0KPiA+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gPiBZb3UgbWF5IHRyeSB0byBkbyB0aGUgZm9sbG93aW5ncyB0byBt
aXRpZ2F0ZSB0aGlzIGlzc3VlOg0KPiA+ID4gPiA+ID4gPiAxKSBNYWtlIHN1cmUgVVZDIHRvIG9u
bHkgcXVldWluZyByYXRlIGlzIGNvbnN0YW50LiBQZXJoYXBzIHF1ZXVlIGR1bW15DQo+ID4gPiA+
ID4gPiA+ICAgIHJlcXVlc3RzIGluIGJldHdlZW4gdGltZSBnYXBzIGlmIG5lZWQgYmU/DQo+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGlzIGlzIGV4dHJlbWVseSBoZWxwZnVsLCB0aGFuayB5
b3UhIEkgaGF2ZSBhIHNvbWV3aGF0IGJhc2ljDQo+ID4gPiA+ID4gPiBxdWVzdGlvbjogRm9yIGFu
IGlzb2MgcmVxdWVzdCwgaXMgaXRzICJmcmVzaG5lc3MiIGRldGVybWluZWQgZnJvbSB0aGUNCj4g
PiA+ID4gPiA+IHRpbWUgYXQgd2hpY2ggdXNiX2VwX3F1ZXVlIGlzIGNhbGxlZCwgb3IgZnJvbSB0
aGUgdGltZSBhdCB3aGljaCB0aGUNCj4gPiA+ID4gPiA+IHByZXZpb3VzIHJlcXVlc3Qgd2FzIHRy
YW5zZmVycmVkIHRvIHRoZSBob3N0PyBJZiB0aGUgImZyZXNobmVzcyIgaXMNCj4gPiA+ID4gPiA+
IGRldGVybWluZWQgZnJvbSB0aGUgdGltZSAndXNiX2VwX3JlcXVlc3QnIHdhcyBjYWxsZWQsIEkg
d29uZGVyIGlmIHRoZQ0KPiA+ID4gPiA+ID4gInVuZGVycnVuIiBpcyBhcnRpZmljaWFsIGJlY2F1
c2UgVVZDIEdhZGdldCBkcml2ZXIgcHVtcHMgYWxsIGZyZWUNCj4gPiA+ID4gPiA+IHVzYl9yZXF1
ZXN0cyBhdCBvbmNlLCBhbmQgdGhlbiB3YWl0cyBhcm91bmQgZG9pbmcgbm90aGluZyB3aGlsZSB0
aGUNCj4gPiA+ID4gPiA+IHVzYl9yZXF1ZXN0cyBnZXQgc3RhbGUgaW4gdGhlIGNvbnRyb2xsZXIn
cyBxdWV1ZS4gSW4gdGhpcyBjYXNlLCBqdXN0DQo+ID4gPiA+ID4gPiBzbG93aW5nIHRoZSBlbmNv
ZGUgbG9vcCB0byB3YWl0IGEgbGl0dGxlIGJlZm9yZSBxdWV1aW5nIG1vcmUgcmVxdWVzdHMNCj4g
PiA+ID4gPiA+IHNob3VsZCBkbyBlZmZlY3RpdmVseSB3aGF0IHlvdSBzdWdnZXN0IGFib3ZlPw0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEhlcmUncyBhIHNpbXBsaWZpZWQgdmVy
c2lvbiBvZiBob3cgaXQgd29ya3M6DQo+ID4gPiA+ID4gKE5vdGUgdGhhdCBJJ2xsIGJlIHRhbGtp
bmcvdXNpbmcgdXNiIHJlcXVlc3QgYXMgaWYgaXQncyBUUkJzIGFuZCBhbHNvDQo+ID4gPiA+ID4g
aWdub3JlIFNHLiBJIHdpbGwgYWxzbyBvbmx5IGZvY3VzIGFib3V0IHRoZSBjdXJyZW50IGhhbmRs
aW5nIG9mIHRoZQ0KPiA+ID4gPiA+IGdhZGdldCBkcml2ZXIgYW5kIGR3YzMgZHJpdmVyLikNCj4g
PiA+ID4NCj4gPiA+ID4gSSBhcHByZWNpYXRlIHlvdSB0YWtpbmcgdGhlIHRpbWUgdG8gZXhwbGFp
biB0aGlzLiBUaGlzIGlzIHZlcnkNCj4gPiA+ID4gZW5saWdodGVuaW5nLCB0aGFuayB5b3UhDQo+
ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGUgY29udHJvbGxlciB0cmFja3MgdGhlIGN1
cnJlbnQgdWZyYW1lLiBGb3IgaXNvYyBlbmRwb2ludCwgd2hlbiB5b3UNCj4gPiA+ID4gPiBjYWxs
IHVzYl9lcF9xdWV1ZSgpLCB0aGUgY29udHJvbGxlciBkb2Vzbid0IGNvbnN1bWUgdGhlIHJlcXVl
c3QgcmlnaHQNCj4gPiA+ID4gPiBhd2F5LiBUaGUgcmVxdWVzdCBpcyBzY2hlZHVsZWQgZm9yIGEg
c3BlY2lmaWMgaW50ZXJ2YWwuIEZvciBVVkMsIGFuDQo+ID4gPiA+ID4gaW50ZXJ2YWwgaXMgYSBz
aW5nbGUgdWZyYW1lICgxMjV1cykuIEFzIHRoZSBjdXJyZW50IHVmcmFtZSBrZWVwcw0KPiA+ID4g
PiA+IGluY3JlbWVudGluZywgZWFjaCByZXF1ZXN0IG9uIGEgcXVldWUgaXMgY29uc3VtZWQuIElm
IHRoZXJlJ3Mgbm8gcmVxdWVzdA0KPiA+ID4gPiA+IGF2YWlsYWJsZSBmb3IgdGhlIGN1cnJlbnQg
dWZyYW1lLCB0aGUgbmV4dCBxdWV1ZWQgcmVxdWVzdCBpcyBjb25zaWRlcmVkDQo+ID4gPiA+ID4g
c3RhbGUgb3IgZXhwaXJlZC4gVGhpcyBjYXNlIGlzIGNvbnNpZGVyZWQgdW5kZXJydW4uDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiAiZnJlc2huZXNzIiBtZWFucyB0aGUgcmVxdWVzdCBpcyBzY2hlZHVs
ZWQgZm9yIGEgZnV0dXJlIHVmcmFtZS4gInN0YWxlIg0KPiA+ID4gPiA+IG1lYW5zIHRoZSByZXF1
ZXN0IGlzIHF1ZXVlZCBmb3IgYSBwYXN0IHVmcmFtZS4gSXNvYyBkYXRhIGlzIHRpbWUNCj4gPiA+
ID4gPiBzZW5zaXRpdmUuIFNvIGlmIHRoZSBkYXRhIGlzbid0IGdvbmUgb3V0IGF0IGEgc3BlY2lm
aWMgdGltZSwgdGhlbiBpdCdzDQo+ID4gPiA+ID4gZHJvcHBlZC4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IFRoZSBwcm9ibGVtIHdpdGggbWFueSBnYWRnZXQgZHJpdmVycyB0aGF0IHVzZSBpc29jIGVu
ZHBvaW50IGlzIHRoYXQgdGhleQ0KPiA+ID4gPiA+IG9ubHkgcXVldWUgbW9yZSByZXF1ZXN0cyB3
aGVuIHRoZXkgZ2V0IG5vdGlmaWVkIHRoYXQgdGhlIHByZXZpb3VzIHNldCBvZg0KPiA+ID4gPiA+
IHJlcXVlc3RzIGFyZSBjb21wbGV0ZWQuIFRoaXMgY3JlYXRlcyB0aW1lIGdhcHMgd2hpY2ggY2Fu
IHN0YXJ2ZSB0aGUNCj4gPiA+ID4gPiBjb250cm9sbGVyIG9mIG1vcmUgcmVxdWVzdHMuDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBXZSBoYXZlIHNvbWUgYmFzaWMgbWVjaGFuaXNtIGluIGR3YzMgdG8g
cmVzY2hlZHVsZSBuZXcgcmVxdWVzdHMgd2hlbg0KPiA+ID4gPiA+IHRoZXJlJ3MgbWlzc2VkIGlz
b2MgYW5kIHRoZSBxdWV1ZSBpcyBlbXB0eSBmb3IgVVZDLiBIb3dldmVyIHRoYXQncyBub3QNCj4g
PiA+ID4gPiBlbm91Z2guIFRoZSB0aW1lIHRoZSBjb250cm9sbGVyIGNvbnN1bWVzIHRoZSByZXF1
ZXN0IGFuZCB0aGUgdGltZSB0aGUNCj4gPiA+ID4gPiBkcml2ZXIgaGFuZGxlcyB0aGUgaW50ZXJy
dXB0IGlzIGRpZmZlcmVudC4gVGhlIGRyaXZlciBtYXkgbm90IGtub3cgdGhhdA0KPiA+ID4gPiA+
IHF1ZXVlIGlzIGVtcHR5IHVudGlsIGl0J3MgYWxyZWFkeSB0b28gbGF0ZS4gVGhlIGdhZGdldCBk
cml2ZXIganVzdCBuZWVkcw0KPiA+ID4gPiA+IHRvIG1ha2Ugc3VyZSB0byBrZWVwIHRoZSByZXF1
ZXN0IHF1ZXVlIHRvIGF0IGxlYXN0IFggYW1vdW50IG9mIHJlcXVlc3RzLg0KPiA+ID4gPiA+IE5v
dGUgdGhhdCAxMjV1cyBpcyByZWxhdGl2ZWx5IGZhc3QuDQo+ID4gPiA+DQo+ID4gPiA+IEkgc2Vl
LCBhbmQgSSB0aGluayBJIHVuZGVyc3RhbmQgR3JlZydzIHByZXZpb3VzIGNvbW1lbnQgYmV0dGVy
IGFzDQo+ID4gPiA+IHdlbGw6IFRoZSBVVkMgZHJpdmVyIGlzbid0IGZhbGxpbmcgYmVoaW5kIG9u
IHRoZSB2aWRlbyBzdHJlYW0sIGl0IGlzDQo+ID4gPiA+IGZhbGxpbmcgYmVoaW5kIHRoZSB1c2Ig
Y29udHJvbGxlcidzIG1vbm90b25pYyBpc29jIHN0cmVhbS4NCj4gPiA+ID4NCj4gPiA+ID4gRnJv
bSB3aGF0IEkgY2FuIHNlZSwgdGhpcyBsZWF2ZXMgdXMgaW4gYW4gaW50ZXJlc3RpbmcgcGxhY2U6
IFVWQw0KPiA+ID4gPiBhbGxvd3MgdGhlIGhvc3QgdG8gY29uZmlndXJlIHRoZSBjYW1lcmEncyBv
dXRwdXQgcmVzb2x1dGlvbiBhbmQgZnBzLA0KPiA+ID4gPiB3aGljaCBlZmZlY3RpdmVseSBjb250
cm9scyBob3cgZmFzdCB0aGUgY2FtZXJhIGlzIGdlbmVyYXRpbmcgZGF0YS4NCj4gPiA+ID4gVGhp
cyBpcyBhdCBvZGRzIHdpdGggdGhlIFVWQyBnYWRnZXQgZHJpdmVyLCB3aGljaCBjdXJyZW50bHkg
cGFja3MgZWFjaA0KPiA+ID4gPiB2aWRlbyBmcmFtZSBpbnRvIGFzIGZldyB1c2JfcmVxdWVzdHMg
YXMgcG9zc2libGUgKHVzaW5nIHRoZSBmdWxsDQo+ID4gPg0KPiA+ID4gSG0uLi4gSSB3b3VsZCBz
cHJlYWQgdGhlIGRhdGEgdG8gbW9yZSByZXF1ZXN0cyBhbmQgbm90IHB1dCBhbGwgdGhlIGVnZ3MN
Cj4gPiA+IGluIG9uZSBiYXNrZXQuIEl0IHNob3VsZG4ndCBiZSBhbiBpc3N1ZSB3aXRoIGR3YzMg
Y29udHJvbGxlciwgYnV0IHNvbWUNCj4gPiA+IGhvc3RzIGFyZW4ndCB0aGUgZ3JlYXRlc3Qgd2hl
biBoYW5kbGluZyBpc29jIGF0IGhpZ2ggdHJhbnNmZXIgcmF0ZS4NCj4gPiA+DQo+ID4gPiA+IGF2
YWlsYWJsZSBzaXplIGluIHVzYl9yZXF1ZXN0cykuIEVmZmVjdGl2ZWx5LCB0aGUgVVZDIGdhZGdl
dCBkcml2ZXINCj4gPiA+ID4gYXR0ZW1wdHMgdG8gdXNlIHRoZSAiZnVsbCIgYmFuZHdpZHRoIG9m
IGlzb2MgdHJhbnNmZXJzIGV2ZW4gd2hlbiB0aGUNCj4gPiA+ID4gY2FtZXJhIGlzbid0IGdlbmVy
YXRpbmcgZGF0YSBmYXN0IGVub3VnaC4gRm9yIGV4YW1wbGUsIGluIG15DQo+ID4gPiA+IG9ic2Vy
dmF0aW9uczogMSB2aWRlbyBmcmFtZSBpcyB+MjJrQi4gQXQgMzBmcHMsIHRoaXMgcmVwcmVzZW50
cyAxLzMwDQo+ID4gPiA+IG9mIHRoZSBhbW91bnQgb2YgZGF0YSB0aGUgY2FtZXJhIHdvdWxkIGdl
bmVyYXRlIGluIGEgc2Vjb25kLiBUaGlzIDIya0INCj4gPiA+ID4gaXMgc3BsaXQgaW50byA4IHVz
Yl9yZXF1ZXN0cyB3aGljaCBpcyBhYm91dCAxLzEwMDAgdGhlIG51bWJlciBvZg0KPiA+ID4gPiBy
ZXF1ZXN0cyBVVkMgZHJpdmVyIG5lZWRzIHRvIGdlbmVyYXRlIHBlciBzZWNvbmQgdG8gcHJldmVu
dCBpc29jDQo+ID4gPiA+IGZhaWx1cmVzIChhc3N1bWluZyAxMjV1cyBtb25vdG9uaWMgdWZyYW1l
cykuIEFzc3VtaW5nIHNvbWUgZnVkZ2UNCj4gPiA+ID4gZmFjdG9yIGZyb20gdGhlIHNpbXBsaWZp
Y2F0aW9ucyBpbiB5b3VyIGV4cGxhbmF0aW9uIGdpdmVzIHRoZSB1dmMNCj4gPiA+ID4gZHJpdmVy
IHNvbWUgZXh0cmEgbGVld2F5IHdpdGggcmVxdWVzdCBxdWV1aW5nLCB3ZSdyZSBzdGlsbCByb3Vn
aGx5IHR3bw0KPiA+ID4gPiBvcmRlciBvZiBtYWduaXR1ZGVzIG91dCBvZiBzeW5jLiBFdmVuIHdp
dGggcGVyZmVjdCAnY29tcGxldGUnDQo+ID4gPiA+IGNhbGxiYWNrcyBhbmQgdmlkZW8gZnJhbWUg
ZW5jb2RpbmdzLCBhbiB1bmRlcnJ1biBzZWVtcyBpbmV2aXRhYmxlLg0KPiA+ID4gPiBEYXRhIGlz
IGJlaW5nIGdlbmVyYXRlZCBhdCBhIGZhciBzbG93ZXIgcmF0ZSB0aGFuIGl0IGlzIGJlaW5nDQo+
ID4gPiA+IHRyYW5zZmVycmVkLiBEb2VzIHRoaXMgcmVhc29uaW5nIHNlZW0gdmFsaWQ/DQo+ID4g
PiA+DQo+ID4gPiA+IEp1c3QgYXMgYSB0ZXN0IEknbGwgdHJ5IHVwZGF0aW5nIHRoZSBVVkMgZHJp
dmVyIHRvIGNvbnN1bWUgMjY2DQo+ID4gPiA+IHVzYl9yZXF1ZXN0cyBwZXIgdmlkZW8gZnJhbWUg
KH4xLzMwIG9mIDgwMDApLCB3aGljaCBzaG91bGQgYmUgZW5vdWdoDQo+ID4gPiA+IHRvIGtlZXAg
dGhlIHVzYiBjb250cm9sbGVyIHF1ZXVlIG9jY3VwaWVkIGZvciB+MS8zMHMuIElkZWFsbHksIGJ5
IHRoZQ0KPiA+ID4gPiB0aW1lIHRoZSBjb250cm9sbGVyIHF1ZXVlIGlzIGVtcHR5LCB0aGUgY2Ft
ZXJhIHdvdWxkIGhhdmUgcHJvZHVjZWQgYQ0KPiA+ID4NCj4gPiA+IFlvdSBtZWFuIHF1ZXVlIDI2
NiByZXF1ZXN0cyBhdCBvbmNlPyBUaGlzIG1heSB3b3JrLiBUaGVyZSBzaG91bGQgYmUgYQ0KPiA+
ID4gbGFyZ2UgZW5vdWdoIHRpbWUgZ2FwIHNvIHRoYXQgdGhlIGR3YzMgZHJpdmVyIGNhbiBwcm9w
ZXJseSBkZXRlY3QgYW4NCj4gPiA+IGVtcHR5IHF1ZXVlIHRvIGJlIGFibGUgdG8gcmVzY2hlZHVs
ZSBuZXcgcmVxdWVzdHMgZm9yIHRoZSBuZXh0IHZpZGVvDQo+ID4gPiBmcmFtZS4NCj4gPg0KPiA+
IFRoYXQncyBhIGxvdCBvZiByZXF1ZXN0cyB0byBhbGxvY2F0ZS4gQ2FuJ3QgeW91IGp1c3QgbWFr
ZSBzdXJlIHRvIG5vdGlmeQ0KPiA+IHRoZSBnYWRnZXQgZHJpdmVyIG1vcmUgb2Z0ZW4gdG8gcmVx
dWV1ZSByZXF1ZXN0cyBhbmQgZG9uJ3Qgc2V0DQo+ID4gbm9faW50ZXJydXB0IGFzIG9mdGVuPw0K
PiANCj4gT2ggeWVzLCBJIGFtIGhvcGluZyBVVkMgZ2FkZ2V0IGRyaXZlciBhbmQgdGhlIHVzYiBj
b250cm9sbGVyIGNhbiByZWFjaA0KPiBhIHN0ZWFkeSBzdGF0ZSBvZiBwdW1waW5nIG91dCByZXF1
ZXN0cyB3aXRoIGxlc3MgdGhhbiAyNjYgcmVxdWVzdHMNCj4gYWxsb2NhdGVkLiBJIHdpbGwgcGxh
eSBhcm91bmQgYW5kIHNlZSBob3cgbWFueSByZXF1ZXN0cyBpdCB0YWtlcyB0bw0KPiByZWFjaCB0
aGUgc3RlYWR5IHN0YXRlLiBJIHRoaW5rIHRoZSBlbmNvZGUgbG9vcCBjYW4gbWFpbnRhaW4gdGhl
IGlzb2MNCj4gZGVhZGxpbmVzIGFzIGxvbmcgYXMgdGhlcmUgYXJlIGZyZWUgcmVxdWVzdHMgYXZh
aWxhYmxlLg0KPiANCg0KWW91IG5lZWQgdG8gbWVhc3VyZSB0aGUgd29yc3QgbGF0ZW5jeSBvZiB5
b3VyIHNldHVwIGludGVycnVwdCBoYW5kbGluZw0KYW5kIGhvdyBsb25nIGl0IHRha2VzIHRvIHBy
ZXBhcmUgYW5kIHF1ZXVlIHRoZSByZXF1ZXN0cy4gV2Uga25vdyB0aGF0DQplYWNoIHJlcXVlc3Qg
c2hvdWxkIGNvbXBsZXRlIGFuZCBpbnRlcnJ1cHQgYWZ0ZXIgMTI1dXMuIFRha2luZyBpbnRvDQph
Y2NvdW50IG9mIGFsbCB0aGUgbGF0ZW5jeSwgeW91IGNhbiBzZWUgaG93IG1hbnkgcmVxdWVzdHMg
eW91IG11c3QNCm1haW50YWluIGluIHRoZSBxdWV1ZSBhdCBhbGwgdGltZS4gRS5nLiwgaWYgeW91
IG1haW50YWluIGF0IGxlYXN0IDgNCnJlcXVlc3RzIGluIGEgcXVldWUsIHlvdSBoYXZlIHJvdWdo
bHkgOCoxMjV1cyBvZiBsZWV3YXkgdG8gcXVldWUgdGhlDQpuZXh0IHJlcXVlc3QuDQoNCkJSLA0K
VGhpbmg=
