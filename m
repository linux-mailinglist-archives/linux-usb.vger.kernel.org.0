Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6669659BD46
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 12:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbiHVKB2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 06:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbiHVKBZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 06:01:25 -0400
X-Greylist: delayed 1300 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 Aug 2022 03:01:22 PDT
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F4A31EEB
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 03:01:21 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M8wSxw022903;
        Mon, 22 Aug 2022 02:39:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=VAMKIfWYaZ/BzRn77GjCyaVGN2dQud1e5feRVtxpPqM=;
 b=S+uMGIUSJkD3s6/zkvDu5I65BFjrvnZmZ4q27Lt1GTCumts76/GuxEdqNrAmtyGwm1cx
 ws3GItQSlYop1EWHVHHx54fDp3mmH/87LPuQuXCuAvzq0nW23Yhbjvm8rLa7WiYvur/2
 D5t2L29nJKUPLec4fmIn1w8lWONp5u8UREx22kuE2Xy0KpyOML04nZZL8PZo4UtolZYm
 nb6mLuqKBkGQdD2W/q0/H4tSt9m6EjYJXmMDPfQg+nvI9Sx56OLEs+Luzui52x0JlofI
 kOKnWMYY+84Xm7c7LAHG+w7kmozv2lzan5RV3Ebnz3l8b+E/+1e0QnphLt6VxT+ipAn1 hg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3j2xmkpem4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Aug 2022 02:39:36 -0700
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 52CD2C093A;
        Mon, 22 Aug 2022 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1661161176; bh=VAMKIfWYaZ/BzRn77GjCyaVGN2dQud1e5feRVtxpPqM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KROj/QQLfLdXKk13CDM7efnhmo7adlbbeDNqhfBlcJRJH7TMW64wisSHyZYyoOizT
         0nnN5X74s0cWwTMXLwqWcf3KxDxaoeVrvJiZABOL7WyrlJI6My42fCRnWpxgk6S4wk
         njXL8THngEbJ1M079Pof/WVCzUsWh909VDTHGSal10dSH5j/M7nvOm6P8NvOnH3dDi
         xhZABzKGwtR+FkLdeZK5wf4JkZBVe7X+2VdO3BVz+gSzfVlVyN5nU2lC45+Gynvj2A
         VWmOXbN6QIUXeCZiH/wW846H62Vcx4Snwqqo5oNFeSJR+bWmop1VAc8+yENtPtC4VG
         WZ+T+fGKNGfKg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 62004A0358;
        Mon, 22 Aug 2022 09:39:34 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 780D44005D;
        Mon, 22 Aug 2022 09:39:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="WHC70fu5";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGPgnZnt3+3//F1nLxcDZvpTH5jQnHPfbU66P2mPdsed0l19LM/EGXIvQc1RuqAS1jpp5EwcxvWs001GZ4Olbw3qZ3Bc2uY+K4t92jwjDIyjGlFS3/tj+oR+1dFvFBQEL32i9LrEtBHQhubpQdVAzUbSbR3g9KN0yDRsCEgQbPOANqN0m75IJANc4T2XozFNcMn7y4M1K+Pkg3TtP2vlNtnyAkNev/CDaoipDM1/+0CRVQxo2J1K/HobF0e1cbdn03whcL8JZEfiAYNN9IVOprURfiHTGILMRXZ+CA/rHSFXcYmmaw3k51u/RiQfzyVc6T7dMuaRgV5e/UeLGcEowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAMKIfWYaZ/BzRn77GjCyaVGN2dQud1e5feRVtxpPqM=;
 b=Rbm0xYdLa9Wj5PY2iEd6z/gEzQuXleGIhWfCn+NcITfrqimQdHZHOC0SmQu9yNNdZjeVzGf3SCj9sbGFJ7eJDXQylqLADj+SZSXkeCd22yOlg2GRQuA87FRuIsT/efZ6uAnGnr1TItDb5ear9wmtSKoOrUfoMMwW/HOBcNFM412vwzXmMY/ObyxV9Bi1dLVabcwJbTFVE6a1ATIpPtmR25LzEXu5dkpRXIdQgr/iJb/pa+2ItEZmrEATcMwikYmPgr9ydEcnmIWHL9x0a6IvQShmyL5t63VSKB3usx+AjcFKbIUKNEZ72GD9E0FLxnAL6xV89DJZ/h37z8UZO4wl4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAMKIfWYaZ/BzRn77GjCyaVGN2dQud1e5feRVtxpPqM=;
 b=WHC70fu5Scrd1JnIdjKaD3XXLPyZpDGdwd1zXuBDoMp8N9YZRdb5bh6EDiQsSXle7uUAaWMpVMN8ReYxcW1lW6ceMOLNcS4pQWo3FxOvAu/Q1I7ADHCg5NFsqCbn9zADRkndTHmvGMkPaqTVw2kJbidd0Z08QT5Yq/VQLoMKaSQ=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by MN2PR12MB4158.namprd12.prod.outlook.com (2603:10b6:208:15f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 09:39:31 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::6d63:11b4:5275:4ee1]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::6d63:11b4:5275:4ee1%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:39:31 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: dwc2: fix wrong order of phy_power_on and phy_init
Thread-Topic: [PATCH] usb: dwc2: fix wrong order of phy_power_on and phy_init
Thread-Index: AQHYtLy7Sk7VmSLfV02fAY1easYTaK26rKIA
Date:   Mon, 22 Aug 2022 09:39:30 +0000
Message-ID: <f03187fc-59a5-a174-691a-687598c903a5@synopsys.com>
References: <f5632bde-0c34-9696-e979-497ef4fc9556@gmail.com>
In-Reply-To: <f5632bde-0c34-9696-e979-497ef4fc9556@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ca3a1fa-7edf-488d-145d-08da842236d8
x-ms-traffictypediagnostic: MN2PR12MB4158:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v4qrUXuUKeNTlWHqvdpCkn1cT7qNBCZF6rISPVWaDV8AH1UE/qoiAsrV4JA5EAeO8sqS09zWsGIzJpCmoAqK8ivPelXbTENGH5MP38Ra/nfBlMxEqUwkf72OtNFQsy6rzxKhaZadje83v3hM+OJkFdIPIt/g/37m8Ur5xU1YTvvVY4yaZMGpku3i4hGs2JDXBSI9nm/l2pZqFd8IGHWqnfYZ9ipl+d3zpRcEz+aU36NQ09mj2mY6LneJ5bvG1P2d73LB3ioExEebhoLYd3mopWY5RP8Cg+63bAaF07fDuF2BRqZ+b/YTbQyQHNshY66mAhJU0Zwrsb1yiN799ViioyJsEsBTpqiIXQK290QPuGBNj5VQ+fCwe3aWp85U//q4/LBMCCcty5tf1y16VzKn4uS9AEaI9aw6lCzGqrQnGunUQma0Nb7J9DvciAFJA2cFtbHEAiPrxAE/icYbgJ5t+jvpqNu69s/DR9yv+2BUR8g9qMNBbqLF+l0iAW7atU4UMl513vEYsgpn2EZU/JIQ9Z8LMSRn4iPrXk1gQeY+HHBlzWLsNnZsNQ0umCFeqOIxM5bpnKBRhk08toceNAG/zSuj+3eMftkgX13zquq8V8jPM+UZfTDi8SQuH6ACuyux9o7V0ZHPiQn3P7rq6Uuiqq9cygv7PEvoahaBonJTQnx8JA0Uk2Z9VI0BY3Eg0dJMJcbPhNPa0y1wqWf17KB/y6TIKI7QEh1gNWUruil6Hz52ZjFZ0m7XRpQFl9OeYDCiJpX9q6qHvPesBXvaE6eaEbPPFwyx/2aUpkXhFW3LjI+ukcdCZSaojsxMjjNMEUeG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(366004)(376002)(39860400002)(2906002)(5660300002)(86362001)(31696002)(6506007)(53546011)(26005)(6512007)(6486002)(478600001)(41300700001)(8936002)(122000001)(186003)(38070700005)(83380400001)(2616005)(38100700002)(316002)(4326008)(66946007)(8676002)(64756008)(66446008)(66476007)(110136005)(76116006)(66556008)(36756003)(71200400001)(31686004)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enROT1o1NTQrZE9nMHBWaURVUlBkM2JzV01ldWkwOUhZSWh1T0s2SVNtWjVO?=
 =?utf-8?B?Zzg1dGIzTFFGT0F0QUFDaUxtc1ZyaldGWHFadmlyK1Q1dEN4OVNoZ2RDVWpp?=
 =?utf-8?B?T0FkekZ4MUdZUy9pbnE0MmVyc2FKb3NPYVlpcURSTkdsWTViNmNkbXJvYmcr?=
 =?utf-8?B?SnNiVG1xTU53d3kvT1pkclhPdld3amRJTG1hMXYvU0haMVkvU0FIbEp4c29n?=
 =?utf-8?B?MEllb2htZElJTlZiRHpXbjMweDFMWVZYZnozMmx6QmkzbWlRYmxWYTVSWW9S?=
 =?utf-8?B?T3kxcmIxeTJVcWR1aGtjOHc1ZzRDanJRNW83ZlRVUXlaUzB5NmNDVjA1Y3Y4?=
 =?utf-8?B?U2RWQUdhMWFselBONjlYbFdKR0ZkbDNya0JwZ0NVSUluQm8ybnQ4R1F6ZHBF?=
 =?utf-8?B?NE5MbXk3VUc2V3dPdWp3THR6ZEZqenZld0drRk5yRnZSWWtsOGZkb3pFZ3di?=
 =?utf-8?B?RVRaR2NPS3dKVDZiMUtwMzFFVWVKL1BKOTdDaUlGdnUwSFVMZy9ESXNUamRT?=
 =?utf-8?B?THFnek01YzVTR0RvN3JCSnRVc0NPUDlFcWVTcjBTKzhLUkx2N3JyOUExTnhw?=
 =?utf-8?B?WWZBTGNoaHBNSk1xZ3g3UTdYc0g5SnIxdDM4OFVNOGU4blFDMHErSkVGaHBK?=
 =?utf-8?B?QTd6bjRvSDV6UGo1RWJieURmVVc1WlpsbSthZGNzNWhTRmpaL0hnaXEyNGU3?=
 =?utf-8?B?RkhSQzc0ayttMFE0WkVOWHZkK01vdTY1dlMzajFhWkR1Q21MR0RLZDhPMXJL?=
 =?utf-8?B?S1QxVE5RNFBZajJraVRTZ0Q3UEUxZ2ZrUkdad0pnRFhTc3FYUm5nVG5FVWZ2?=
 =?utf-8?B?S1pIYTdwb04weWxwc2RIcDNqeDVUTnl6M1EySjN3ZUl0MHN4ZHhZMWlzR0cw?=
 =?utf-8?B?VGJaOVNic3RJVDBJa1FvbGdnREtlZDlQRlczMEptd3NtZDliL3NGTkRlNUNL?=
 =?utf-8?B?dElkSTVqOXRTR1d5cUFpak9iU3NZSlRnVlpyOGxTUVJsV0UxVzkzWlJYN3BL?=
 =?utf-8?B?RTk0cTdmYzEwNUhRMXhjUW91eEdyeXU5ZS9LNHZ0NXNnSUlVamgvdC84U1BV?=
 =?utf-8?B?UTZLdHhhcjlrbStSSmVwTmZub1VrejlZL1E2eGtqcFh6WUdTVEgvYzM1MzJR?=
 =?utf-8?B?cjZsWXNvTEV4RjJ1ZDAzZEFOalc5UWNCeFJvSjNjelFMbzlSTXoxRUl0Qkcy?=
 =?utf-8?B?V1F2MDVnQjRmU3lhOUtZSGtQdTlTb0hpQTJvOEFxRzdRSThIWUNOdGVCQyt3?=
 =?utf-8?B?MTVNZDJwV1hXRmpScUsrWDVLSUV2dXJkYnFPYWltNHR3VWVkRzVRaUg2U3F1?=
 =?utf-8?B?MmxvYjJiYUVwQjFwVUxoalluczU3TlVBbTFCZWtWZ3VDMG5uRVRSemsrcXpz?=
 =?utf-8?B?dEFTMmVlTVJxZFZwYkVKMFVsRkUyZ0V0eE5ncHBzWU1pWUl3MVdOc2RmbGFD?=
 =?utf-8?B?bFpMeHQ4Y2dIMTFIK28yQXdzTE1ORkRNZFFVcUU1d2NGQlhRdExkNzk3LzRL?=
 =?utf-8?B?aS9rcVNyNzViL1FRTklhdDhUVXRDUTRLQzBxOVZReHBsY28vYXRKUTl1UGNh?=
 =?utf-8?B?VElyUUkzTGp3WEYzN3U0cjF1bFVsRkcvNFBpNnUvcHJ5eDNrUENqc1NnYUl4?=
 =?utf-8?B?dW40V2pOS3RvSks2dDhFMTViSFBmNEZoSDkrVTNqWFZJYmRZZDRsRjRZQTFw?=
 =?utf-8?B?bHdIdWRTQk1nSDdDdDFGRHFxVnhpcnk5U1ZtT2F3TzdYcGU5aDNxRWZqNkx5?=
 =?utf-8?B?c0lrQTNKV01pbElYOFEwS1pYZlUzalI2M1BjUjNEWCtaRjFzdEZHaXNXdkha?=
 =?utf-8?B?anExVDBhZjFxVHVPM1Y5b2JrOGZnYmVNOG9WaWR5RmFmSVJZUFNJRzdrTEQ1?=
 =?utf-8?B?K3VQbm15MlgyS1EzYnYvZTl6Rzk5VGxpdmF2czZMaTUwcG5BYk4zUVlLbVF4?=
 =?utf-8?B?ZkNWS1JLR0VxT3IzdmJpalFqc085d3F6czJxZkR4Sk9iQnpKWWJTbUVDVGg5?=
 =?utf-8?B?SDZFMmlhaXpMaFlTMWsvV3REMVd4MnhabFI3YmE5alFZanFqRURmZmFYcnJh?=
 =?utf-8?B?Qmwxam0xWjJSMWk0Tmp5RFJEdVh5V1VTYnArcU5PYWdkVm5tN0p2eWlWd0Iz?=
 =?utf-8?Q?GFlA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEE21DEFDD962446B398411636FED878@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca3a1fa-7edf-488d-145d-08da842236d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 09:39:30.9606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RSz50bX44os6z+d/0jxHe0OKQDfHzfqgT/RUFED3QlUzDohwxxs4de2OEM6lpWMYnrJtTtN3UbqMixV7SWIcxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
X-Proofpoint-GUID: OjhLScpRz2ImII66RHdKez6I-KRMEuvV
X-Proofpoint-ORIG-GUID: OjhLScpRz2ImII66RHdKez6I-KRMEuvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_04,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=932 malwarescore=0 clxscore=1011
 phishscore=0 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208220040
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSGVpbmVyLA0KDQpPbiA4LzIwLzIwMjIgOTo0NSBQTSwgSGVpbmVyIEthbGx3ZWl0IHdyb3Rl
Og0KPiBTaW5jZSAxNTk5MDY5YTYyYzYgKCJwaHk6IGNvcmU6IFdhcm4gd2hlbiBwaHlfcG93ZXJf
b24gaXMgY2FsbGVkIGJlZm9yZQ0KPiBwaHlfaW5pdCIpIHRoZSBkcml2ZXIgY29tcGxhaW5zLiBJ
biBteSBjYXNlIChBbWxvZ2ljIFNvQykgdGhlIHdhcm5pbmcNCj4gaXM6IHBoeSBwaHktZmUwM2Uw
MDAucGh5LjI6IHBoeV9wb3dlcl9vbiB3YXMgY2FsbGVkIGJlZm9yZSBwaHlfaW5pdA0KPiBTbyBj
aGFuZ2UgdGhlIG9yZGVyIG9mIHRoZSB0d28gY2FsbHMuDQo+IA0KPiBGaXhlczogMDlhNzVlODU3
NzkwICgidXNiOiBkd2MyOiByZWZhY3RvciBjb21tb24gbG93LWxldmVsIGh3IGNvZGUgdG8gcGxh
dGZvcm0uYyIpDQoNCkFkZGVkIENDOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ft
c3VuZy5jb20+DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6
IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvdXNiL2R3YzIvcGxhdGZvcm0uYyB8IDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMi9wbGF0Zm9ybS5jIGIvZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5jDQo+IGluZGV4
IGM4YmE4N2RmNy4uNGRiN2ExOGE1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL3Bs
YXRmb3JtLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5jDQo+IEBAIC0xNTQs
OSArMTU0LDkgQEAgc3RhdGljIGludCBfX2R3YzJfbG93bGV2ZWxfaHdfZW5hYmxlKHN0cnVjdCBk
d2MyX2hzb3RnICpoc290ZykNCj4gICAJfSBlbHNlIGlmIChoc290Zy0+cGxhdCAmJiBoc290Zy0+
cGxhdC0+cGh5X2luaXQpIHsNCj4gICAJCXJldCA9IGhzb3RnLT5wbGF0LT5waHlfaW5pdChwZGV2
LCBoc290Zy0+cGxhdC0+cGh5X3R5cGUpOw0KPiAgIAl9IGVsc2Ugew0KPiAtCQlyZXQgPSBwaHlf
cG93ZXJfb24oaHNvdGctPnBoeSk7DQo+ICsJCXJldCA9IHBoeV9pbml0KGhzb3RnLT5waHkpOw0K
PiAgIAkJaWYgKHJldCA9PSAwKQ0KPiAtCQkJcmV0ID0gcGh5X2luaXQoaHNvdGctPnBoeSk7DQo+
ICsJCQlyZXQgPSBwaHlfcG93ZXJfb24oaHNvdGctPnBoeSk7DQo+ICAgCX0NCj4gICANCj4gICAJ
cmV0dXJuIHJldDsNCg0KU2hvdWxkbid0IGJlIHVwZGF0ZWQgZnVuY3Rpb24gX19kd2MyX2xvd2xl
dmVsX2h3X2Rpc2FibGUoKSBzaW1pbGFybHksIA0KYWNjb3JkaW5nOiBwaHlfcG93ZXJfb2ZmIG11
c3QgYmUgY2FsbGVkIGJlZm9yZSBwaHlfZXhpdCgpPw0KDQpUaGFua3MsDQpNaW5hcw0KDQo=
