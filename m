Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A86F7932F4
	for <lists+linux-usb@lfdr.de>; Wed,  6 Sep 2023 02:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbjIFAmP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 20:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235922AbjIFAmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 20:42:15 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F74A9E
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 17:42:11 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385IQRsI013590;
        Tue, 5 Sep 2023 17:42:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=4vEqAPhMJxuF3uXWuyWbezi2TRGLu8DA5EJ0/BwP6R4=;
 b=pUOSo4jhsxkloG3JLvMJ7sBIUgrSVnNvUvgqtYsbJYxVGhynGek/U5wyr5JP1JcTagOO
 kU6sNgmjqKg+Jw53yHXljuYgD//R/VcSHWETZSWs/x+jIK4DLUITb0j3m7NrxbaEx+12
 yNRYirAOYT/+9720fyaqlsx+nxJx6Nn0COrea3djSdIjvO0tO1osl34Uw6ULXv+2ZgzU
 wkA4sGGMjpUIgAwf6yIOoK156/3xyBL0lj4MBS0/FntZYXgVYTNWs5aC4+ZfcH4ZuZTC
 b8M+C8if9Tp09HbmF01sO1v7wzEssfBUW0v5m45YPejzDBJpts1pwFSMqAy4V58mIisF 2A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3sv3peg63p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Sep 2023 17:42:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1693960925; bh=4vEqAPhMJxuF3uXWuyWbezi2TRGLu8DA5EJ0/BwP6R4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=H3rgaljZ8xJOYbBOVDe640WSLHLdaPPLeFhgv8hrqoP0TKlMEjIdusJn4wW30igTv
         OCN5NUoIBQB6LXKDj+dHw6Bh6T20UDtf3iYCQreW215yru7FpTZVJ3+S95q3yFzcwk
         02EhumluD9FNscLkXZxM+A4Lnku/FyJUkCV/3V/2AjlrdC+IMb+B1ouD3wby/fi4vi
         Op7K4tUWFJU5tcFKzo55DYwflvA8Bgm8HO6hRpOn+bPfNmFU/JLDIN+1bvbCrz6u63
         oDujxTJIGM60jbDxUT3PTGomldWO2NS25NQSlUXUF4ciBjixgXeDezPuEmHOzd8YfM
         IiFPYXVizT1NQ==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2558D401D2;
        Wed,  6 Sep 2023 00:42:04 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 74EA6A0096;
        Wed,  6 Sep 2023 00:42:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ip5d06DF;
        dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 38C5C4058E;
        Wed,  6 Sep 2023 00:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nre9MRGEGh7DmxWb4NZrYH4SalyXWHDw24bYMPWRr5wHDVFEfptK7GT0DNQFvLQmw0pO+EitsO6SQr93ZLzCV4KBSUyQLHUu7OT2YB4I7utoUZGuH8E0tHX1SAU3SLcYc3T2ww82p4co73+6u9q783M3ufQsiNrQdywBHtmnKlWukp9j5QSMmUf/rv3iXMQX6Ro+iKtSayglPgdR7rjIHooiZi47zErwZo06+y28TLc7mXWTqWgPghJiCUl/KYvD59s2fzy14MSJinP2nngtkWEeI6HSmvqt7INpZNk3ifamIGRz+pr9hg/+Ezb5w877qlqUYEWTqk/kMsVrnD0XDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vEqAPhMJxuF3uXWuyWbezi2TRGLu8DA5EJ0/BwP6R4=;
 b=L5rnebaBaPXjwJAUVWYL4kT6eCwObdLDpa+DV+X7LXXaBW/d4K8e7EE1ilRzTF2VVPdIQXi+Sgn8L/dLpgIugLVRxG04WnL1RfhRIkCwT3yo3Fn2v0dh//GIduvEyp8B155UiDBapDQRR/LHamOkEecG9AQ6YxAGYpWNvRev/1uiRQiz6qsqx/PBKY5vgm+GyJIEwQ3vwnWNHT63GoZYniBJovoDWrbXN33SqGqwHWQ25A1nvHv7kNzq4jGYu/mqoFB4TK7mThv4lL9JLHYjKHnEQb1JD4RU2leRsilIzXLaiMksDoZ1wQ6QP5+u+oHlZbEcIzkMIj4NtjJmokgHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vEqAPhMJxuF3uXWuyWbezi2TRGLu8DA5EJ0/BwP6R4=;
 b=ip5d06DFePS08EXKJrKtP7qEf6rorrugptsp2jbB6qtTu9KTUJDnXbfvrklxv/zPUNpUWJYBqwg/m0167ch0BtieMGWqxp+n0KhsGvu6hXcTm0fgTtfz2SfqfWIWKtH4fK3rap6WQmtZUwUnvzWH4EdL90jubLNz88Ih4mxDZA4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 00:41:59 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f%5]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 00:41:58 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Topic: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Index: AQHZ3FhJKJr5gUY68kuSvYhFApjTyLAFL1EAgASHkoCAA0Y9AA==
Date:   Wed, 6 Sep 2023 00:41:58 +0000
Message-ID: <20230906004144.4igr4akglxxqahc3@synopsys.com>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de>
In-Reply-To: <ZPULnRSVgd5S3Cao@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH0PR12MB7792:EE_
x-ms-office365-filtering-correlation-id: 0f9a1cc4-fdd1-46d0-1955-08dbae7213f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OhVUUcbuUi88mi2yUK7HmTEM4eNlM+m2BndSFomU5RPhAMXXcJgreVpkHnR8y1BmvD7bvSiAtuDJKZxkpI+AkF1i1KcEyyFHRkzk2zlVP3Cf6DCPrJPvNnQOI1XsXSD/olMtF/yRQISSmHWOmk9x+soWeM7cc60naT6HkM+q9KCTCVMk1FrstWa2AWUjO1OR9cV45iXrHxldWrwRmn+7owHtWFqaiFvInl8YgMi1OSxomYhOAea5yD45R2s8Kl06N6PbAAWRKwMilGoUtrVqtVpbwa+OqbaQad0GfvB6ofmVX6uwGBGetRtj19LzQTGCZwHlHZWpRdeFohqteh3Yo3shTP9ZM56VsKc4NcYaiwSfPl9+SXWptnD6938ruty0VhPID6GA1FTFydWAdD3tkyDFf+SDcrXENSSV/8Z+mpMKD5XS0OfftWWlcyss/FQxqiKgt5SUfGajo4stcDagGvdFoIDR8FnnRkb0b0Sv9cDysvPXRffFpUyO63dCNegh09VKEUcm01zS6SuE7WMXxoRcxoRR6U2rv2ygB0ehMbBRfWMTIMemIWwrU+xVo5DXXGmLboNtFZHvQuYmCsst4Z0WmwMDgE29XXbZwTK2N4rOlmRfZE1+0hr+tS/qaL4o
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199024)(1800799009)(186009)(66446008)(64756008)(54906003)(66556008)(6916009)(66476007)(76116006)(66946007)(478600001)(38100700002)(122000001)(38070700005)(316002)(2906002)(8676002)(8936002)(6506007)(5660300002)(4326008)(83380400001)(41300700001)(6512007)(6486002)(26005)(2616005)(71200400001)(86362001)(1076003)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXpaMVpHTlExMERqOHNYS3J3cWdpeWFONEE2c3dRZ1gxS2VITWxyT09VdEt4?=
 =?utf-8?B?cDFOcDVFWEMwenAvUWtKQmtnTVZObytWaTlwVERHQjF1dHdjZkZ6bmxubW9T?=
 =?utf-8?B?aXNIa2xOdU84NnBGdUV4cmRmZkRZRnV3UHEvOTU1Y3B5QmxxTnp6VTZJSWVY?=
 =?utf-8?B?eEt5SVZXOEZyclBIVTVmaXpPVUpxRFdmRkY3WGxrbVhKUnhRWE1rYjhOeVUy?=
 =?utf-8?B?TW5LeVp5YnBCd0gwamN2eXorRE9PdTRxYzRUV0hnOWdxaU5yZzBLRG5FYkh1?=
 =?utf-8?B?N0s4ai9Ub0xTTmE2L0gySGxUNmJpdGFQTktISXhuTXp5ZnJIdXZpNmoycDFm?=
 =?utf-8?B?b0dzRW5INEEycWJERjFaWVUyQVZCQUgyeHVxVHhvVlRKTmNPa0IrUFVROUE3?=
 =?utf-8?B?UDB6QnhaaFN2NWFQZWR2T003RWYwNGgrTmNiNTQvUkNVVTNGRUdBamk3L1do?=
 =?utf-8?B?eEhBRnZHYWQ2azhrSS83UHZMTHZLMzgrVW00Qm9IdmQyaFMwWVd0R29xeEh0?=
 =?utf-8?B?T2VGeUZuUDg2b2dJaHhRM2o4ODNKSk05UVU0QXBKNmk2RFRhWFRuUWE2TGJQ?=
 =?utf-8?B?Y1pIVGtZRXd3cXgwN1l1VEFrNW1CUzJudDlNVHU4TDVFNDd5OUxIUDVyZzhk?=
 =?utf-8?B?TU1OREE3OE8xMEtKbUJndmtqdnNIRFNjYVJDTVdqeWlzMTZFajY5d3FmWEZz?=
 =?utf-8?B?Y2tUMWJLRTFsNlg3UUtPak1PNHNIamxFNTVjZ0wwUytuVkU2OTdGaUhqTzNh?=
 =?utf-8?B?L2ZhQ21TVTFrTXpHSEx5aEZzZm1PY1Q5Ulhnd2dWdGp2UDhocmZDRDk4MFY4?=
 =?utf-8?B?bDFlOWdQNjVhTHF1T1dRclVpcFNQTC9keXN1N1lIcFIrNUVpUTVLMlNrT3E2?=
 =?utf-8?B?M0NacDJDZm8yL210ZTd6bFlUSHJvWWtNSXYyYjNDREhxVEQ5elVyS2lXaVM5?=
 =?utf-8?B?by8yTHBWbWdjZ0FTYzNpMVVzOUpsaXdRd0lmTEpzSTRXTWl6TkpxMHhzMS90?=
 =?utf-8?B?SjR2U3ExTFlEbkc3cXN6aDhkN3BTMGhKYk9SdStTejNMWHNXNk0wU3hUQnVI?=
 =?utf-8?B?ZUZRdVc4dTlDb0t4WThKeFFBYUQycGdEN0FyY3VDYlovUllWVUJjd0VYSHFQ?=
 =?utf-8?B?VWQwNWZXLyt0aXZPL3RrNU5najBHNVY3NkdWQWVDVWFwVll3a01ZTW5ZVXZV?=
 =?utf-8?B?Zzc5VThreXg4U3hpMW9VRzR4NTF3Qms5ZlkvbEZRbG50MlZJdlA3YmpOb05w?=
 =?utf-8?B?a1RldjhDVFdxU01vV3lDS1I5cnJMR0pvakREcjlBNG9MbGl4OTQzamxjV1NT?=
 =?utf-8?B?REc4eGpTTEhwbVlqQjNTeUlrQ0RXMVBYRURSZUtJNFI0RFVJV2I5ZkdBY0N3?=
 =?utf-8?B?KzlKaWhWZEwzazk0UkhZMGRKSEt1NFdqLzE4RzE4WURoUHFoVFN3djVFSWxi?=
 =?utf-8?B?K0p3UmVqOWtMWkNUdW8wbysraFNMbndjTUlQbStzQzdnN1NzbzkvWmZkM1hV?=
 =?utf-8?B?eUw4cUg0azVVNHZ2b2dBanc2OFNDdDV4Z245L0Q0L1ZMZ2NId28venJZOU5u?=
 =?utf-8?B?cFhJMlpiZnNzQXZIVE4xb3dDWFljdWw0UzZIemJkNjRxekRXZEwxdU1LTGdr?=
 =?utf-8?B?YmY2Z09zMGNpQk9qY3czL256MDcvZWRYY1VVVnNEckhHRWlrOWxDdFRGbFQr?=
 =?utf-8?B?RHNJd2haVzE0NnUwQnh3dGFpamV0M3lSTktlTnAzV1NDcE10cWVpdjJ0TXJO?=
 =?utf-8?B?N081ZWpuQjlpZEZiM1BPSXhiQnhaVUVlS1FLOEFCUVRFMHFJSVloS25SRUZK?=
 =?utf-8?B?TTcyWWFLYVJ3QWt6V3MwOVN4ZzlHbGl4bUUvZGVaU2lVOXlJUUNLOGlsQ0hE?=
 =?utf-8?B?cm90dWpuTHFCZmE4YzRIRWJ3TXBwS1paMVZlTzRvNUlDZW0yOWp6UVdFeTZl?=
 =?utf-8?B?VUlvU3oyN1B5dnVMUjkxSkdlUmtUSmtINDRiWkVpc1VCZ3JuNG15cjdFRi9Q?=
 =?utf-8?B?YVJCZlc4SzJjeXZhb3hlUlF1SDdNSmpobUZQcXFmYnFvRnI3bHBDY1VpRitx?=
 =?utf-8?B?RUZQYjZYR0FmMWVoZHc4a3NiVU1IY1ZJOEZmaFNQa1FFUEYzT1Fra1RsUEd4?=
 =?utf-8?Q?pU01XJsMtB16ky/1m9fAQmWz/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A866F8662B8B848A628006302BCA9D0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: yhYKuRZKzM0xxawExWH+zyviORLkg0YdR3z8X0mfh49rF9/4YtPaSyrpm6iuwWGdqIDNpBzAqY9yGmnNri9/HjTOpmOu9pB29dxUrbIn2xvN1heEIShxVg6nEllxwnOlEhnJTly03F5ao7mxksQxHR/M5CXZCYt/3TQUBFnaMkoZC28kqrRaP3YMMo40QAYHyAqwWKtE/ULzgrforRYFM3ySSP8sbZgr0xZB6z1QVmNHiCMa8MCZs7fJnb2Mto400PzlnwNm/xnk09ZjrQZZfvanAc+AQoJlbmxZU1ypQuPM0W8H1PDMSQNcyX+Zm9c+BmIkqluHZ6b+acWDP8Q8EQeuKGWcXFcVmU7AphW3t+FRkgGp77Az1Fs13F4XfQaHNz+8TYnLtEFm2P7HU+Zoc37i1A3TBvxSgrymJUMo16HjF7PLb2OZkCWW0W6SFAsqeANGVXYDO8gSF8UElSbaiCv56te2M4Kq1c3pjuYoOu6Z8pH6McANE4J9WUFpjBI17Mzv7H4OJoa7zuFFyerxg869VMD0Tu2zbW0nMZwJbmKhTzMsYboR/Z4VYgq4IxcblIwsza/4704ZLj+FCj1GeMUcetx44XjNIWtS4vJ4urQcKlYS/74QnF9JgMf7nGPCiQ5cWVqLxjWmnJvNZcRs7Ypj3wsuqDErBFdkH0Vf2bf5CmNjC7+xDKS0USyEALYh0AJm3q2eAChbjBhyKHFSvkW7MqEncB5mOAMyDBy9/dDVcUAHZdkarNOFVMIIEv7dY7/JKkP9596qVClu8Ks9aZ0RAxkl7yeN5YqnWj6dvNc3l0UI6aaXkTA6yxIT2KsA+2C7ixZsL7mcdFVC0N8RDQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9a1cc4-fdd1-46d0-1955-08dbae7213f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 00:41:58.7125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBGfj//tScaPNDejORKmFE4C0fs5LRRu9aY1N0hcqpD07decr6ACXeKYZXdrn6DNGjrIBlSgLEpRHD3pV3Rj6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792
X-Proofpoint-GUID: 0ta1Tk0WCyM7Ut0A8IqIgllGrt08JhTO
X-Proofpoint-ORIG-GUID: 0ta1Tk0WCyM7Ut0A8IqIgllGrt08JhTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309060003
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIE1vbiwgU2VwIDA0LCAyMDIzLCBNaWNoYWVsIEdyemVzY2hpayB3cm90ZToNCj4g
SGkgVGhpbmgNCj4gDQo+IE9uIEZyaSwgU2VwIDAxLCAyMDIzIGF0IDAxOjM1OjE2QU0gKzAwMDAs
IFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBGcmksIFNlcCAwMSwgMjAyMywgTWljaGFlbCBH
cnplc2NoaWsgd3JvdGU6DQo+ID4gPiBJIGp1c3Qgc3R1bWJsZWQgb3ZlciBhIHNpbWlsYXIgaXNz
dWUgd2UgYWxyZWFkeSBzb2x2ZWQgZm9yIHRoZSBIaWdoDQo+ID4gPiBTcGVlZCBDYXNlIHdoZW4g
c3RyZWFtaW5nIElTT0MgcGFja2FnZXMgYW5kIHVzaW5nIGEgbXVsdGlwbGllciBoaWdoZXINCj4g
PiA+IHRoZW4gb25lLiBMYXN0IHRpbWUgd2Ugc2F3IHNvbWUgYmFkIGZyYW1lIGFydGVmYWN0cyB3
aGVuIHVzaW5nIHRoZQ0KPiA+ID4gaGlnaGVyIG11bHRpcGxpZXIgdmFsdWUuIFRoZSBGcmFtZXMg
d2VyZSBkaXN0b3J0ZWQgZHVlIHRvIHRydW5jYXRlZA0KPiA+ID4gdHJhbnNmZXJzLg0KPiA+ID4g
DQo+ID4gPiBTaW5jZSB0aGUgbGFzdCBjYXNlIHdlIGhhdmUgcGF0Y2gNCj4gPiA+IA0KPiA+ID4g
OGFmZmUzN2M1MjVkICgidXNiOiBkd2MzOiBnYWRnZXQ6IGZpeCBoaWdoIHNwZWVkIG11bHRpcGxp
ZXIgc2V0dGluZyIpDQo+ID4gPiANCj4gPiA+IHRoYXQgZml4ZXMgdGhlIGNhbGN1bGF0aW9uIG9m
IHRoZSBtdWx0IFBDTTEgcGFyYW1ldGVyIHdoZW4gdXNpbmcgaGlnaA0KPiA+ID4gc3BlZWQgdHJh
bnNmZXJzLiBBZnRlciB0aGF0IG5vIHRydW5jYXRpb25zIHdlcmUgcmVwb3J0ZWQgYWdhaW4uDQo+
ID4gPiANCj4gPiA+IEhvd2V2ZXIgSSBjYW1lIGFjcm9zcyBhIHNpbWlsYXIgaXNzdWUgd2hpY2gg
aXMganVzdCBhIGxpdHRsZSBsZXNzIGVhc3kNCj4gPiA+IHRvIHRyaWdnZXIgYW5kIG9ubHkgb2Nj
dXJzIHdpdGggU3VwZXJzcGVlZC4gTm93LCB3aGlsZSB0aGUgbWVtb3J5DQo+ID4gPiBiYW5kd2lk
dGggb2YgdGhlIG1hY2hpbmUgcnVucyBvbiBoaWdoZXIgbG9hZCwgdGhlIFVWQyBmcmFtZXMgYXJl
DQo+ID4gPiBzaW1pbGFybHkgZGlzdG9ydGVkIHdoZW4gd2UgdXNlIGEgbXVsdGlwbGllciBoaWdo
ZXIgdGhlbiBvbmUuDQo+ID4gPiANCj4gPiA+IEkgbG9va2VkIG92ZXIgdGhlIGltcGxpY2F0aW9u
cyB0aGUgbXVsdGlwbGllciBoYXMgb24gdGhlIFN1cGVyc3BlZWQgY2FzZQ0KPiA+ID4gaW4gdGhl
IGR3YzMgZ2FkZ2V0IGRyaXZlciwgYnV0IGNvdWxkIG9ubHkgZmluZCBzb21lIFRYRklGTyBhZGp1
c3RtZW50cw0KPiA+ID4gYW5kIG5vIG90aGVyIGV4dHJhIGJpdHMgZS5nLiBpbiB0aGUgdHJhbnNm
ZXIgZGVzY3JpcHRvcnMuIERvIHlvdSBoYXZlDQo+ID4gPiBzb21lIHBvaW50ZXJzIGhvdyB0aGUg
bXVsdGlwbGllciBwYXJhbWV0ZXIgb2YgdGhlIGVuZHBvaW50IGlzIHVzZWQgaW4NCj4gPiA+IGhh
cmR3YXJlPw0KPiA+ID4gDQo+ID4gDQo+ID4gQXMgeW91IGFscmVhZHkga25vdywgUENNMSBpcyBv
bmx5IGZvciBoaWdoc3BlZWQgbm90IFN1cGVyc3BlZWQuIFdoYXQNCj4gPiBmYWlsdXJlIGRpZCB0
aGUgZHdjMyBkcml2ZXIgcmVwb3J0ZWQ/IE1pc3NlZCBpc29jPyBXaGF0J3MgdGhlIHJlcXVlc3QN
Cj4gPiB0cmFuc2ZlciBzaXplPw0KPiANCj4gWWVzLCBJIHNlZSBtaXNzZWQgaXNvYyBlcnJvcnMu
IEJ1dCB0aGlzIGlzIGp1c3QgYSBzeW1wdG9tIGluIHRoaXMgY2FzZS4NCj4gDQo+IEkgY2FuIGlu
Y3JlYXNlIHRoZSBtYXhidXJzdCBvciBtYXhwYWNrZXQgcGFyYW1ldGVycyBzdGVwd2lzZSBhbmQg
b24NCj4gb25lIHBvaW50IHNlZSB0aGUgZmxpY2tlcmluZyBhcHBlYXIuIEJ1dCB3aGVuIEkgaW5j
cmVhc2UgdGhlIFRYRklGT1NJWkUNCj4gZm9yIHRoZSBlbmRwb2ludCB0aGUgZmxpY2tlcmluZyBp
cyBnb25lIGFnYWluLiBVbnRpbCBJIGluY3JlYXNlIG9uZSBvZg0KPiB0aGUgcGFyYW1ldGVycyBt
YXhwYWNrZXQgb3IgbWF4YnVyc3QgdG8gbXVjaCBhZ2Fpbi4NCj4gDQo+IFNvIGR1ZSB0byB0aGUg
bWVtb3J5IGJhbmR3aWR0aCBpcyB1bmRlciBwcmVzc3VyZSwgaXQgc2VlbXMgbGlrZSB0aGUNCj4g
aGFyZHdhcmUgaXMgbm90IGZhc3QgZW5vdWdoIHdpdGggc2VuZGluZyB0aGUgZXhwZWN0ZWQgZGF0
YSBwZXIgdHJhbnNmZXIsDQo+IGR1ZSB0byB0aGUgdHhmaWZvIGlzIG5vdCBsb25nIGVub3VnaCBh
bmQgbmVlZHMgdG8gYmUgcmVmaWxsZWQgbW9yZQ0KPiBvZnRlbi4NCj4gDQo+IFRoaXMgc291bmRz
IGxpa2UgYSBmaWZvIHVuZGVycnVuIGlzc3VlIGluIHRoZSBoYXJkd2FyZS4NCj4gDQo+IEkgYW0g
Y3VycmVudGx5IGxvb2tpbmcgaW50byB0aGUgZmlmb19yZXNpemUgZGV2aWNlIHRyZWUgcGFyYW10
ZXIsDQo+IGFuZCB0cnkgdG8gZmlndXJlIG91dCBob3cgdGhlIGNhbGN1bGF0aW9uIGlzIGRvbmUu
DQo+IA0KPiBGcm9tIHRoZSBzb2Z0d2FyZSBkZXNpZ24gcG9pbnQgb2YgdmlldywgaGF2aW5nIHRo
ZSBmaWZvIGNhbGN1bGF0aW9uDQo+IHBhcmFtZXRlcml6ZWQgaXMgYSBiYWQgaWRlYS4gV2UgcHJv
YmFibHkgd2FudCB0byBhbmFseXplIGhvdyBtYW55DQo+IGVuZHBvaW50cyBhcmUgZ29pbmcgdG8g
YmUgdXNlZCBpbiB0aGUgYWN0aXZlIGdhZGdldCBjb25maWcgYW5kIHVzZSB0aGUNCj4gZmluaXRl
IGZpZm8gbGVuZ3RoIHRvIGNhbGN1bGF0ZSBzb21lIGZhaXIgcGFydHMgZm9yIGV2ZXJ5IGVwDQo+
IG9uY2UgYW5kIHRoZW4gbmV2ZXIgdG91Y2ggdGhlbSBhZ2Fpbi4gRHluYW1pYyByZXNpemluZyBz
aG91bGQgbm90IGJlDQo+IG5lY2Vzc2FyeSBvciBkbyBJIG92ZXJsb29rIHNvbWV0aGluZz8NCj4g
DQo+IFdoYXQgZG8geW91IHRoaW5rPw0KDQpUaGVyZSBhcmUgbXVsdGlwbGUgZmFjdG9ycyB0aGF0
IGltcGFjdCB0aGUgaXNvYyBwZXJmb3JtYW5jZToNCjEpIEZJRk8gc2l6ZQ0KCVR5cGljYWxseSB0
aGUgRklGTyBzaXplIGlzIHJlY29tbWVuZGVkIHRvIGEgbWluaW11bSBvZiB0aGUNCglvdXRwdXQg
b2YgZHdjM19nYWRnZXRfY2FsY190eF9maWZvX3NpemUoKS4gRm9yIGlzb2MsIGRlcGVuZGluZw0K
CW9uIHRoZSByZXF1ZXN0IHNpemUsIGlmIGl0J3MgNDhLQi91ZnJhbWUsIHlvdSBwcm9iYWJseSBu
ZWVkIG1vcmUNCgl0aGFuIHRoZSBtaW5pbXVtLiBFYWNoIHBoeXNpY2FsIGVuZHBvaW50IGhhcyBh
IHByZS1jb25maWd1cmVkIFRYDQoJRklGTyBzaXplLiBXaXRob3V0IHRvdWNoaW5nIHRoZSBGSUZP
IHJlY29uZmlndXJhdGlvbiBwYXJhbWV0ZXIsDQoJdGhlbiB0aGUgZHJpdmVyIHdpbGwganVzdCBw
aWNrIHRoZSBmaXJzdCBwaHlzaWNhbCBlbmRwb2ludCB0aGF0DQoJY2FuIGJlIHVzZWQsIGJ1dCBp
dCBtYXkgbm90IGJlIHRoZSBiZXN0IGZpdCBmb3IgeW91ciBwdXJwb3NlLg0KDQoyKSBCdXJzdCBz
ZXR0aW5nDQoJSSB0aGluayB0aGlzIGlzIHNlbGYtZXhwbGFpbmF0b3J5LiBMYXJnZSBkYXRhIHJl
cXVlc3QgbmVlZHMNCgloaWdoZXIgYnVyc3QuDQoNCjMpIEludGVybmFsIGNhY2hlIHNpemUNCglU
aGUgY29udHJvbGxlciBjYWNoZXMgWCBudW1iZXIgb2YgVFJCcyBldmVyeSB0aW1lIHlvdSBxdWV1
ZSBhDQoJbmV3IHJlcXVlc3QuIElmIGEgcmVxdWVzdCBoYXMgYSBsb3Qgc21hbGwgVFJCcywgdGhl
biBpdCBuZWVkcyB0bw0KCXJlY2FjaGUgbXVsdGlwbGUgdGltZXMganVzdCB0byBjb21wbGV0ZSB0
aGUgcmVxdWVzdC4gVHlwaWNhbGx5DQoJdGhlIGNvbnRyb2xsZXIgY2FjaGVzIDggb3IgMTYgVFJC
cy4gSSBub3RpY2UgdGhhdCBVVkMgdXNlcyBTRyB0bw0KCXNwbGl0IHVwIHRoZSByZXF1ZXN0IHRv
IHNtYWxsIFNHIGVudHJpZXMgYmFzZSBvbiBsb2dpY2FsIHBhcnRzDQoJcmF0aGVyIHRoYW4gZm9y
IHBlcmZvcm1hbmNlIG9yIGhhcmR3YXJlIHNpemUgY29udHJhaW50cy4gU28sDQoJdGhlcmUgY2Fu
IGJlIGltcHJvdmVtZW50cyBoZXJlLg0KDQo0KSBIb3N0IGJhbmR3aWR0aCBjb25zdHJhaW50DQoJ
VGhlIGhvc3QgY2FuIGxpbWl0IHRoZSBidXJzdCB0aHJlc2hvbGQgYW5kIGRvIGxlc3MgYnVyc3Qg
dGhhbg0KCXdoYXQgdGhlIGRldmljZSBpcyBjYXBhYmxlIG9mIGR1ZSB0byB0aGUgaG9zdCdzIGJh
bmR3aWR0aA0KCWNvbnRyYWludC4gSWYgdGhlcmUgYXJlIG90aGVyIGVuZHBvaW50IHRyYWZmaWMg
b24gdG9wIG9mIGlzb2MNCgllbmRwb2ludCwgdGhlbiB0aGUgaG9zdCB3b3VsZCBoYXZlIHRvIHJl
c2VydmUgYmFuZHdpZHRoIGZvcg0KCW90aGVyIGVuZHBvaW50cy4gRGVwZW5kaW5nIG9uIHRoZSBo
b3N0IGNvbnRyb2xsZXINCglpbXBsZW1lbnRhdGlvbiwgaXQgbWF5IHJlc2VydmUgbW9yZSBvciBs
ZXNzIGZvciBpc29jLiBBbHNvLCBpZg0KCXRoZXJlIGFyZSBodWJzIG9yIG90aGVyIGRldmljZXMg
aW4gdGhlIHRvcG9sb2d5LCB0aGVuIGl0IGltcGFjdHMNCgl0aGUgYmFuZHdpZHRoIHRvby4NCg0K
QmFzZSBvbiB5b3VyIGRlc2NyaXB0aW9uLCBsb29rcyBsaWtlIG1vZGlmeWluZyBUWCBGSUZPIHNp
emUgaW1wYWN0cyB0aGUNCm1vc3QuIFdlIGFscmVhZHkgaGF2ZSBzb21lIHByb3BlcnRpZXMgdG8g
Y2FsY3VsYXRlIGFuZCByZXNpemUgdGhlIFRYDQpGSUZPIHNpemUsIGRpZCB5b3UgdHJ5IHRvIHNl
ZSBpZiBpdCBpbXByb3ZlcyBmb3IgeW91PyAoY2hlY2sNCmR3Yy0+ZG9fZmlmb19yZXNpemUpLg0K
DQo+IA0KPiA+IFBlcmhhcHMgeW91IGNhbiBjYXB0dXJlIHNvbWUgdHJhY2Vwb2ludHMgb2YgdGhl
IHByb2JsZW0/DQo+IA0KPiBJTUhPIHRyYWNlcG9pbnRzIGFyZSBwcm9iYWJseSBub3QgbmVjZXNz
YXJ5IGhlcmUgYW55bW9yZS4NCj4gDQoNClRoaXMgaGVscHMgdG8gc2VlIGhvdyB1dmMgc2V0dXBz
IHRoZSB0cmFuc2ZlciBhbmQgc2VlIHdoYXQgY291bGQgaW1wYWN0DQp0aGUgaXNvYyB0cmFuc2Zl
cnMgKGZvciBwb2ludCAzIGFuZCA0IGFib3ZlKS4gSG93ZXZlciwgaWYganVzdCByZXNpemluZw0K
dGhlIFRYIEZJRk8gd29ya3MgZm9yIHlvdSwgcGVyaGFwcyB3ZSBjYW4ganVzdCBmb2N1cyBpbnRv
IHRoaXMuDQoNClRoYW5rcywNClRoaW5o
