Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29059668B42
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jan 2023 06:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbjAMF0J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Jan 2023 00:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235983AbjAMFZN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Jan 2023 00:25:13 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D802C61322
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 21:24:54 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30D4VvEt011764;
        Thu, 12 Jan 2023 21:24:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=3CMXF08K1PVEf/eBWq7k014zMkck47thTE6u5appuyQ=;
 b=WquwRJi3HWGo0r5w2DtGd/us+M00hysudkPNBZmhTYUf1ItizPJ5Y6zD2DneCEAsUfxl
 ONnlhI+ev9iHH6XDI31O54zRJQ9qSzlwbXPQXCLD8J7C0EzoDA+LvLXhliPH/dvhl8d2
 aNju3XooQTttGQlfC0gLD2bKbXdtha5Dh4Shbf/uDAXUssX2XMrWl+eclEetgjHlWZrj
 KxOPYWlxsFzhe5rq2vth1J2avHHBSna5I2yFCD8N1FOW0/i4kMPufdHzuRMqJ91OV4mu
 EZZLKbRufAy83iqyih3VGpl3/Q1g0rlwERT2M8yXQJD+cN3+VW49noRWNYLjRFlq8yQC +g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n1k4e27ur-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Jan 2023 21:24:45 -0800
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0A03AC00F3;
        Fri, 13 Jan 2023 05:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1673587485; bh=3CMXF08K1PVEf/eBWq7k014zMkck47thTE6u5appuyQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RnO2nW4MK87+5vnP9ob7hgqCIhWXZx/KmtsbALZDdKn46ib9fqklZXeS10DWTOkPT
         Ot6I2f/v9F68W+LZmEe2/UDltfkNmBqI0Bn/6wTsdn5JgnPlD4XLleMAZ7UIrxTC8T
         mdwZfdEm2oHMuMb43Rj79LU7XpJdyLahgY2G0rzok70BUqXbOtSG/jSbhibpGtG3BI
         QTWBG3bWCXv11aUqhcCCzEv7HItzSq/z2IcMsoJU+3fCrU/BPjSdVphKKJ6Q6G7nIT
         7jzljI6MkoYV4u8TuspZRmEqzAvksK0bQWDU149lQ0MOzUXjdix4GyQoWmEEWNJ63w
         9snytY/H+AInw==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4EBB3A0081;
        Fri, 13 Jan 2023 05:24:43 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1E2B7A0385;
        Fri, 13 Jan 2023 05:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXAz9+Qr6MTQtRCauvf90ohpkP8wj8vYn9adW3vmprMVnw1BSl+dru9wMH6DQy/qFpxjWNGuoRu7inOjV3UG8Nk88N2hB7vQwZtAVPASj+pRHRjiMoIeq9TbGvQsCRbmRjiH7mXer2+L1YCNstEhqDalSrHyT370kmrRJz+3piLC6Cj1pV0XbvtHzkJSzOMUI3pVCa81HTg/2XQxE25VBVFuHhQwjyCa8Ez8rzHkpXelZENUs1lA+c8h1QPxjz+yyqPSNbS5NKZXnnus04+sDj1OFQ0jxA/Xd0aeZpau34UgjQIoihYL3kbsVy+IRH16lMMjdJLPsfmhZ5KbLE0eEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CMXF08K1PVEf/eBWq7k014zMkck47thTE6u5appuyQ=;
 b=AB7FmK6EUDe9aPA59EfceecCPDnvjmuUilxuWri+RAt8NIQnG0zoA6kCLT00SvlVAJlVT3guUcsjVztlsFw79oSU6lBrCoiyGiGrqwMj1hRdv8aFCZ8U0nLggbD1BCXXjBBW9Nja9EKrM3HaZac+uOPbz0fD48LeKqHWRMFGgxctrGPZIxQMaPwq96NWnk797OCZE5e+w0EasSBShSgYJLRDL9N3c/DWwDBf1MS8doxIuCYiFCFlIbeJI38LZ7DcUoOzHo/apzlusT2qHYA3j3QigPDNs0MZLAaCaLLSMItyIRrwfo9ed02e2jOMIjSWpLp+dWIwqwwfWOixxVWWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CMXF08K1PVEf/eBWq7k014zMkck47thTE6u5appuyQ=;
 b=HsikjW37kBI6bV6f8+gSSALcMV7FziH1HtFK9DySlgXkG5kmS/5+x+tBm6OtYyp9ErzxihjH7D11IfENKJdSsdQX1MOiud2ETsnhddJN9Iaz7cQEux3lgU1mS9i9zYYMYFHbHYw5Ag/SXJfR5EWHv1+/rkaYEwY5j+EH3olDbmo=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH7PR12MB5807.namprd12.prod.outlook.com (2603:10b6:510:1d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 05:24:39 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 05:24:39 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Topic: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Index: AQHZIbBPDcqFUUga/0S7en4fefnHfa6Vct4AgAACR4CAA2I5gIABN2uAgAGE/ICAABi+AIAAC3OAgAAB+wCAACFWgA==
Date:   Fri, 13 Jan 2023 05:24:38 +0000
Message-ID: <20230113052437.faywn7ev4bop4q5i@synopsys.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-2-git-send-email-quic_linyyuan@quicinc.com>
 <PA4PR04MB9640E527BFC0CDA519DD3BF989FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <e8ab0a98-c53b-5db0-d9c2-04258eabd945@quicinc.com>
 <PA4PR04MB964044E1882A24A5EC122B6D89FC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <3706dc91-9126-bef2-4926-ee184002e889@quicinc.com>
 <20230113010841.ougwmotzlm56nciz@synopsys.com>
 <68d3e800-afe6-9e27-e4e4-3670696abd9a@quicinc.com>
 <20230113031813.zozc3v4m2m3jybrb@synopsys.com>
 <f11c96ce-1ae5-8f59-6d1a-3b35cf45f301@quicinc.com>
In-Reply-To: <f11c96ce-1ae5-8f59-6d1a-3b35cf45f301@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH7PR12MB5807:EE_
x-ms-office365-filtering-correlation-id: 8efab55f-bbb4-4691-f313-08daf5267790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PvIxE7gfrCuzFvAExan+wkk3rpMn4vJ3ENnUb0uoCcDiArI87Bn3C7du2JLdUp3XnOxG7gFSZ5v6Eso4TUX3zg1LGK2mgUc/OMFdizWif+hJ856MMISlWhUZYYVZongmWPot4gbN5/MHBT7b46h6wyrm7RjEdG9YinBZNnyx1UvxU1azYjJH7RbK0d8EHjhe0Kf4Uh+moOQP9rrBRpYFB0yisYuvbUKIT7+Z9xLXimPYeg+Dm4NkEQPLDz61URGY2HbujVAbOiRayfDWn+3/IYZYBKj7VB32UYkh7tmeDDa2jtAmD0UZaNST2Ank27yXAYqVAPDb2xkNfR6xHN5Sd3GntsWK6crywW8hvnWtf/dnZh6emmUZ2m/xhEpgCjPtvkm1eS85rhmnEgtOHZmDEpm7szmaxKuu0Zzy+qL279S2KMAmmSwH4iNYVE5hQAnKZsgkKD4jtFgjBkMjJNX4FKRlh/IcjSRH9R9XHbGPrXBg11qM5L0cp6a6aaaodGeBGpWAdKcVUmB07R4rZ0/90G+D/2QUdLXd2fK2k46zSPBtzkUgx9mKi5Jh8fjME/Kr5KXuei8F9oDG4PhUo/mFtDOZXbC9KT7qjhmH00QRKwYp5fAzC4ZPQYonRFgeMVDeWRwtb310yURh3en6xSy6ibte4ZP8j0U3wXvItanQqx/v9F6loKDSnSTdA5ZWWTWlysiukcTSoGVbk3IJ+AxAyn3+iMm0HcZghcYEmKQgnYk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199015)(478600001)(53546011)(2906002)(6506007)(71200400001)(26005)(966005)(6512007)(6486002)(4326008)(64756008)(66476007)(41300700001)(36756003)(186003)(316002)(66946007)(66556008)(76116006)(6916009)(8676002)(66446008)(54906003)(2616005)(1076003)(83380400001)(38100700002)(122000001)(5660300002)(8936002)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEVpUDNsbEwzNFNTbjZPeGo3emI4T0ZBRlpJdlpaYkxYdXVISTZQS0xrRWxh?=
 =?utf-8?B?Z3N5VGx0cmk1Qi96OTk2TG5yVzJBS2NaMmx2V1hEQzdiOGQ2Z2gxOGlxZ3FT?=
 =?utf-8?B?S0hTSEhrMmp4WkFCa0hkbEQwekVEYU16UC9CTW5XWnZTUFVlckJydVZpN0NI?=
 =?utf-8?B?WUU4K0NOSkFrTG5tSk9QVU5zRzBsZUllVHU3YkJBbmFvaU1lZ2Y2a1N6ZmNK?=
 =?utf-8?B?b010bE5oZjNnMC9rd3ZuN0RWcmhFbmVaaDJOYVk1UmszSzFGSHFLK1BWczN6?=
 =?utf-8?B?eUV0U2x2Y3psUGNoL0VnczJBQnVySFhtZEdjR3o4SWRRUEJoUVA5Z2Jpc2Vv?=
 =?utf-8?B?UDlLWTkyRHFTYnpIZ1QzM0lvSG1XdFZKN1ZlV1grbHIvWVNJdWUwd3pRQ3Z3?=
 =?utf-8?B?NTBZZVRlWEh2bzVlRWVtQ3M3R2pKay8zVng4MTV0N3RONWNBY0pvYm5NcnBR?=
 =?utf-8?B?N1B0Z1FxYnByZjd5eFZZSzhBWmdibHBSd0pNYzJWZkk4dytRRTNkT3Nmd2s3?=
 =?utf-8?B?Wjkxb3BQdldtT1JTTlhxdmUvZEtFTEp1Wkp1RDJIMHVidmwzclQ5WFFRZmx0?=
 =?utf-8?B?WEh1M1YrdHNJSHFzUVk5UGl5N3g4TzBTRXVNVDFaMEZTZStBemxUQjlTVUJS?=
 =?utf-8?B?MUNMWHlFN1dPbndMcGYxZFVQQTBpcXd1VDNGaWpHY3ZMUkxQTnh1YVg1ZXE1?=
 =?utf-8?B?SDJDV0FqeERrL2d3cklXSGd6ditvNG5RZkhUM3EzZ01GUFNBcXNzOEJQck1u?=
 =?utf-8?B?cStlSEc4bFVmdkRwVWw2OEJNL2FtU1B0eTJjSWZ1cUo0dlVreU5YZ2d0a3NW?=
 =?utf-8?B?NnRpWlZ3dUVjeW92bGlUMW16K0FTTVhLaysrNHNlZlNIZW02YkxMcm84c0V4?=
 =?utf-8?B?N09sRmU4THBuc0dLeGU1UmZ6dUZLSDN2NmxSeEhpUERQWFduNktCLzNnb2JI?=
 =?utf-8?B?OHFIMUQrRVcwS01ZampJd2RwbGl3WDRodzlGVzRPeENWWDBWMnBmaHY2MUZo?=
 =?utf-8?B?ZGhSemYvR1pGYkp6YW1xbnJDSFJjZThVQUdKS2ZxYTEwd1NqYkJiVWtEMzAx?=
 =?utf-8?B?cUJWdlhXVVBZZmpPcW1vYnZjd05IOUVxSUxtMG9zRkF6NGNrTWRxdm5yY3p3?=
 =?utf-8?B?MDFzeUx2UEVaZUJPR0pBM215MkdWRmxOWStUV3Q5WURBdEtEY0NrektiWVQw?=
 =?utf-8?B?eVpUeTcvd0RyUGJLa200NG9ab0VMMFFhWHBwT2kxMjVkTVZlT3prL1RRRVlt?=
 =?utf-8?B?TEVOMHFtWUNNbUErd3Y5cHBPblVkakNGTElTUG12d1B2Zkw4SjM5VzE5QWJO?=
 =?utf-8?B?ZUoxTStCamJnTnJqbU4rdjN1NHlkcUxWOVU4cjh4Z1hoZUlmQ09oODVtZG92?=
 =?utf-8?B?NW5sdXdYSlcycU9KNGtjUk8wTnh0Z0EzajRJd3kyR09temFUNS9lYmNOUGxo?=
 =?utf-8?B?UkNSbWUzcnhObkRDK3ZXb29CVzg4b0p0eURnRXc5Um5jL1l1V0JVbmFGSndr?=
 =?utf-8?B?YUIwVjRsSnJ2b1o0aXMwTFJxTDJpb0tBMVROSGdzdDhMbTk3K3BiTUtPbjNa?=
 =?utf-8?B?RGVVNzJYU3FSTUVzWGs5VXpOZWZ6QTdBL0lHSWZKbVNtUXhDSGN0QzZzc1Rh?=
 =?utf-8?B?Y0lHZk9JYUJtUmFLUCtObjhFSnJPc0lMOSt2RkRNT2ZRSTlpcGpBMnVINWJR?=
 =?utf-8?B?bnZnbkkxRlhqRXJyeVdHaVR0NzEwcEVEcTFNemFadHhvTFJVQlEwSGQyS0pE?=
 =?utf-8?B?QUxpM1RkczVPUW56NzYrSld2MjVkRk1XeW9yaGlmREdmcUxUalNob3BQRjQ4?=
 =?utf-8?B?dVJweDFJV3o3NVI5bWVWWTNld0RUZ1RBVGRsNVM2MjBlWENIL3VLcnIwalZQ?=
 =?utf-8?B?TysxdUQxV3NVYUdrZ1dvemE4STdlL3pscDVwU3RiODQ0VEIvSThTaWRSQW96?=
 =?utf-8?B?MThaTWxERXVkUjAzNjdLaWZ0TEp3WC9laThoSDlhU1Z6N2VyZmJXbDc5YTVZ?=
 =?utf-8?B?SGJKcmRHMnp4L3l3VUhsZmZCbFgvc3JyQ2lLcXUxMXlHdm40SjVsamV2VXYr?=
 =?utf-8?B?ZnlrOU91WDhWbU5ZMzhZOEdacFVSK1pRbXJmZmpMVEVUYVZyM0oxaVhlQS8w?=
 =?utf-8?B?ZmJMRm1DY1p3Ui9lT3g2UEczZlNSTzE5M2dRK1phM2UvWG93SlF0TWpYUFFn?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68DB087AABE92246A08120A2121CBC0A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4aQmM9A1b4MF6MS5/tEIwTp5Xs1uTNVe9BYZNZc3RjvKs4zLrEW/EnxDjg/VneYvOHfS9+x/Zh/vKcF2TbtQcnuvGEL+YHcvfESAXDeqKttA4F8r143Fqt3SqwGPhkGAYAHC9s7O1TqyF13Lmevo7cFTifQn+UdHya63GPtV39FCESwrLU/EYxFAfliVAxdHinRNdOKkSQL9Q3wkbjacH/OqrcI9ozkUNwsi8edNrd/xjuyT8SbpOHa9LNBpwXAUoHvDVAlHV9om74D+JAaWXtaCLeeqZTsqlo59YSbYaui7RcvCX6MRqHlMwZd5fR9qj1kZgJ80n57QR6RhzrcfURv1k5KKhZjICmXLpYl8H3vra3dBVTmLdJp1uG5qeSmjgZ+g/e0OYx8jGhZIUT2MO0nk3c/AcqecWaICNk7E5yPZ28qfHSkrOUID8qMxhJ2zHmPBQtgbpq96HNoG1McfxfIykHf9gNVN2CIAsFgGt3uSW+mfBV9XADylTUAtlfiu5VB1qx6CgIDfkiNSAatOdgpTPAPt4Q6R4es5vY4gre0WUzxRTeq+VLLCo8LlHfcJExLba6Rm4wkMBt4tyKKmHWAZie8Xa6lFmEto3VcfQvXO+y6brC5CNIUtDYEIDHSVD+y4Sx88e46Kcm9DhwF+VFpJJLnE2V+v4L7mUT/uPRfw0LNUmUavwAxdqDe/icQLOqUMT+Uyv8f+D1m0jJKpvBuSEz2cMNBOPEfmf0OvuDP4spQFUHoadilB6yh8ifbQvSD0I2U/2dkQ3qHYS2Wtg9a4cDwfOqQsvrMEkFPdQExH7MEeeFHxorB7nLd6hedqGE8qI6bZOMNtLuiWKz9N2eYeI2GNJ16Din3/ww+KUkiwOfDfEO4/izjXUKOzjLuzbH7J3VoVvb5rkrYTPKYghY/WoKuEE7lptlpBFIA24yU=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8efab55f-bbb4-4691-f313-08daf5267790
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 05:24:38.9740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z2PzE1DLduso9l8/GoPHy8cesziZVKlVgHOfhXthTpy1ddjno0lx2Rz03bgDLrvxLjFjlYkcWcalQ6nahdXiUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5807
X-Proofpoint-GUID: ED_Gz44OSMs3aDIx0T9MSpQfTE0Q9Hbt
X-Proofpoint-ORIG-GUID: ED_Gz44OSMs3aDIx0T9MSpQfTE0Q9Hbt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_14,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=840 priorityscore=1501 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301130035
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBKYW4gMTMsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IA0KPiBPbiAxLzEzLzIw
MjMgMTE6MTggQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBGcmksIEphbiAxMywgMjAy
MywgTGlueXUgWXVhbiB3cm90ZToNCj4gPiA+IE9uIDEvMTMvMjAyMyA5OjA4IEFNLCBUaGluaCBO
Z3V5ZW4gd3JvdGU6DQo+ID4gPiA+IEhpLA0KPiA+ID4gPiANCj4gPiA+ID4gT24gVGh1LCBKYW4g
MTIsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+ID4gPiA+ID4gT24gMS8xMS8yMDIzIDM6MjEg
UE0sIEp1biBMaSAoT1NTKSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiA+ID4gPiA+ID4gRnJvbTogTGlueXUgWXVhbiA8cXVpY19saW55eXVhbkBx
dWljaW5jLmNvbT4NCj4gPiA+ID4gPiA+ID4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDksIDIwMjMg
MTE6NDIgQU0NCj4gPiA+ID4gPiA+ID4gVG86IEp1biBMaSAoT1NTKSA8anVuLmxpQG9zcy5ueHAu
Y29tPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+ID4gPiA+ID4gPiA+IDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz47IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4g
PiA+ID4gPiA+ID4gQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IEphY2sgUGhhbSA8cXVp
Y19qYWNrcEBxdWljaW5jLmNvbT47IFdlc2xleQ0KPiA+ID4gPiA+ID4gPiBDaGVuZyA8cXVpY193
Y2hlbmdAcXVpY2luYy5jb20+DQo+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8z
XSB1c2I6IGR3YzM6IGFkZCBkd2MzX3JlYWRsX25vdHJhY2UoKSBmdW5jdGlvbg0KPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IE9uIDEvOS8yMDIzIDExOjMzIEFN
LCBKdW4gTGkgKE9TUykgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gPiA+ID4gPiA+ID4gRnJvbTogTGlueXUgWXVhbiA8cXVpY19saW55
eXVhbkBxdWljaW5jLmNvbT4NCj4gPiA+ID4gPiA+ID4gPiA+IFNlbnQ6IEZyaWRheSwgSmFudWFy
eSA2LCAyMDIzIDU6MjIgUE0NCj4gPiA+ID4gPiA+ID4gPiA+IFRvOiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgVGhpbmggTmd1eWVuDQo+ID4gPiA+ID4g
PiA+ID4gPiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gPiA+ID4gPiA+ID4gPiA+IENj
OiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBKYWNrIFBoYW0gPHF1aWNfamFja3BAcXVpY2lu
Yy5jb20+Ow0KPiA+ID4gPiA+ID4gPiA+ID4gV2VzbGV5IENoZW5nIDxxdWljX3djaGVuZ0BxdWlj
aW5jLmNvbT47IExpbnl1IFl1YW4NCj4gPiA+ID4gPiA+ID4gPiA+IDxxdWljX2xpbnl5dWFuQHF1
aWNpbmMuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4gU3ViamVjdDogW1BBVENIIDIvM10gdXNiOiBk
d2MzOiBhZGQgZHdjM19yZWFkbF9ub3RyYWNlKCkgZnVuY3Rpb24NCj4gPiA+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gPiA+ID4gVGhlcmUgYXJlIG11bHRpcGxlIHBsYWNlcyB3aGljaCB3aWxs
IHJldHJ5IHVwIHRvIDEwMDAwIHRpbWVzIHRvIHJlYWQNCj4gPiA+ID4gPiA+ID4gPiA+IGEgcmVn
aXN0ZXIsDQo+ID4gPiA+ID4gPiA+ID4gSXQncyAidXAgdG8iLCBJIHRoaW5rIGF0IG5vcm1hbCBj
YXNlLCBpdCdzIGEgc21hbGwgbnVtYmVyLCBpZiBhIGxhcmdlDQo+ID4gPiA+ID4gPiA+ID4gSXRl
cmF0aW9uIG51bWJlciBpcyBvYnNlcnZlZCwgcHJvYmFibHkgdGhlcmUgaXMgc29tZXRoaW5nIHdy
b25nIHNob3VsZA0KPiA+ID4gPiA+ID4gPiA+IGJlIGNoZWNrZWQ/DQo+ID4gPiA+ID4gPiA+IGRv
IHlvdSBtZWFuIHRoZSBvcmlnaW5hbCBsb29wIGNvdW50IGNhbiBiZSByZWR1Y2VkID8NCj4gPiA+
ID4gPiA+IE5vLiBJIG1lYW4gdGhlIG1heCBsb29wIG51bWJlciBpcyBub3QgYSBwcm9ibGVtIGF0
IGdvb2QgSFcuDQo+ID4gPiA+ID4gPiBXaGF0J3MgdGhlIGFjdHVhbCBsb29wIG51bWJlciBvbiB5
b3UgSFc/DQo+ID4gPiA+ID4gaSBkaWRuJ3QgY2hlY2sgaXQuIGhvdyBhYm91dCB5b3UgPyBubyBt
YXR0ZXIgd2hhdCBpcyBnb29kIEhXIG9yIGJhZCBIVywNCj4gPiA+ID4gPiBjdXJyZW50IGNvZGUg
ZGVmaW5lIGEgYmlnIG51bWJlci4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBh
Y3R1YWxseSBpIHRoaW5rIHdlIHNob3VsZCBub3QgZGlzY3VzcyBpcyBpdCBhIGdvb2QgbnVtYmVy
IG9yIG5vdC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiB3aGF0IGlzIHB1cnBvc2UgdG8gdXNlIHN0
YXR1cyByZWdpc3RlciByZWNvcmQgPyBkbyBpdCBnaXZlIHlvdSBhbnkNCj4gPiA+ID4gPiBpbmZv
cm1hdGlvbiB0byB1bmRlcnN0YW5kIHRoZSBJUCBiZWhhdmlvciA/DQo+ID4gPiA+ID4gDQo+ID4g
PiA+IFdoaWxlIHNvbWUgcG9sbGluZyBudW1iZXJzIHNlZW0gbGFyZ2UsIHdlIHNob3VsZCBub3Qg
cmVtb3ZlIHRoZSB0cmFjaW5nDQo+ID4gPiA+IGV2ZW50cyBkdXJpbmcgcG9sbGluZy4gVGhlcmUg
YXJlIHVzZWZ1bCBpbmZvIGluIHRoZSBzdGF0dXMgcmVnaXN0ZXIgd2hlbg0KPiA+ID4gPiB0aGVy
ZSdzIGEgdGltZW91dC4gQWxzbywgdGhlIG51bWJlciBvZiBwb2xscyBuZWVkZWQgZm9yIGNlcnRh
aW4gc3RhdGUNCj4gPiA+ID4gY2hhbmdlIGlzIHVzZWZ1bCBkYXRhIHBvaW50IGZvciBkZWJ1Zy4N
Cj4gPiA+ID4gDQo+ID4gPiA+IFdoYXQgd2UgbWF5IHdhbnQgdG8gdXBkYXRlIGlzIG5vdCBkZXBl
bmQgb24gdGhlIHJlZ2lzdGVyIHJlYWQgZGVsYXkgZm9yDQo+ID4gPiA+IHRoZSBwb2xsaW5nIGR1
cmF0aW9uLiBEaWZmZXJlbnQgc2V0dXAgd2lsbCBoYXZlIGRpZmZlcmVudCBkZWxheS4NCj4gPiA+
ID4gDQo+ID4gPiA+IElmIHdlIHdhbnQgdG8gZGlzYWJsZSBpdCBmb3IgZGVidWdnaW5nIHB1cnBv
c2UsIG1ha2Ugc3VyZSB0byBoYXZlIHRoZQ0KPiA+ID4gPiBkZWZhdWx0IG9wdGlvbiBhcyBlbmFi
bGVkLg0KPiA+ID4gDQo+ID4gPiBpZiBzbywgZG8geW91IGFjY2VwdCBkZWZpbmUgYSBuZXcgZnVu
Y3Rpb24gYW5kIG5ldyB0cmFjZSBldmVudCBsaWtlLA0KPiA+ID4gDQo+ID4gPiBzdGF0aWMgaW5s
aW5lIHUzMiBkd2MzX3JlYWRsX3RpbWVvdXQodm9pZCBfX2lvbWVtICpiYXNlLCB1MzIgb2Zmc2V0
KQ0KPiA+ID4gDQo+ID4gPiBERUZJTkVfRVZFTlQoZHdjM19sb2dfaW8sIGR3YzNfcmVhZGxfdGlt
ZW91dCwNCj4gPiA+ICDCoMKgIMKgVFBfUFJPVE8odm9pZCBfX2lvbWVtICpiYXNlLCB1MzIgb2Zm
c2V0LCB1MzIgdmFsdWUpLA0KPiA+ID4gIMKgwqAgwqBUUF9BUkdTKGJhc2UsIG9mZnNldCwgdmFs
dWUpDQo+ID4gPiApOw0KPiA+ID4gDQo+ID4gPiBsZXQgdXNlciBlbmFibGUgaXQgYWNjb3JkaW5n
bHkuDQo+ID4gPiANCj4gPiBXZSBjYW4ganVzdCByZWRlZmluZSB0aGUgZXZlbnQgd2l0aCBhbiBh
ZGRpdGlvbmFsIHBhcmFtZXRlciBmb3IgZXZlbnQNCj4gPiBmaWx0ZXJpbmcgb3B0aW9uLg0KPiAN
Cj4gDQo+IGFjdHVhbGx5IGZpbHRlcmluZyBvcHRpb24gb25seSB3b3JrIGF0IGV2ZW50IG91dHB1
dCB0aW1lLMKgIGl0IHdpbGwgc2hvdyBkYXRhDQo+IG1hdGNoIGZpbHRlciwgaWdub3JlIGRhdGEg
d2hpY2ggbm90IG1hdGNoLg0KPiANCj4gdGhlcmUgaXMgc3RpbGwgbm8gZmlsdGVyIHdoaWNoIHJ1
biBiZWZvcmUgZXZlbnQgc2F2ZSBidWZmZXIsIGV2ZW50IHN0aWxsDQo+IHNhdmUgaW50byBidWZm
ZXIsDQo+IA0KPiBpZiByZWFkIGhhcHBlbiB0b28gbWFueSB0aW1lcywgaXQgd2lsbCBmbHVzaCB1
c2VmdWwgZXZlbnQgbGlrZSB3cml0ZQ0KPiByZWdpc3RlciBvcGVyYXRpb24uDQo+IA0KDQpPay4g
V2hhdCBkbyB5b3UgdGhpbmsgb2YgYWxzbyByZXZpdmluZyBKdW4ncyBjaGFuZ2UgdG8gdXNpbmcN
CnJlYWRsX3BvbGxfdGltZW91dF9hdG9taWM/IEl0IG1ha2VzIHNlbnNlIHRvIGNyZWF0ZSBhIG5l
dyB0cmFjZSBldmVudA0KaW4gYWRkaXRpb24gdG8gdGhhdDoNCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXVzYi84N2JsbXltd2x6LmZzZkBrZXJuZWwub3JnL1QvI3QNCg0KVGhhbmtzLA0K
VGhpbmgNCg0KDQo+IA0KPiA+IA0KPiA+IE1ha2Ugc3VyZSBub3QgdG8gY2hhbmdlIGR3YzNfcmVh
ZGwoKSBkZWNsYXJhdGlvbiBzbyB0aGF0IHRoZSBwYXRjaA0KPiA+IGRvZXNuJ3QgdG91Y2ggZXZl
cnkgcGFydCBvZiB0aGUgZHJpdmVyLg0KPiA+IA0KPiA+IEJSLA0KPiA+IFRoaW5oDQo+ID4gDQo+
ID4gPiA+IEFzIGZvciB0aGUgaW5jb25zaXN0ZW50L2xhcmdlIHBvbGxpbmcgY291bnQsIHdlIGNh
biByZXZpZXcgYW5kIHJldmlzaXQNCj4gPiA+ID4gdGhlIGNoYW5nZSBMaSBKdW4gZGlkIGEgd2hp
bGUgYWdvIHRvIHVzZSByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljDQo+ID4gPiA+IGluc3RlYWQ6
DQo+ID4gPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC11c2IvODdibG15bXdsei5mc2ZAa2VybmVsLm9yZy9ULyp0X187SXchIUE0RjJS
OUdfcGchZVpCY1c3OHpMTWtPdGZQSWh4TnZJR2pJdHZfVzJJVnZwTHlPVi0zZUNyV1JrN1QxUFZF
UlNtejAzN0hMeDFuTE9IZ09zUlRLMUN6OERIRmVCWFoyMVd3WTVPa0psdyQNCj4gPiA+ID4gDQo+
ID4gPiA+IFRoYW5rcywNCj4gPiA+ID4gVGhpbmg=
