Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2CC6FD2C7
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 00:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjEIWnB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 18:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjEIWm7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 18:42:59 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8332E5276
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 15:42:58 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349JdohG029357;
        Tue, 9 May 2023 15:42:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=HpsX3Slsq7S/COrGhnJm41MDhc/ngixpFr5JNZYHhkg=;
 b=DAhbmG1efKgSgPOjp1xzXV2F4jB7IRwf7G2ale4n8UI2BnNGlSnFuojfWH5lEiC9G0gs
 aHqxglyEvyXRZI/zU7FHjvtQKS/v1wrPhJOQjuFMAGFA2+EHOZ0+MBj9F8dNrExacUO+
 n7QMsO0HNVV0maWsrfvBjD+KYr45s1HdIBLncdQXjtLxfIUj7apYKFXAm5bc4uiICNhQ
 +8P5gNQu1hqv4rvxxzKFEJmMAL6hdugoN2nPkstmdmkSNQeT8pWMckzM41TEuAXlwTIP
 ocZQxKFXY62DY0xHfN/2CSVqbKhu1agrINrsvcJkBu0wzbz1PmRp8dKMqvedrtCthtKL Vw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3qf77uehmf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 15:42:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683672171; bh=HpsX3Slsq7S/COrGhnJm41MDhc/ngixpFr5JNZYHhkg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lYPLX8Nfy/aK4P6KJioWH26V8C3J41UtaWhQrm+eIEHpD0mdJChh/RL5OFHua4XnI
         E3MkjEqFZif5LcerE5oBHsTeJxofdq8GbTSODL/c+XOHCBcOpXdT6OFEgMFYv4yUVs
         8lq2bbeuTtwVuC438n++AvtD2o6UxkpaTvYh2mH5XhK1d2+PpdnD0ZJ/v3xV3D0/B/
         fFovckl1rYxqAniXAmJMJqNEI8pUPNHNvNGZTSe5e20SRkPttCY/Epk7uxZGIexUSB
         Hl8K4ENyFZCd6rVH46k3BzTvk4CF98Pl0gAvJuqj/Z5Hj3ynFKmsIkL9Jka0jeC/T1
         8MDu1d2UTmWeA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 180EB4045D;
        Tue,  9 May 2023 22:42:51 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8E691A00AB;
        Tue,  9 May 2023 22:42:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OkxNW+eh;
        dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E73B54045F;
        Tue,  9 May 2023 22:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahgUnOJb5S9K95MmgJmtSQ73ln6I8tNnw1mpVw5h6zd8kxaI2nbJUMBOUuJOCPaAQsF1vy5EMacjXZkVS6OG9TwpdtqTH+kgneGpWBuWEd+FC6fupIgH1RBCVIuVvGcSgVjqun/mFI4o3lE2VG17JIzPyhNB5yP2xjz6insrMC/f/xU8NY49jZ1eh+uaGP9yyhsBCCNhfzsgaARir3xP98rDMscKzSLjs2aI5CVDQeBspyFJQmHKuH1H2w+mbrCIcOobHTVJjV8GLqRXY4HmJQR6zIaKhD/a5Ftywdj889TUCxb6o3xcrY85+a9efwLZiJTU1Szv0u52BjNAcHXQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpsX3Slsq7S/COrGhnJm41MDhc/ngixpFr5JNZYHhkg=;
 b=ll5OHKWoyCyIYMIQirh3+E0OHWToo+6/CH2uciWA1Ro4opBQql6YGayuiBEdzQYu/Fg74IcDZ8l9Yakn+NSkypYflMdi6yYk/9XqNUhkIuDSnJjXI4bhivArTMaN4CAkNihBgiFqijAvelBBGB9mqJoAg1U3STEtjdWfxTnfxriF1PtGYj28Alq5k8aDYftT9NuL10hXWEYFgA5XPuXIVAOBVFVnZUFe4CuyrhP6LTj6+kZGtFixK6XCcqPKYLV+a//6oxGIoXIiP0DddQCGN7tOm3M13p/ouo98jloK7iJ+PLh22HoxKr34QebAkDA3IxYKvDN7PFTHGIktgZgymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpsX3Slsq7S/COrGhnJm41MDhc/ngixpFr5JNZYHhkg=;
 b=OkxNW+eh3V6S94NHG9QAW3FFHf4C/aH3RpqcrZvczCFrf4f3XrPi9UvX3BTGa8M9UmmJx/dnwbXwCNxASDR4C8yRO8Byxis91GsByyTDUnzXanEyoNavY/j271CqtNDx0/pM4jYRg0FmfHWhwevnP+B9PcZFJXF2a2EKeo+3/Hc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 22:42:44 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 22:42:44 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAAlnSgIAX7D2AgADufoCAA9vnAIAACRuAgAEw7gCAAEO1AIAAAgaA
Date:   Tue, 9 May 2023 22:42:44 +0000
Message-ID: <20230509224241.vvylagjkqbwo4hbk@synopsys.com>
References: <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com>
 <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
 <20230509002143.7x5zo6bohvn5dyb2@synopsys.com>
 <CAMHf4WLzx3Bj-TR1ZrqsW1tfY+WUtgTt8TVObOFnkNcx2Pc9kw@mail.gmail.com>
 <20230509223526.5e6oqqri3mhwc34l@synopsys.com>
In-Reply-To: <20230509223526.5e6oqqri3mhwc34l@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN2PR12MB4254:EE_
x-ms-office365-filtering-correlation-id: 06bd236d-ffbc-4b94-d666-08db50deb464
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0nMBLopT6YwE9WIusdaHq1nag1zVktxBuzRA/E5kSZEmMErVd/3CpziB9pn/RQP+Enq4v+LudiBg1LyJ8r1sSFTeTzYI3LUJ+Rbyk3FXgfs9RPzj7p31TSqcFpNduaBbQNdMNcYOrO1FC45KuZweinmxyw1ChkhZd4TmnvPFx8XDyKIy0J28BldIshiyRWfMxRYVzkOMXYBAVje4rq/T2xptqieSiUtk3B3TfKaGvQFGIXx94Ku8ykW2xpW+OZ8qQPkNeyMat6chkkvd6jO7D3YkNOU4y1r/vvJPrF3N0UsSWknPk+eunD5rdeDZfs+avh/U7JJxiLCnavX6M0pfEq29ZlW9daZplB1pVw3xM1o7YUFMWi7xrBwORUcHMyeMyqDk04c8q1yPquKE+t9i8GafWC+8WrMV/PC02d1z9cU1ve4tYhOGkdj2JlJL9YsFFqzxmHkQO8zswDEKlyhuwpDWBAWpYkHiz5NSjujOFJyVflfMcTVcX/4HF0wM6uwXpuvcCAkncdiIWO64cBcA1Jfaz0m0gya18jw5HeTk+UM+kX/c487H/xBwHBGlq1qrhDDwn8+d2zrYQbKwQuSiw3Bpa/Hd50JG8cf01+EtOl1SVEtEsZWRGzJP0AtygRjT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(66899021)(36756003)(66556008)(122000001)(38100700002)(2906002)(8936002)(316002)(86362001)(8676002)(5660300002)(66946007)(4326008)(64756008)(41300700001)(6916009)(66476007)(38070700005)(66446008)(76116006)(83380400001)(53546011)(6506007)(186003)(1076003)(26005)(6512007)(2616005)(71200400001)(478600001)(6486002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm1TNm00YTYxM2YxWjhGKysxNDdMaUl6RWtQYkVrYkIvTVlkSm9wVS93RUN0?=
 =?utf-8?B?dVN5N1E1RXExV1J3THNRcWVJWGRHTWI0UXh3U2FjaXVLUlFBVzdCWHBMSUZO?=
 =?utf-8?B?UkR6NEw5ZER0ZUhlUEtNeXAycDdkakg1QmhrRGJPamsyN1IzcDRkaUs3QUxT?=
 =?utf-8?B?WEZBcElwTXMvMlBNQlYrSEgvcko4c0NKbWowU0Z3MjNjekt1bXBLeTFTR3JT?=
 =?utf-8?B?UTBOSXVDMEhIT1RRY1lSaDIyTjVRNU53UmpRR2NKSndlY0x6S001ZHIyL0kz?=
 =?utf-8?B?SXNveFlQRGt1cElVU2NnSVJ5WFVlSyttcGxEaGxMZWNlcldaVUFPdlBsMW43?=
 =?utf-8?B?M21FakZleXc3bTVvMjNPTGx6VllpLzcxSVMwbWNRNkJGZWFGQ3V2OXdaZjJZ?=
 =?utf-8?B?dzFnTExseFRUSFM4UVVuYkhobVNEUVlSSmNwaEkxMmViYzdzNlNGZzZvMkVp?=
 =?utf-8?B?VzhVZDBKb1lKbENad0QvUDVmaURVeDN2VG5WVTZKdGVHdDZocDlVQXluTVJF?=
 =?utf-8?B?Rm4yU2NlT044blRuR1pwdFBiUDBsR0gwMVhQU2plak9IMFdkd1ROUXg0VUIx?=
 =?utf-8?B?TytEMzgxRXBBRTEyQ0tSeC9ZZllsL2xOTDFFU0VJYmFRQjRpR0VRRWY3clVp?=
 =?utf-8?B?ME1WcTkvTXlnSkF1QkNtTS9HR2F0MHQrbTF3Z245bjNIU2VSTGtJWmNXeWxq?=
 =?utf-8?B?YTEyTzFBSU82SGhwZ0V0OFp6K3RGRWVGOUhyYzdOMUgyV01HN09xQ2RJcmdu?=
 =?utf-8?B?Sm91bW1RK3IwNEp3aU1CZUpIV0R2aDFMNThOU2VJWmRYNHBLMFg2YkhVWHd5?=
 =?utf-8?B?cEpqZm12N3Mra1dsVmJ2ZXluZm5FYy9EMVcyc3ZLckQyZHdZWlFVdHo2dDFh?=
 =?utf-8?B?cm8zYlQrT2RtOFhZRHpmdEpWRXlSYm95Njl0bW8wQko2QlFlbVVSU2s4b2NT?=
 =?utf-8?B?U0FzdXA5Nm82ZVVWVVpEVXU1S3BMTXpDWFErWFFCbDlxMk5XalVycUVvdlo1?=
 =?utf-8?B?R2VISmRQZHl6WHh4VXdKdWx5ZW5VaFc0ZGcxSGlCYlE1Q3pLQjV5aXZtOU9h?=
 =?utf-8?B?NDhnUFhuMHVQQmk5ZGcxM2lNZXNNUG4veWdSM2o3RVNEWnZyeklMUTVKdFQv?=
 =?utf-8?B?ZnY3YmF6SE82RkVOeHpJM1M4M0l3ZitvU0J4NWY5ckhWdzlWTDlnMElGbk8v?=
 =?utf-8?B?allzTzJqdGViZ1c3b1NwTFdKNng3S3E0Ly9HTzgzZUE3UTNXSDQxM3V2aFZM?=
 =?utf-8?B?WHZ1SytXR28yUTdWdVdYWWJ3TndXN1p3Nlo4MFFLVWMwbnpmTTU2MkY0UVY5?=
 =?utf-8?B?NFoxdXBuTVlBOXlJZ3RsU2hSTGRNOTdUVThkVGJ4VTg0cjNpNUpkY1pEc1Ja?=
 =?utf-8?B?NXNDNXhrdzlPYUdBamhKaFZTd3pjaHRGbWppY1ZVODhxTEF6N2czWjVXcDly?=
 =?utf-8?B?WG1PN0w2Tk5Xb2tWeHI2Mkd5SWU4ZS96RDg4RFJjSkR1c3FzUGVzdjExWHhU?=
 =?utf-8?B?OUZhOVEvcW5EV3NGeGhUU1A4eGs0V21SMi9LdEJ5eWN5VHYzdkx2bnlVUTZM?=
 =?utf-8?B?L0VFZ0hzNXVEMkprWHU1ZERDbXZIdW1ycUk4bExWdE9wM0FtQTRqeHBLMk94?=
 =?utf-8?B?OWNmaFVuaWhyelI3anR4ZkFJZEVkOGxMekJnNGxGQ0J6aGNBNXN5RDExS0Jq?=
 =?utf-8?B?enkzNXhBVWFnMU95OEFmbWZzTFkrMVhwamdEV1BId2hrV0pDaHhCZVZ5cU1Q?=
 =?utf-8?B?aUFzT200azFJVXpYVGNJT2sybHRxQkd0RHE0QlFzZGh2K0g3clJuT2dzOVFa?=
 =?utf-8?B?WVBFMEo4NENlcDVaZS9GTEs3R3hrR1lKdk05Tndva1l4SFl4NFN1MWxEcDBa?=
 =?utf-8?B?VG5OQ2lZUFpUd2t3ejRZQlM3YlNSQ3VnQ0hIdEJHMHNnYTQ0b1UrcHkzWmVW?=
 =?utf-8?B?SjdRVjdpMUtnZWtHaXBCL1l3WVNJM2pkYi9ENUhTZlNKb3V6QVBxL1d6dHJs?=
 =?utf-8?B?bVZBd0djRCtPME5nMzcvMHBKSVkyQzdaV2Q4czJWSnB0SGpWSEVVYUJiVnQv?=
 =?utf-8?B?SlkvVVMxM3pQVWJWSlZPN0M0cFdqNlNQcDRxQVFyT2U1TTlITlZnZFVicGhJ?=
 =?utf-8?Q?du+sdIhEPjtueAxaIlEn+C4uW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F04EE024D5E62409B68FC7146B981A2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VmRKNm5BSHRadnZIMVVvZTIvZGxTUkNOQ2hrRlB0T3E0ZWxOSnc2R3BOa1BF?=
 =?utf-8?B?WlFYY01iWUdHSFpJMFVHVkJIQ3kzTnpMZjJ3K21US1ZmOUdmaHdQWEovMUgz?=
 =?utf-8?B?YWZ1VHRWMVRGK2tyNG8vdnpwdExaMDNBL0I2YThIQ290cGxMaE1naGtzaWQy?=
 =?utf-8?B?WXRqeURnOUZSVTVtNlZMeExIazVjRFlPa3BHY3RGTmg0UHl3N1hGRzQrcDE1?=
 =?utf-8?B?RW9uMy9Mcm1zWGxhamRJUS9MZmxUZ0JqT2RJdUVneFNHZUd1VzA0SlNQdisw?=
 =?utf-8?B?b09hWHVlQ0R1VVc4QWZ2SEFFMStIMzZpS0NRM3N2Rk56T3daaWFEVXRtRFR4?=
 =?utf-8?B?dE9yUnRONmg2VHJhUlU3M1FoOFVqQWkxWG5wOWNldjZxRWZXVEhhZzhCUVVi?=
 =?utf-8?B?dGRxTHI1SThXUmY0WmwyWjV1V3RBNUdiL0RsOUdhVkJETnUzcENJTzRTVUpq?=
 =?utf-8?B?TEx0dTFBb0xKaldUY0FYdXl6ZjRzN3RhbVAyK3N4WUtWNVVZYlo1b0tqcXpw?=
 =?utf-8?B?QVl6OS9VeDhyY0tWWmx2RXBVeElIRUcyNFhXZWdTcTYzVnRSV21XVDJXcmFx?=
 =?utf-8?B?RFVyNWtqRlF2MzRMNmtSeGVwNmlGS3NETW11NDJIQTFyVlMxcWJZRDIxam14?=
 =?utf-8?B?enF3MEpGNk03YW1EN05WVDI1cStTZDAzR2FKZ0tMbDFPVmNVZ1NEMzhhWDly?=
 =?utf-8?B?bGhoaWtVeXhqZHJqRFpMRVp1WDd5VkxHUFR4RUdoUC9GczNvSXVmMU9xVHBh?=
 =?utf-8?B?Mm55eXJhaDFraVc1NFhGZ0xvWXJqdnlCN1NWZHhLZ01uZExkUVRhTS83WFB3?=
 =?utf-8?B?a1ZHVzl6bVF2T2ZGMm5RckJpWWJFR2NNYlZmc2FSazFuYWg5TDU4OEMrZnpn?=
 =?utf-8?B?cHc2c0J5cFoyUWpmL0tuT1VPNG9LWXpQc2g1cnd1SUljZ1JBMkNQNUJoYUVS?=
 =?utf-8?B?eHJVOG1HaytGaytpR0ZGY0xaRkQ0S3h3UHNCbHlNaldkT3E5b1k1YUZzcWV1?=
 =?utf-8?B?blZOelBHamFLZ1hGN2lGcGYyaVI3bTdCZ3Q3TVcxamNjb21BZVF4SUFIWWFF?=
 =?utf-8?B?VlFkbWs3cS83alVLUjZhbnpIZWpCMkR1S0FFMnRmdzJFTE9LeG0yMW02U1FR?=
 =?utf-8?B?RERWSFRHZGY4SUZsNWNEZnlpVnpsbDNyeTJrUGM4OGJZQWMyQ2Y5Yk53bnhu?=
 =?utf-8?B?TjRKZHhGOHhzK3h0VXd3LzhYMWlrL1FBRGhlZ0l1eExrVEFOVkJLVXpRaThx?=
 =?utf-8?B?dDc0dDdRTmNTTXdQUDRuV21qWjZXNTBJNGxCTWM1ZG12aW5YTmhGWjB6MzBB?=
 =?utf-8?Q?BsBu+M5VvgMWY=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bd236d-ffbc-4b94-d666-08db50deb464
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 22:42:44.2029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/N6buVf6WKFCNrq5WmXmfpE5/B1neSoN2aP2fRrgemIAu2BV3X0FR+Xn9MqoLPczoWJR/14rSpM3DmEoSjG0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-Proofpoint-GUID: ih2c88-kw7pFUauw8GgzlCS7hO5Hossj
X-Proofpoint-ORIG-GUID: ih2c88-kw7pFUauw8GgzlCS7hO5Hossj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305090185
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBNYXkgMDksIDIwMjMsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gVHVlLCBNYXkg
MDksIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiA+IE9uIE1vbiwgTWF5IDgsIDIwMjMg
YXQgNToyMeKAr1BNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3Jv
dGU6DQo+ID4gPg0KPiA+ID4gT24gTW9uLCBNYXkgMDgsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdy
b3RlOg0KPiA+ID4gPiBPbiBTYXQsIE1heSA2LCAyMDIzIGF0IDU6NTPigK9BTSBMYXVyZW50IFBp
bmNoYXJ0DQo+ID4gPiA+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3Rl
Og0KPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlIGZpcnN0IHRoaW5nIEkgdHJpZWQgd2FzIHRvIHNw
bGl0IG9uZSB2aWRlbyBmcmFtZSBvdmVyIDI2NiBmcmFtZXMsIHdpdGhvdXQNCj4gPiA+ID4gPiA+
IGNoYW5naW5nIHRoZSBudW1iZXIgb2YgcmVxdWVzdHMgYWxsb2NhdGVkLiBBbmQgaXQgd29ya3Mh
IEhvd2V2ZXIsIGFzIExhdXJlbnQNCj4gPiA+ID4gPiA+IG1lbnRpb25lZCwgaXQgZG9lcyBhZGQg
YSBmYWlyIGFtb3VudCBvZiBib29ra2VlcGluZyB0byBzcGxpdCBhIHZpZGVvIGZyYW1lIGludG8N
Cj4gPiA+ID4gPiA+IHRoZSByZXF1aXJlZCBudW1iZXIgb2YgcmVxdWVzdHMuIEkgYWxzbyBoYXJk
Y29kZWQgdGhlIG51bWJlciAyNjYgZnJvbSBvdXINCj4gPiA+ID4gPiA+IGRpc2N1c3Npb24sIGJ1
dCBJIGFtIG5vdCBzdXJlIGhvdyB0byBmaWd1cmUgb3V0IHRoYXQgbnVtYmVyIGR5bmFtaWNhbGx5
LiAyNjYNCj4gPiA+ID4gPiA+IGFsc28gZGlkbid0IHdvcmsgaWYgdGhlIGhvc3Qgc3RhcnRlZCBz
ZW5kaW5nIGZyYW1lcyBhdCBtb3JlIHRoYW4gMzBmcHMgOi8sIHNvDQo+ID4gPiA+ID4gPiBvdXIg
ZHluYW1pYyBjYWxjdWxhdGlvbiB3b3VsZCBuZWVkIHRvIHRha2UgY2FtZXJhJ3MgcmVhbCBvdXRw
dXQgZnBzIGludG8NCj4gPiA+ID4gPiA+IGFjY291bnQsIHdoaWNoIGFzIGZhciBhcyBJIGNhbiB0
ZWxsIGlzIG5vdCBrbm93biB0byB0aGUgVVZDIGRyaXZlci4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IEl0IHdvdWxkIHByb2JhYmx5IG5lZWQgdG8gbW9uaXRvciBob3cgZnVsbCB0aGUgcmVxdWVzdCBx
dWV1ZSBpcywgYW5kDQo+ID4gPiA+ID4gYWRhcHQgdGhlIG51bWJlciBvZiBieXRlcyBpdCBxdWV1
ZXMgaW4gZWFjaCByZXF1ZXN0IGFjY29yZGluZ2x5LiBUaGF0J3MNCj4gPiA+ID4gPiBpbmRlZWQg
cXVpdGUgYSBiaXQgb2Ygd29yaywgZm9yIGxpdHRsZSBnYWluIGNvbXBhcmVkIHRvIHRoZSBvcHRp
b24geW91DQo+ID4gPiA+ID4gZGVzY3JpYmUgYmVsb3cuDQo+ID4gPiA+ID4NCj4gPiA+ID4gQWdy
ZWVkLCBlc3BlY2lhbGx5IGlmIHRoZSBob3N0cyBhbHJlYWR5IGhhbmRsZSAwIGxlbmd0aCBwYWNr
ZXRzLg0KPiA+ID4gPiBBcyBsb25nIGFzIHRoZSB1c2IgY29udHJvbGxlcnMgY2FuIGtlZXAgdXAs
IHRoZSBidXJzdCBhcHByb2FjaCBzZWVtcw0KPiA+ID4gPiBtb3JlIHJlYXNvbmFibGUuDQo+ID4g
PiA+DQo+ID4gPiA+ID4gPiBXaXRoIHRob3NlIGlzc3VlcyBJIHRyaWVkIHdoYXQgTGF1cmVudCBj
YWxsZWQgdGhlICJidXJzdCIgYXBwcm9hY2gNCj4gPiA+ID4gPiA+IChhdHRhY2hlZCBiZWxvdyks
IGkuZS4gc2VuZCB0aGUgdmlkZW8gZnJhbWVzIGluIGFzIGZldyBwYWNrZXRzIGFzIHBvc3NpYmxl
LA0KPiA+ID4gPiA+ID4gYW5kIHRoZW4gcXVldWUgdXAgMCBsZW5ndGggcGFja2V0cyB0byBrZWVw
IHRoZSBJU09DIHF1ZXVlIGhhcHB5LiBUaGlzIGFwcHJvYWNoDQo+ID4gPiA+ID4gPiB3b3JrcyBw
ZXJmZWN0bHkgYXMgZmFyIGFzIEkgY2FuIHRlbGwuIExvY2FsbHkgSSB0cmllZCB3aXRoIGEgTGlu
dXgsIFdpbmRvdywNCj4gPiA+ID4gPiA+IGFuZCBNYWNPUyBob3N0IHdpdGggbm8gZnJhbWUgZHJv
cHMgb3IgSVNPQyBmYWlsdXJlcyBvbiBhbnkgb2YgdGhlbSENCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBJbiB0aGUgY3VycmVudCBwYXRjaCwgVVZDIGdhZGdldCBkcml2ZXIga2VlcHMgdGhlIElT
T0MgY2FkZW5jZSBieSBlZmZlY3RpdmVseQ0KPiA+ID4gPiA+ID4gbWFpbnRhaW5pbmcgYSBiYWNr
LXByZXNzdXJlIG9uIHRoZSBVU0IgY29udHJvbGxlciAoYXQgbGVhc3QgdG8gdGhlIGJlc3Qgb2Yg
aXRzDQo+ID4gPiA+ID4gPiBjYXBhYmlsaXRpZXMpLiBBbnkgdXNiX3JlcXVlc3QgYXZhaWxhYmxl
IHRvIHRoZSBVVkMgZ2FkZ2V0IGdldHMgaW1tZWRpYXRlbHkNCj4gPiA+ID4gPiA+IHF1ZXVlZCBi
YWNrIHRvIHRoZSBVU0IgY29udHJvbGxlci4gSWYgYSB2aWRlbyBmcmFtZSBpcyBhdmFpbGFibGUs
IHRoZSBmcmFtZSBpcw0KPiA+ID4gPiA+ID4gZW5jb2RlZCwgaWYgbm90LCB0aGUgbGVuZ3RoIGlz
IHNldCB0byAwLiBUaGUgaWRlYSBiZWluZyB0aGF0IHRoZSBob3N0J3MgcG9sbGluZw0KPiA+ID4g
PiA+ID4gYW5kIHRoZSBjb250cm9sbGVyJ3MgJ2NvbXBsZXRlJyBjYWxsYmFjayB3aWxsIHJlc3Vs
dCBpbiBhIHNvbWV3aGF0IGNvbnNpc3RlbnQNCj4gPiA+ID4gPiA+IGNhZGVuY2UgZm9yIHRoZSB1
dmMgZHJpdmVyIGFmdGVyIHRoZSBpbml0aWFsIGJ1cnN0IG9mIHBhY2tldHMuDQo+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gSG93ZXZlciB0aGlzIGRvZXMgbWVhbiB0aGF0IGF0IHdvcnN0LCB0aGUg
bmV3IHZpZGVvIGZyYW1lcyBhcmUgdXAgdG8gNjMNCj4gPiA+ID4gPiA+IHVzYl9yZXF1ZXN0cyBi
ZWhpbmQsIGJ1dCBhc3N1bWluZyBhIDEyNXVzIHBlciB1c2JfcmVxdWVzdCwgdGhhdCBhbW91bnRz
IHRvIH44bXMNCj4gPiA+ID4gPiA+IGxhdGVuY3kgYXQgdGhlIHdvcnN0LCB3aGljaCBzZWVtcyBh
Y2NlcHRhYmxlPw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhlcmUncyBhIHRyYWRlIG9mZiBiZXR3
ZWVuIGxhdGVuY3kgYW5kIHRoZSByaXNrIG9mIHVuZGVycnVucy4gV2UgY291bGQNCj4gPiA+ID4g
PiBkZWNyZWFzZSB0aGUgbnVtYmVyIG9mIHF1ZXVlZCByZXF1ZXN0cyB0byBsb3dlciB0aGUgbGF0
ZW5jeSwgYXMgbG9uZyBhcw0KPiA+ID4gPiA+IHdlIGVuc3VyZSB0aGUgbWFyZ2luIGlzIGhpZ2gg
ZW5vdWdoIHRvIGF2b2lkIHVuZGVycnVucyBpbiBoaWdoZXIgbG9hZA0KPiA+ID4gPiA+IGNvbmRp
dGlvbnMuIFdlIGNvdWxkIGFsc28gZG8gc28gb25seSB3aGVuIHF1ZXVpbmcgMC1zaXplIHJlcXVl
c3RzLCBhbmQNCj4gPiA+ID4gPiBxdWV1ZSB0aGUgZGF0YSBpbiBidXJzdCBtb2RlIHdpdGggYSBo
aWdoZXIgbnVtYmVyIG9mIHJlcXVlc3RzLg0KPiA+ID4gPg0KPiA+ID4gPiBXb3VsZCA4bXMgb2Yg
bGF0ZW5jeSBiZSBjb25zaWRlcmVkIHNpZ25pZmljYW50PyBVbmxlc3MgdGhlIGhvc3QgYXNrcw0K
PiA+ID4gPiBmb3IgPjEyNWZwcywNCj4gPiA+ID4gdGhhdCBhbW91bnRzIHRvIGxlc3MgdGhhbiBh
IGZyYW1lIG9mIGxhdGVuY3ksIHNvIGZyYW1lcyBzaG91bGQgbm90IGJlIGRyb3BwZWQNCj4gPiA+
ID4gYnkgdGhlIGhvc3QgZm9yIGJlaW5nICJsYXRlIi4gQWRtaXR0ZWRseSwgSSBkb24ndCBrbm93
IGVub3VnaCBhYm91dCBVVkMgdXNhZ2UgdG8NCj4gPiA+ID4gc2F5IGlmIDhtcyAoYXQgd29yc3Qp
IHdpbGwgYmUgcHJvYmxlbWF0aWMgZm9yIGNlcnRhaW4gdXNhZ2VzLiBUaGUNCj4gPiA+ID4gaG9z
dHMgZG9uJ3Qgc2VlbSB0bw0KPiA+ID4gPiBoYXZlIGFueSBpc3N1ZXMgd2hlbiBzdHJlYW1pbmcg
YXQgPD02MGZwcy4NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBEbyB5b3Ugb25seSBxdWV1ZSBhIHNp
bmdsZSBidXJzdCBhdCBhIHRpbWU/IFdlIGRvbid0IGhhdmUgdG8gcXVldWUgYWxsDQo+ID4gPiA2
MyAwLWxlbmd0aCByZXF1ZXN0cyBhcyBhIHNpbmdsZSAiYnVyc3QiIHJpZ2h0PyBXZSBjYW4gcXVl
dWUgbXVsdGlwbGUNCj4gPiA+IHNtYWxsZXIgYnVyc3RzIG9mIDAtbGVuZ3RoIHJlcXVlc3RzLiBU
aGlzIHdheSwgdGhlIFVWQyBkcml2ZXIgY2FuIGJlDQo+ID4gPiBpbnRlcnJ1cHRlZCBtb3JlIG9m
dGVuLCByZWR1Y2luZyB0aGUgdmlkZW8gZGF0YSBsYXRlbmN5IGlmIGl0IGFycml2ZXMNCj4gPiA+
IGVhcmxpZXIuIFRoaXMga2VlcHMgdGhlIHRvdGFsIG51bWJlciBvZiBxdWV1ZWQgcmVxdWVzdHMg
c21hbGxlciB3aGlsZQ0KPiA+ID4gZW5zdXJpbmcgdGhhdCB0aGUgY29udHJvbGxlciBpc24ndCBz
dGFydmVkIG9mIHJlcXVlc3RzIChhcyBsb25nIGFzIHRoaXMNCj4gPiA+IHNtYWxsZXIgYnVyc3Qg
YWNjb3VudHMgZm9yIHRoZSBzeXN0ZW0gbGF0ZW5jeSkuIFRoZSB0cmFkZW9mZiBoZXJlIGlzDQo+
ID4gPiBqdXN0IHRoZSBVVkMgZ2FkZ2V0IGRyaXZlciBuZWVkcyB0byBoYW5kbGUgcmVxdWVzdCBj
b21wbGV0aW9uIGEgbGl0dGxlDQo+ID4gPiBtb3JlIG9mdGVuLiBIb3dldmVyLCB3ZSBhcmUgbGVz
cyBsaWtlbHkgdG8gYmUgdW5kZXJydW4gbm8gbWF0dGVyIHRoZQ0KPiA+ID4gdmlkZW8ncyBmcHMu
DQo+ID4gDQo+ID4gVGhlIHBhdGNoIGRvZXMgY3VycmVudGx5IHF1ZXVlIGFsbCA2NCAwLWxlbmd0
aCBwYWNrZXRzIGZyb20gdGhlIHN0YXJ0LA0KPiA+IGFuZCB0aGVuIHJlbGllcyBvbiBjb21wbGV0
aW9uIGNhbGxiYWNrcyB0byBtYWludGFpbiBhIHN0ZWFkeSBzdGF0ZS4gSXQNCj4gPiBzdGlsbCBz
ZXRzIHRoZSBgbm9faW50ZXJydXB0YCBmbGFnLCBzbyB0aGUgY29tcGxldGlvbiBjYWxsYmFjaw0K
PiA+IGludGVycnVwdHMgZXZlcnkgfjE2dGggcmVxdWVzdCAoYXQgd29yc3QpIHdoaWNoIGlzIHRo
ZSBzYW1lIGFzIGJlZm9yZS4NCj4gDQo+IEkgc2VlLCB0aGF0J3MgZ29vZC4gSSB0aG91Z2h0IHRo
ZXJlJ3Mgb25seSAxIG91dCBvZiA2NCByZXF1ZXN0cyB3aWxsDQo+IGhhdmUgY29tcGxldGlvbiBp
bnRlcnJ1cHQuDQo+IA0KPiA+IElkZWFsbHksIHRoZSBVVkMgZHJpdmVyIG5ldmVyIHNpdHMgb24g
YSB2aWRlbyBmcmFtZSBmb3IgbG9uZ2VyIHRoYW4gMTYNCj4gPiByZXF1ZXN0cywgYnV0IGl0IGRv
ZXMga2VlcCB0aGUgY29udHJvbGxlciBxdWV1ZSBhcyBmdWxsIGFzIGl0IGNhbiwNCj4gPiB3aGlj
aCBtZWFucyB0aGUgdmlkZW8gZnJhbWUgY291bGQgYmUgc3R1Y2sgYmVoaW5kIGEgYnVuY2ggb2Yg
MC1sZW5ndGgNCj4gPiBwYWNrZXRzIGFuZCBjb3VsZCBoeXBvdGhldGljYWxseSBiZSBzZW50IGZh
c3RlciBpZiB3ZSB3ZXJlIHRvIGJlDQo+ID4gc21hcnRlciB3aXRoIHF1ZXVpbmcgdGhlIDAtbGVu
Z3RoIHJlcXVlc3RzLiBJIHNheSBoeXBvdGhldGljYWxseSwNCj4gPiBiZWNhdXNlIEkgaGF2ZSBi
ZWVuIHVuYWJsZSB0byBjYXB0dXJlIGFueSBsYXRlbmN5IGRpZmZlcmVuY2VzIHdpdGggYW5kDQo+
ID4gd2l0aG91dCB0aGUgcGF0Y2guDQo+ID4gDQo+ID4gSSd2ZSBiZWVuIHRyeWluZyB0byB0aGlu
ayBvZiBzb21lIHdheSB0byBhY2NvdW50IGZvciBzeXN0ZW0gbGF0ZW5jeQ0KPiA+IGFuZCBvbmx5
IHF1ZXVlIGEgc21hbGxlciBzZXQgb2YgMCBsZW5ndGggcGFja2V0cywgYnV0IG1vc3Qgb2YgdGhl
bQ0KPiA+IGJvaWwgZG93biB0byAiaG9wZSB3ZSBoYXZlIGVub3VnaCByZXF1ZXN0cyBxdWV1ZWQi
LiBJdCB3b3VsZCBiZQ0KPiA+IGhlbHBmdWwgaWYgd2UgY291bGQgcGluIHNvbWUgbnVtYmVycyBk
b3duIHRoYXQgY2FuIGJlIHJlbGllZCBvbiBieSB0aGUNCj4gPiBnYWRnZXQgZHJpdmVyLiBGb3Ig
ZXhhbXBsZTogQ2FuIDEyNXVzIHBlciByZXF1ZXN0IGJlIHNhZmVseSBhc3N1bWVkOw0KPiA+IG9y
IGlzIHRoZXJlIGEgd2F5IHRvIGdldCBpbmZvcm1hdGlvbiBhYm91dCBob3cgbG9uZyBhIHVzYl9y
ZXF1ZXN0IHdpbGwNCj4gPiBsYXN0IGZvcj8gSXQgd291bGQgYmUgdmVyeSBoZWxwZnVsIGlmIHRo
ZXJlIHdhcyBhIHdheSB0byBxdWVyeSB0aGUNCj4gPiBjb250cm9sbGVyJ3MgYWN0aXZlIHF1ZXVl
LCBidXQgSSBjb3VsZG4ndCByZWFsbHkgZmluZCBhbnl0aGluZyBpbiB0aGUNCj4gPiBBUElzLiBX
ZSBjYW4ndCByZWFsbHkgcmVseSBvbiB0aGUgY29tcGxldGUgY2FsbGJhY2tzIGJlY2F1c2Ugb2Yg
dGhlDQo+ID4gIm5vX2ludGVycnVwdCIgZmxhZy4gSSdsbCB0cnkgb3V0IHNvbWUgdGhpbmdzLCBh
bmQgZ2V0IGJhY2suIElmIHlvdQ0KPiA+IGhhdmUgYW55IGlkZWFzLCBJIHdvdWxkIGxvdmUgdG8g
aGVhciB0aGVtIHRvbyENCj4gPiANCj4gDQo+IElmICJub19pbnRlcnJ1cHQiIGlzIHNldCwgaXQg
anVzdCBtZWFucyB0aGUgZ2FkZ2V0IGRyaXZlciB3aWxsIG5vdCBnZXQgYQ0KPiBub3RpZmljYXRp
b24gb2YgdGhlIHJlcXVlc3QgY29tcGxldGlvbi4gSXQgbWF5IGhlbHAgdG8gdGhpbmsgaW4gdGVy
bSBvZg0KPiB0aGUgbW92aW5nIGN1cnJlbnQgdWZyYW1lIHNpbmNlIGl0J3MgcHJlZGljdGFibGUg
YW5kIHN0ZWFkaWx5DQo+IHByb2dyZXNzaW5nLiBFYWNoIHF1ZXVlZCByZXF1ZXN0IGlzIGVhcm1h
cmtlZCBmb3IgYSBmdXR1cmUgdWZyYW1lLiBPbmNlDQo+IHRoZSBjdXJyZW50IHVmcmFtZSBtYXRj
aGVzIHRoZSBzY2hlZHVsZWQgdWZyYW1lIG9mIHRoZSByZXF1ZXN0LCB0aGUNCj4gcmVxdWVzdCBp
cyBjb21wbGV0ZWQgcmVnYXJkbGVzcyB0aGVyZSdzIGEgbWlzc2VkIGlzb2Mgb3Igd2hldGhlciB0
aGUNCj4gbm9faW50ZXJydXB0IGlzIHNldCAoZ3JhbnRlZCBpdCdzIG5vdCBzdGFsZSkuDQoNCkp1
c3Qgd2FudCB0byBjbGFyaWZ5IHRoYXQgY29tcGxldGUgaGVyZSBpcyBmcm9tIHRoZSBwZXJzcGVj
dGl2ZSBvZiB0aGUNCmNvbnRyb2xsZXIuIFRoZSBjb250cm9sbGVyIGRyaXZlciBkb2Vzbid0IGF1
dG9tYXRpY2FsbHkgdXBkYXRlIHRoZQ0KcmVxdWVzdCBhbmQgZ2l2ZSBiYWNrIHRoZSByZXF1ZXN0
IHRvIHRoZSBnYWRnZXQgZHJpdmVyIHlldC4NCg0KQlIsDQpUaGluaA0KDQo+IA0KPiBUaGUgc3lz
dGVtIGxhdGVuY3kgaW50cm9kdWNlcyBkZWxheSBpbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgYW5k
IHRoZQ0KPiBoYW5kbGluZyBvZiBpdC4gSW4gb3RoZXIgd29yZHMsIHdlICprbm93KiB0aGUgbWlu
aW11bSB0aW1lIGZvciB0aGUNCj4gcmVxdWVzdCBjb21wbGV0aW9uLCBidXQgd2UgY2FuJ3QgZ3Vh
cmFudGVlIHRoZSB0aW1lIHRoZSBnYWRnZXQgZHJpdmVyDQo+IHdvdWxkIHJlY2VpdmUgYW5kIGZp
bmlzaCBoYW5kbGluZyB0aGUgcmVxdWVzdCBjb21wbGV0aW9uIGludGVycnVwdC4gVGhpcw0KPiB2
YXJpZXMgYmV0d2VlbiBkaWZmZXJlbnQgc2V0dXBzLiBBbiBlcnJvciBkdWUgdG8gc3lzdGVtIGxh
dGVuY3kgc2hvdWxkDQo+IG5vdCBiZSBhIGZyZXF1ZW50IG9jY3VycmVuY2UuIEFzIGxvbmcgYXMg
aXQncyB3aXRoaW4gYW4gYWNjZXB0YWJsZQ0KPiB0aHJlc2hvbGQsIGl0IHNob3VsZCBiZSBmaW5l
LiBJIHRoaW5rIHlvdXIgOG1zIGRlbGF5IGlzIGZpbmUsIHBvc3NpYmx5DQo+IDRtcyBtYXkgYmUg
bW9yZSB0aGFuIGVub3VnaC4gSSBoYXZlbid0IGhhZCB0byBkZWFsIHdpdGggbW9yZSB0aGFuIDNt
cw0KPiBkZWxheSBpbiBvdXIgaGFyZHdhcmUgdGVzdGluZ3MgKHdpdGggbXVsdGlwbGUgZW5kcG9p
bnRzIGFuZCBkZXZpY2VzKS4NCj4gDQo+IEkgaG9wZSB0aGlzIGluZm8gaXMgbmV3IGFuZCB1c2Vm
dWwsIG90aGVyd2lzZSBJIG1heSBzb3VuZCBsaWtlIGEgYnJva2VuDQo+IHJlY29yZC4NCj4gDQo+
IE5vdGU6IHdlIGNhbiBhbHdheXMgZW5oYW5jZSBVVkMgYWdhaW4gc2hvdWxkIGFueW9uZSByZXBv
cnQgbmV3IGlzc3VlDQo+IGluIHRoZWlyIHRlc3Rpbmcgb25jZSB5b3VyIGNoYW5nZSBpcyB1cHN0
cmVhbWVkLg0KPiANCj4gQlIsDQo+IFRoaW5o
