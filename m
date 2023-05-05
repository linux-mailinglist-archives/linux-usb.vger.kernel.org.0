Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1926D6F8CF1
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 01:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbjEEX6o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 19:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbjEEX6m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 19:58:42 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE7365B0
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 16:58:40 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345NJOGk003939;
        Fri, 5 May 2023 16:58:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=0rIBM2ogT28ixx64R/1fjuVVKbj7ZFCQuNCsOa2OXTA=;
 b=VlKCaBNo4cyoCv6vbwmomqBCd6pMZ7J474P+tGtn1oh9BZqHCkR9S5JUAatSN2OR5kPK
 DDNUxeZktDJQlm/SgVdibCkCPDMVM6HWYIsbCox8qOdcQDaJQy77tSN+oIYj4zjKReMh
 8wQ6ddfjMYM5HDMHqFQzjXGYiy7I4X6yMKXtMuOXwgae/G97KZBf7oHEaeQXUnasYwOF
 4MwzJJq35G7HJVfZA7FRYXiaGcZsAuHNwzGdUS1J1eZthRCTIyLeQEg07uo154B63HaI
 DnDAQZjqY8AOWwasanfK+DGj0JSDI+47eXu7b6JACIC9nxBBYwLvuU7El3N0eGBelQb9 OA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3q91vjs2du-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 16:58:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683331113; bh=0rIBM2ogT28ixx64R/1fjuVVKbj7ZFCQuNCsOa2OXTA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gxGRW93YrCSi2feub3/mRUl1F3IcRr9NOCYOpgVDSq0hir6B+AyVD2EEA4FILa3uC
         B+23VuJU/I8YIizzm1WIC6k527kXeLmk97s3VKAhIxFnGJPc/UDxXMaRW80mXXl+Ko
         6q6+3oj5mNnjqYOrAGsUmwEMoMRo3OirwA/83QHMgd9tmFfrqehf/nIzoD5HAaYciV
         jB6NwUwIx9wxlnEKzu3EU6egYT6Mhodr1vAcRDRRlA/ZnnHaTna7WjF3qVpJspjMvW
         ROo5xEpUmdSMbvQ9dND9mTmdCXzvNgTSlS/7rC+dQOIo+ADUK6YCMNxrY1SB5rAHB+
         8ClW/rSLs0g5Q==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3003C406B7;
        Fri,  5 May 2023 23:58:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 663C0A005A;
        Fri,  5 May 2023 23:58:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=se2Bs53r;
        dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 501D840682;
        Fri,  5 May 2023 23:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOLb6oNhcTuuLpa0SoZ9YGUtfM43rWw+7bkEE46FfFa6+qa/jm6/htYqvsMwMkxs+J1ZMj32CRRotMiQM0xrNjg1f2KXm/64y9vqoHsrJhFMYxy4RBt+MaJij6YZzbjZujM1MtOcaaANXQ67vikrvJfLedrjAE6qUW2yXu33tcj+EioFAoCPppwH0voH3J1AdmU2ijfSsWPMtwueqi1JEE8DmgpGsxETnMYQDxEbKdBpN2mpBhK5fckxEmhOZB1nsAUrgjb55Tu0ofKH27jxNQ4IVNG4wJFY8YmA9+gSdCe3RlhzMCfw9xaoFyHZvfeMBDggGB2RJOcwuvKuI8rwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rIBM2ogT28ixx64R/1fjuVVKbj7ZFCQuNCsOa2OXTA=;
 b=oM0GJsET+rWxa03dLadqoQ8ipAR4/tUmuQ6exJbWVyXGnVnYnFMehaXnvKYAzbpG34BSsfBHEyUYToE/AYEobYrCy3/o8HpyRpA2jc8h2M9Vo8BLYyFLO/ZgQvoo0nzDeEX7GIQY05adPxDvnPChClTf2A5Xqaux1eC+YZnM0xOC5ighNBAdmsXYCzzBkuJJtzIJhqizdHPbeD95lg/TIIo1qS0sR2DBtdqfdJ7qXJe3GXuAFKNSD6zU0NPaKB/2J0YQXHduWoc3YWaPm4iyUIP7JUVbPzqcDMBzD1w9R1ZS8Mi1XuEvHlg7m0wcIXMMXudMZ42WR2ivP3gNGgLb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rIBM2ogT28ixx64R/1fjuVVKbj7ZFCQuNCsOa2OXTA=;
 b=se2Bs53rnVVEGFTBxbZqor/3x4jJP8zw40+GJ6xUP8jBNMhLO4HomMt4odHIuKdysm5i97w6rc1ms0ZLc6EnFUoiKui5VOGHH8+zJFCyy7ETXPbG9aBSyadj8r47VZZR8M/8uzaT4476jojrt9nETqP4V3YCfUPQRVThZqluXbo=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 23:58:27 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 23:58:27 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAAlnSgIAX7D2AgAAAdgCAABV7gA==
Date:   Fri, 5 May 2023 23:58:26 +0000
Message-ID: <20230505235813.ecm6j2x7amkmcbes@synopsys.com>
References: <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <62d7321f-6046-c75a-7610-97bebab2965c@google.com>
In-Reply-To: <62d7321f-6046-c75a-7610-97bebab2965c@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA1PR12MB8190:EE_
x-ms-office365-filtering-correlation-id: 5ce07be8-2b33-4b7f-bc03-08db4dc49e48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lDox3xGRU78ir6GlnPshQXHM29t/3twZ+cZwamZsqJI328uzTH5CZPJ6N44EbYKmJpQEvQSlTcjeZwMs8GKVydovFsRqFWv8IC+Bz4bSX3YQJ0/xpXXvdjMNbnXc7f+Ood76B6RJxcGZ3C6CN0tBA6XdvvvrjpwKdH0JwRLzxSTmxjXAWNYpnkffmpn/UaAfTAE/NNCGDHN6SJlOXxsCkf+zgd64ulV4SO0e9uUV3vbcmGvf6HRAHchNJ57Df0v5HjirLhdH2i+C51n2gJqlGjf7IWXdtJFfIT9THHpT2WwZai6hn1LodRbHGQ7ikifcty4wDWQecIn23ziW0/s6aIJOp4wCn1OzHLffPh3Q5sC701VhIiSicBCR1+ms0ljCzuyaBRitTQAl9sg5jvD0c9YW4XCfyZFH3qFFDnal/JcB5yQs/2UxNeQdyXPXP57LWeufL/x+AZMapFvtgVHAlGVE2w2e2MsBHCTDUAySdi6+bVgXRpZflnaRuVpMbhIUfGEhJ/HPRjz74gBfe2khQkZJYsVDycFFidUAY6eDPq4LYfskhXcYBe3xY5y36NthtGO6qt3Yjc5/q95As91Hm341wJCmlJW4sj8de+avHwrDKYoc/7GaqyE8ofD7/mUl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(1076003)(6506007)(26005)(6512007)(53546011)(38070700005)(186003)(66946007)(8936002)(2616005)(8676002)(2906002)(316002)(41300700001)(83380400001)(36756003)(71200400001)(76116006)(38100700002)(4326008)(66446008)(6916009)(478600001)(66556008)(66476007)(86362001)(5660300002)(6486002)(122000001)(64756008)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0lYeUtCRTBGV0RGSGdUSm5kWDdXWGtCSGV6aVIzUnFqZVl0RWxUblVBNEJ2?=
 =?utf-8?B?MHI0dVpweHV4RzBFMDJKOCtwWnJVSDJOZHBVeGMvQlZncnVwUFM4dC95RTND?=
 =?utf-8?B?ZjBLa3ZwWHQzcHZQV1hyZUxscC9HL2N4RWlyVjV6SXZOVmdpNjViNkd1cFhr?=
 =?utf-8?B?ekVkOERpVmc3NDBKaXZRT3RvcGhpRlN4NXNSSytSYWNhQkJoaDZGc0RSaDd2?=
 =?utf-8?B?LytGZE53OGp6S1VwdWt0bHpDUUVaV0tmQTZzV1kxempQVjFPSFdabEdqZ014?=
 =?utf-8?B?SW5zNWk3ZUk5YmpzRkczZEpTWUx1Qi93U1FwUlU1Nko4TUMvYnFUNjlUblk5?=
 =?utf-8?B?dnM1WkRyTUF0RkcvZVFMWHYxczdHMXg4clNXa2dEU2k0ay8vRXQxbStJQ0tG?=
 =?utf-8?B?bCs2ZVJLN0tXQmJNY2R4ZTQ3Y01aN1VXek5rVWpRTDF1N1NvNVE5YkE2WTJw?=
 =?utf-8?B?M04wQzdpaWcvTjZObDU0aXlDRk5jNzMrZmYxbFVoY1BDRE1GY005OU9IUlkv?=
 =?utf-8?B?d1FJMDlOdnN4RVlRaEx5L3A0Rk1Gblk1anpocVFJUFI3Z0pZcEpiM09lOSs0?=
 =?utf-8?B?WVM0cHBHaTZYQ2RYZzFHb2RUZElTWHF3OGQxTWxtYlo4R3l6Y2NrT1M4NzFr?=
 =?utf-8?B?bmlNdHl5TXpUbDB2bmJxcllvQUxtWmVFQWgvOUxrQityK3pqbHNpVmhvZ29T?=
 =?utf-8?B?ZENiaHhQZkFWenV0REJreGJNSXNsRzBadEpPd1YzSzFSTnd3VlJsbjZldXBU?=
 =?utf-8?B?VXhGWTY4Z25GUk1ZLzk4UUoydFB0Z1U0OUdjQU9kWEVIekFlUVV6Zno3dGpt?=
 =?utf-8?B?ZVRXQ24yZHpoUmt4bmZNaG9TZnlnckpUOUNKT0dYZERsK2JzWHltVzhmajNI?=
 =?utf-8?B?OVJyUEcwNXpTWW9xbUtURkMxUWk3UlJTYTRHSkNYZ3dpR0h0ZzVvbEV1QkRN?=
 =?utf-8?B?Y0ovTm0vbms3MCtiZ0tVdDRyUjlQRzJkcVdDWkVMTExpZ282ZG9DdnhVaW05?=
 =?utf-8?B?ZzlKc1UxYllocGVnSkJXMElzQW5jdUdKZ3ZwajJuRTllaTRGWUk2QTV2RzA2?=
 =?utf-8?B?eTNFNjMxaHVqKytoOVB1Qk0rdlhsdWJHVmhDNmplcDY0ZWZKTmpuMWZWWFEw?=
 =?utf-8?B?UHZRYjRGa3ZuN3plR3AvVi9xMWN3bVk4bFJpK0NXcFJ6dXp5YjFHNkthSitS?=
 =?utf-8?B?d1Mvb1lFOWJsVmErdERCTzNVdmI2ejNiQmE5VVNzbG5TeXVNeFN1VGk2Q3hj?=
 =?utf-8?B?UTl1VU4zc1F2d0kwQnNHVC9jQUphbDlxeVVaKzVsWXdTZk5kRDhaMEFOaCtO?=
 =?utf-8?B?WXRRUWhjTUJ1S3FwUXI0SWxoODlwb2R4TXFpemhVRFlaYStheTVTVkZ1QkJC?=
 =?utf-8?B?T0QxcnVpaXJNOTBCSDdvcTRpbXBJOGR5UUVwMjB3TG54aW10ZnFOYitHVjNL?=
 =?utf-8?B?UFZ4N0p6aW90WFpGRk8vV0EwVjgxL2s4Y0cxRC9xM2tOYm1QSlIwZE96Z29D?=
 =?utf-8?B?MVlBYktiU2UxUWc2U0didmVjTTkvei9zdDYwWmM3b212emNWRDgyR25HRHNB?=
 =?utf-8?B?MVBCbUt0Mjg0QkkzNEdHd0tvYUJxcVNRdytiYUxQaGFrcWRBdVVDbkFnQ0Iv?=
 =?utf-8?B?RmJrdHlqQVM2V2RvRFhOZk1mUmR1bU0wTWxtNUpwKzhWbHhYREQ1YjZkWWt5?=
 =?utf-8?B?b3QvSXlLMXVyZElwVVJxSlRDQzFDRnpJMkpWQmJTWFdXNGlEb2lmZnRmOTFM?=
 =?utf-8?B?eGtpMVlSbCthcEplRXB6M005Y2s3Ny9zdTlmZG16aVV0T2JQYVdveFMxR2Nz?=
 =?utf-8?B?ZER0S2lWSVN5U0ZqaFFBTnhLem1oU1VIdllCMFUvWFdpNk1WRjIrdld1Mnhp?=
 =?utf-8?B?N3hNY2NMNGIreVdhNVdyY2cyYUh2UzhKQ2ROWVp3SDlsQTV1N0Vtckt3WTNk?=
 =?utf-8?B?bnlkT0hxcWJweEN5UkRIamhtRWtnZENrdGVWUEoybFJXMVhSM1k1SGtyeFE2?=
 =?utf-8?B?elI2SEVzVDQyWEd6TWl6eldZYW5JTytlcHludUF0dkFRT2tlZnVjQTM4cm5C?=
 =?utf-8?B?WENsclYxTmpaZU9lV3JmKzR4Vm5xUkp4S0I2UE1RM2h4WjJua3BDRVhwL3h6?=
 =?utf-8?Q?0ZCq3fGpCbpX2Y6Ci2u1razrp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E3E771F94AF1D4FB031CDF901E398DC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?MmZiMWxzMnprMzc4TmhxRVJQSjBWamtYaDhDbVhKNWhuSEExc2FycFdIQktG?=
 =?utf-8?B?eDl4WkRNSUxlUWk3eThwNmFqRk5xR003MTVkK0dBTEN1M2RDVmJJaDN2MHBP?=
 =?utf-8?B?ZHVqYm4zMkNab3QzWERRamZiS0dCY2VOZkM3NFFnaXM2Z1RDSTk2NFZkZmxi?=
 =?utf-8?B?eXUzaWYzZFp5eU82SmYzSDk3MmRRNnBsSlNuMHRQQWpiK25aU2FMQmJseG00?=
 =?utf-8?B?d25sSzFTaWxaTzh2R3BXM1dFTXlJMW9MeFhWREJhb2FhTTRNbkx0QkpUVUtv?=
 =?utf-8?B?Q0xmanlySUFWeEdaNy9wQ01GSHZmTDFydUh6dXFuV3gzT3NpblJ0dytrUlhR?=
 =?utf-8?B?cU1LN082a2d5azlrdlVjb1VPOTBrZzlDRzhjTkhjdDBQSzV1Z3dubHVtSXdY?=
 =?utf-8?B?Y3ZIbkp5SWp5SUs5UU5YdDEwdXZCM09sY2ZxM2lQTHVnT002QnV0aWNzWGw1?=
 =?utf-8?B?b2huOEFycFp1RXlYcVArZXpnUFAxZDYzWUdaZGlpRElFYXhwT3ErNHBCQ0ha?=
 =?utf-8?B?NGNYR3pBV21kZlNURC91Sk85Y3lqMS93Q29nQzZ2ZUJHRExJa0c4d1NQVzRr?=
 =?utf-8?B?NWl0NjdEUERMcU1MeWtBN1l4aXB3UUZLVWREV3dJRGQ5Z1RmdUd5WHl5RzFv?=
 =?utf-8?B?SlExYndWSU9adlFtTHB5Vk9BSGkzVVkwajFJakg4TmQzYlVzTUhRV2Q1RUFU?=
 =?utf-8?B?NU5laVJaRFZFd21WdzBMZkprTW0xKzczdC9FSG5CRjB1K0RVZ2VFWXdGNFR5?=
 =?utf-8?B?WE9KV2Nac1BvZzRMRkRiOVZncGhqcHJsTExWQmNjMUtiNVByT2ZiMFVGSlRZ?=
 =?utf-8?B?SWZ4d0tHTlp3U2l1bXlrUUZCVHB5L05Gc1UyVmZEQ3cxdG5hODlVQkFZcVlD?=
 =?utf-8?B?T3FMZEV4ZlRMVG51T2JvQXEvSDZqRlQ0ekkvOGZjVnAvOVFtMXhkbG9Id2Nh?=
 =?utf-8?B?aU5JaVF0bjRlOHR5cG1Fd3JtZ0xNVVFNallnbFNhQi8zRnVzVkFvSGJpY2lT?=
 =?utf-8?B?eWs0czFoWGhERmcxTkIrVXhBQWhmb2ZGd05PMFZkZllkbUhBU3ozR3BIVXJm?=
 =?utf-8?B?b09rOUhwekVOTzBPaDVrNmo3NXE5YVdmMDN0Qys5Q1picFhIbk83WEJzS0RR?=
 =?utf-8?B?T1I0WFl2bHJKb0VkS1p6cHVZSnF6ak9Ickt4enVCUE02aHEvWncvempaUjNC?=
 =?utf-8?B?V1YzTXk4Sm1CblE3dHA0U0MrS3pmQjdXaER5THVVbCtjd1hGbGVrZjBheUI5?=
 =?utf-8?B?M3plWis0eFhoUERuSTFjSVQxeFp0QTZrM2J3RVdVWUd4U0VYMVVucyt0Wkx5?=
 =?utf-8?Q?uh5Kx2MfSqY9I=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce07be8-2b33-4b7f-bc03-08db4dc49e48
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 23:58:26.7500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9aUoTdrMruqeKCJfsOnBqJzuEKk8lD0A11jWw/8h9DUThiXLXmCEXrlODoU0GfzGS8Rs7/sjWBzMDH6/rytVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190
X-Proofpoint-GUID: YVfR8lom79LzcIGKxxhrcAqtEyLZGpqQ
X-Proofpoint-ORIG-GUID: YVfR8lom79LzcIGKxxhrcAqtEyLZGpqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_28,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=634 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305050191
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBNYXkgMDUsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiANCj4gDQo+IE9u
IDUvNS8yMyAxNTozOSwgQXZpY2hhbCBSYWtlc2ggd3JvdGU6DQo+ID4gDQo+ID4gDQo+ID4gT24g
NC8yMC8yMyAxMDoyMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPj4NCj4gPj4gQXMgZmFy
IGFzIEkgdW5kZXJzdGFuZCwgd2UgaGF2ZSB0d28gd2F5cyBmb3J3YXJkIGhlcmUgdG8gYXZvaWQg
cnVubmluZw0KPiA+PiBvdXQgb2YgcmVxdWVzdHMgdG8gc2VuZDogc2VuZGluZyBkYXRhIGFzIHF1
aWNrbHkgYXMgcG9zc2libGUgKG1heGltaXppbmcNCj4gPj4gdGhlIG51bWJlciBvZiBieXRlcyBz
ZW50IGluIGVhY2ggcGFja2V0KSBhbmQgZmlsbGluZyB1cCB3aXRoIDAtbGVuZ3RoDQo+ID4+IHJl
cXVlc3RzIGluLWJldHdlZW4sIGFuZCBzcHJlYWRpbmcgdGhlIGRhdGEgYWNyb3NzIHBhY2tldHMu
IEknbGwgY2FsbA0KPiA+PiB0aGUgZmlyc3Qgb25lIGJ1cnN0IG1vZGUgZm9yIGxhY2sgb2YgYSBi
ZXR0ZXIgdGVybS4NCj4gPj4NCj4gPiANCj4gPiBIZXkgYWxsLA0KPiA+IA0KPiA+IEFwb2xvZ2ll
cyBmb3IgdGhlIGxhdGUgcmVwbHkuIE15IG5vdC1zby1sb25nIHdvcmsgdG9vayBsb25nZXIgdGhh
biBleHBlY3RlZC4NCj4gPiBJIHRyaWVkIHRoZSAyICh0ZWNobmljYWxseSAzLCBidXQgSSdsbCBn
byBvdmVyIGl0IGluIGEgYml0KSBhcHByb2FjaGVzIHdlIGhhZA0KPiA+IGRpc2N1c3NlZCBhYm92
ZSBhbmQgdGhlICJidXJzdCIgYXBwcm9hY2ggd29ya3MgcHJldHR5IHdlbGwuIEknbGwgYXR0YWNo
IHRoYXQNCj4gPiB0byB0aGlzIGVtYWlsLCBhbmQgc2VuZCBhbm90aGVyIGVtYWlsIG91dCB3aXRo
IHRoZSBvdGhlciBwYXRjaC4NCj4gPiANCj4gSGVyZSdzIHRoZSBzZWNvbmQgdGVzdC4gVGhpcyBw
YXRjaCBkb2VzIHRoZSBjb21wbGV0ZSBvcHBvc2l0ZSBvZiB0aGUgcHJldmlvdXMgb25lDQo+IGFu
ZCBpcyBiYXNlZCBvbiBUaGluaCBtZW50aW9uaW5nIHRoYXQgdGhlcmUgd2FzIHNvbWUgbG9naWMg
YnVpbHQgaW50byBEV0MzIHRvDQo+IHJlc2NoZWR1bGUgcmVxdWVzdHMgaWYgdGhlIHV2YyBkcml2
ZXIgZG9lcyBub3QgcXVldWUgYSByZXF1ZXN0IGZvciBzb21lIHRpbWUuDQo+IA0KPiBJdCBxdWV1
ZXMgdXNiX3JlcXVlc3RzIGluIHNob3J0IGJ1cnN0cyBhbmQgd2FpdHMgdW50aWwgYWxsIHRoZSBx
dWV1ZWQgcmVxdWVzdHMNCj4gaGF2ZSBiZWVuIHJldHVybmVkIGJlZm9yZSBxdWV1ZWluZyB1cCBh
bm90aGVyIGJ1cnN0IG9mIHVzYl9yZXF1ZXN0cy4gVGhpcyB3YXMNCj4gZGlzYXN0cm91cyBhcyBp
dCBzYXcgZmFyIG1vcmUgSVNPQyBmYWlsdXJlcyB0aGFuIGJlZm9yZS4NCj4gDQo+IFRoYXQgbGlr
ZWx5IHN0ZW1tZWQgZnJvbSB0aW1pbmcgYmV0d2VlbiB0aGUgbGFzdCByZXF1ZXN0IGJlaW5nIHJl
dHVybmVkIGFuZCB0aGUNCj4gbmV3IGJ1cnN0IG9mIHJlcXVlc3RzIGJlaW5nIHF1ZXVlZCwgYnV0
IG5vIGFtb3VudCBvZiBhcmJpdHJhcnkgd2FpdGluZw0KPiBiZXR3ZWVuIGxhc3QgcmV0dXJuIGFu
ZCBmaXJzdCBxdWV1ZSBjb21wbGV0ZWx5IGVsaW1pbmF0ZWQgdGhlIElTT0MgZmFpbHVyZXMuDQo+
IA0KDQpSaWdodCwgaWYgdGhlICJsYXN0IHJlcXVlc3QiIGlzIHNldCB3aXRoIG5vX2ludGVycnVw
dCwgdGhlbiB0aGUgZHdjMydzDQpyZXNjaGVkdWxpbmcgd29ya2Fyb3VuZCB3b24ndCBraWNrIGlu
LCB3aGljaCB3aWxsIGZhaWwgcmVnYXJkbGVzcyB0aGUNCndhaXQgdGltZSBiZWZvcmUgdGhlIG5l
eHQgYnVyc3QuIFRoaXMgd29ya2Fyb3VuZCBsb2dpYyBpbiBkd2MzIGlzIHZlcnkNCmJhc2ljLCBh
bmQgaXQgZG9lcyBub3QgaGFuZGxlIGV2ZXJ5IHNjZW5hcmlvLiBXZSBjYW4gaW1wcm92ZSBvbiB0
aGlzDQpsb2dpYywgYnV0IGFzIG5vdGVkIHdlIHNob3VsZCBub3QgcmVseSBvbiBpdC4NCg0KQlIs
DQpUaGluaA==
