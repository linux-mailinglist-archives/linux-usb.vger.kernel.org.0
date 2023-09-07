Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E88797F3F
	for <lists+linux-usb@lfdr.de>; Fri,  8 Sep 2023 01:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbjIGXdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Sep 2023 19:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbjIGXdk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Sep 2023 19:33:40 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996001BC5
        for <linux-usb@vger.kernel.org>; Thu,  7 Sep 2023 16:33:36 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387K5t8X021346;
        Thu, 7 Sep 2023 16:33:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=CiJuhQVAtsgZ9fEJhf0d24U8zrT6o6QAIoAWra0AVSk=;
 b=TlbE5QfW5BhiAPpaHeq3uk2PetnGQZ2/+9JK3IIzFVfyPN6kCXF9gG4I6mP+hex+A7mE
 TxqPCHs1Wk87gp3VYocmmdgd6C6VuttCLtkblQuGOuXcBdgmqFjZHN1S9zJHft/retzO
 BS6bGeodX1GS9+/PneYl0v9KXS8+EMkE9PuOWZegrYNJTqH84RScIOrcz6UJFqTtLYRc
 oOW1JiMAorPN5XCfacOcWklua9497uk6lwjdbIH3bMRlJXMKgpsNuDPswCPxSdBBA2O0
 qHuYHzpmzcv/9h77GGR4rS+A5yEYyOLLL/TJLHzgHdNJFHRQRZGvnyoK0sF8uP7o5FLP /A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3sv42n1juq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Sep 2023 16:33:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1694129611; bh=CiJuhQVAtsgZ9fEJhf0d24U8zrT6o6QAIoAWra0AVSk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dqUHq0nNpk04AFgv1nXLR9UemWwVxO+CHlQTQwPLbOxQxkrm6dbJ1wGpM/lBQzsAj
         rKbqxkUaun5AOnDP3Lho3wVMzYJji20LQxw4NLZ7i+l2SsNVJUHE8HnaMMmyfI3zH3
         +iFpI2w0MjSRxngkXO5wOlNSJbN+iXUh9Ddui7Zqh9x+JMnJMQTh2RzvUzoUcTQb2H
         C4N6O5whw0XjfuHkFi2t0lNz3kxVjntxuow8hgGHt1uQWEyfUQRkwOGlC+r40+me79
         kcC0muryG9Ou9YBeQkd+oYV98tqOQ6MgiPoJQTZlbMpGuHhb0mduWEfHNztTEdb+3O
         QEpfYxqG0BNtw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90742401DA;
        Thu,  7 Sep 2023 23:33:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id DAFD0A007B;
        Thu,  7 Sep 2023 23:33:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gdmXThem;
        dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B019540121;
        Thu,  7 Sep 2023 23:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4vmSNDe9XswCU8Oxqtnuo3ruMe4Oq5c/a/BWQAyc7JYsLIIU8/xzb7MfJCLYHxRPt62AgD6mk878JSrh0aY4VqUawXlBlfPgasQmnxrNbqzQP6br7SRasTI6N2duwmU6JgnesmTaMwzbDEVjCKLieXDBnimvLRILA8lY/B74IzHXYxa+yFcqhJfbY5ODjtIJy2OTMbsJmaQEOiPl0N453rZIfC0rQH7qVRnl/yroVmr+K/NFIX6rvhkQXxhnCr9GKbYy+lyY0rBQuFrCski8ihb2UzAqmqFQ0HGA54TY2DiSTuXYB2XndtOlmQAcIJVIXuXiqZZeyebpoDVsIVuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiJuhQVAtsgZ9fEJhf0d24U8zrT6o6QAIoAWra0AVSk=;
 b=a3p9N4utODPuMZgkA49+G8ivT6qvG5ahjGX8zqbbdOfQlxS3taqtXUSk4Iz/2y75PnxbldJZZKZw/psDo8eqzGw9niN+s4sqWQ9jKIy12l1Kt9/Dwbn3/3/mjes8LtgPr8lexJ3Mvf9lCU8G2dVfYwS6Xww/DIR29bvWQpaZJbRmVYRkPJZCdMAWCyDea0NnEn5Eix5u3P8el7ExpnesfJ+ykt4vN+LK+qQkbFKW3gt3dgX9f5Z8N2mlb3Tu5eLWh24Dmt+hfA9Cs57UyemJMoBVYpLIh+02Xkg6Wyg8h7MNueFjJWuT4qZoMC1QKyBP5r0tK0DTjUGg7jAaHO5d9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiJuhQVAtsgZ9fEJhf0d24U8zrT6o6QAIoAWra0AVSk=;
 b=gdmXThemLslODG6TpdmtksV5R0x9toYLJJr1uDg2HjZ1CfXTD1tZVLlET71nC/2ezu2fR7SOyTzGwRBnbChbHoctqSpPt/lZ1RcrvWydmpc5NKifOI7XzhDG8bp99GCQz+OlFDoev//Zwgvl498LTI5GkoYQdhKF9ZsUAh2WfHc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 23:33:26 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f%5]) with mapi id 15.20.6768.029; Thu, 7 Sep 2023
 23:33:26 +0000
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
Thread-Index: AQHZ3FhJKJr5gUY68kuSvYhFApjTyLAFL1EAgASHkoCAA0Y9AIAAbtcAgAEIgwCAAAESAIABbk8AgAAq0YA=
Date:   Thu, 7 Sep 2023 23:33:26 +0000
Message-ID: <20230907233319.djsrstygwo6vr3yd@synopsys.com>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de>
 <20230906004144.4igr4akglxxqahc3@synopsys.com>
 <ZPgnwlOV1XP82kAY@pengutronix.de>
 <20230906230510.vi7d4wnjeiapgtyk@synopsys.com>
 <20230906230900.tmyhlxomrhsm3kna@synopsys.com>
 <ZPo51EUtBgH+qw44@pengutronix.de>
In-Reply-To: <ZPo51EUtBgH+qw44@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MW4PR12MB6898:EE_
x-ms-office365-filtering-correlation-id: c7458498-6a05-4f0c-6a86-08dbaffad576
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ku6af25uIRvFcfPUwSusXe47QqmRViQ1UgmPxRe2hPLzB1Xshu0cP61jXxzPNWQ+7WlGs1RA1Kw7RwR2MXZqrJWNt+mIGp2kRSHX5Tav249NSoCYDqXZP+c+LoHZA2GKWnmshcXB393fsPjfeXCTSOUjTilQR8lQIIQVz4d5d2V2ZmP8NnBcKgHmNfHuiNqaBn/GMXkBt8q20IwXAlnheFJuJuvrObtzaQJy+BA2elhYeJBgBiivNBg5Jc+r49xSoR3okYqKRlZgcFJnH2CeRPh/+PcM15cefiXtmZ/xOKE8nW9StFOjUUFuKC6Y7xBSaFN2POU2zzRMsyx1WVxwlHZhyLM94IHWBFBwE0P7R+tc1RypHLCzlwMXjsvJWplakebte4gOzXciOFtPRa5aQXtZCQ104HX72wY1jVJBBPeMlPB1v6G5eKXNXPDpdvJePwBxXy/wFW1Ina0UHRun0OnUQEQkTRp/f5Gl+5wmNRiJp6tL0g7nAzF4z7LctQ+krImUapQ/GKx7SE/UrEA2HI+Pqe0pFhVO7SmAUOusWkCi65P3iyxRJWYegGrKnLpOlbQwN4kTk6Hb9yEocAE6LXA+5IU7G426BtpU7RiOzDE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(1800799009)(451199024)(186009)(478600001)(5660300002)(83380400001)(2906002)(6506007)(66476007)(6486002)(64756008)(6916009)(316002)(71200400001)(66446008)(54906003)(66556008)(66946007)(966005)(1076003)(76116006)(26005)(122000001)(41300700001)(8936002)(8676002)(6512007)(4326008)(2616005)(38100700002)(38070700005)(36756003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1M2NTRxYlhTOHB0eVBlMnNzZ2ZtL1ErRUJ0c016MmUzem5VYUR4T1VScDN0?=
 =?utf-8?B?Nis1QVo0UnBtQnpDdXUzWDA2Y2MrTVZwQWxJMThVWnMrWHF0NGRjL0gxRTBV?=
 =?utf-8?B?c1BpMjl5SFppMUk2Y2g2dmUzZXBPeDVzTHNHY3d6Q1Yvem1wV1gwc3dsNUJB?=
 =?utf-8?B?YlJDTXJHeUxJSzdYbkJ5UEFudkxDTklYbVJsTGcrazlaak9JRlJXa1cwaStk?=
 =?utf-8?B?MEk0V2JQM0RpNFY5VmVNK01aeVdFR1lPNHZVOGlzU0ZQd1diakg2UGhFaWZr?=
 =?utf-8?B?UFQzUk1CNC9FSDV2S3Bub1FOUExvRXlNSkpOUHkxaDdIUEpqYTJnekNhU2k5?=
 =?utf-8?B?Wjc3cU5UL3c4TnNQMFY3YVZwTTNmeDl4THg4UVQ1eWRhNk1JRDlSckY1L05Z?=
 =?utf-8?B?VVVlOXB0aEZYWWlmUEl1aXhSSzZ3dDc1S1B0YnQrY0ZlVHNCc2E1NTdYQlVj?=
 =?utf-8?B?am5WYVBOVHE0a2U0UGdlVC9Zbnd6TlFOMGlDZ0tDNWoxVEFaM0ZRbVkyVDNr?=
 =?utf-8?B?Y1FUNTlGcE90UXkzRlc3NGdZL0RUbkl0aGRhNlpkSHdoemNzc05nRmhRdjdZ?=
 =?utf-8?B?bGh2TUNHbEx5aGt6bEp6RzRRU3krTTlXZ0VKUXFCM1FSSXg5eDZkRUxwSy9X?=
 =?utf-8?B?RDd2ZW9VdFZQS2dHb1FtaFp0YVFjSDh6NmhZU0RuRjBmcll1QTdzMHViNG45?=
 =?utf-8?B?bUlzOWRCczNzYmdSUHUwSDRnQjZvRkg5OG1WTytFVlhNNkVhSGF2V05yMHFa?=
 =?utf-8?B?dFI0dW1iZlJYQVltWlB0L3hvRy9xMEVJT2QvWTRJNVdiZUovM1pEeno2Ulp2?=
 =?utf-8?B?bHRWdUlpZU8rei9NRWlQY2thYUc3WTJFRzlSQ0ZsdTdra1l3S2ZjaXBNTnQv?=
 =?utf-8?B?WThrZkNiNjRCc2ZGb2d2SGRLYkwwN2lnMnJXV3c4V1p6MHFWQVArcVJZZTNp?=
 =?utf-8?B?a3FZL0lhY3E5SDNmeUxSUjR2YUF3TUJKS0pWcVJiQU02T1FjOXhJMEVRYmVq?=
 =?utf-8?B?cHBWVmxQaSthVG1ENWtuVURZUTVyZUlTQitSVmlpSjVGMmYyNVlGY3FUVnpU?=
 =?utf-8?B?aVg0NVlwTGZLMTFhSHprTm0vR2d4S3BxTUlyNEhLbWUxQmRMekRON1djeDVw?=
 =?utf-8?B?ZDhkbEYrUnJleHFoalBBTkhNK2NIemdLUU4zbEZnYVVQbHJwWThidUIxSWQw?=
 =?utf-8?B?cnhVZTJybkhtTEFEQ2ZYM0RjRzJCYlQ2d25FaEdkOVM2aWRlcnlxUk9KaCtN?=
 =?utf-8?B?WTkwL2dXbnhsQjdLT3dyOXpBTXNmSVFGMmJ4U2xVQStQalJHd3pYRVErNzZQ?=
 =?utf-8?B?Slg3QTdaaHpmbWlNbFFuVHBSK1EwaVF6MmVCL3ZWSHo0bEhMVDVmWHI1SWNL?=
 =?utf-8?B?RWE1N1ZKK0NTSEZDM3lXQXhBRFdJanRmRklWVjVPR3dXL2IyT1hQMTRVY0dD?=
 =?utf-8?B?N2dMRFpmWHdNdHI1a21QQUtCSWhFZnJDMThreHpuR08yQVJZak5nckpTNE5X?=
 =?utf-8?B?N0pkZDVRSE1aTVhKTklOclpMYmh2U3FXVzJEODVJc2k5WjBZNnpkZXFpWnFr?=
 =?utf-8?B?SlJEUkxSTTRLdEFoV3pCU3ZWUGk3eVB6YjB4SjRRNDF6dlRsbERTdXp3d3hW?=
 =?utf-8?B?K3hJSFJkRlZoRHYwTFg5UHpTSzIyZzVteEJQK1ZoL0luSWNOZW00TVN4Szdl?=
 =?utf-8?B?OWpYNithaWVDVWJYRTJ5WGNnbElETC9mdWR0dzFoN1lpeEt4d3phMC9DMVdx?=
 =?utf-8?B?S3kyd1RKdGl6clRXZzdqVDlmVVZKcERad0pLWHRoS0NRMUlIV2l4cDJFbVB5?=
 =?utf-8?B?NWdYZDFHTlR5dUpHVGtUam9zZHRMeWlvb1lROURqRFY4NStvbEJ6a3UwNzlP?=
 =?utf-8?B?K0xDZ3ozbURNWGZnVWk3NkhZTzFCc1AzR1llZzkxdW54cWNXYXF1ay9lcW0w?=
 =?utf-8?B?OC8vL3RHMUVFS1JBNHg0eGpuVGRyZ2p1dERnV3NpL1o2cThGYUxhc2h5Smtm?=
 =?utf-8?B?RExOZlh4UnNHbS8zVkkrdjRZVERQY3RhQ0hDeHorbFVvZXRGaU5lanVPVTBk?=
 =?utf-8?B?Y3BvY0pkZ2hpczU2Vi9YbWdXMWpicGo4QWYxMHVYL1FiWTF3Lzc4cDd1aU10?=
 =?utf-8?Q?8x3LZuwKRyFmqtCuOXyXJhr72?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE9660F9ADF58D45B2D2C8AC68FC657E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5WP8jlR7FRo3FqWui0cn6m34SXRMhlAVtf4oLij2T3leA3eiRuTS722fCp3h3L9lHOkDDhN+/SWhhoLff551LyjGroOMXIIyhXA6oFqn8DLMRq9EiUBq0FZYhETKSyh6hsnylBgDKStYfvotA0bSbsccdcYbCn+ZzjYLTkBuLPttEnpd0QzoSqy4YdGfVlFl4m6TNul2wCKPMG9478IsfSDnR6ZcyHLyIfSy5SgX8uKuPewUyhqRm4b4248EgnyzgrNNttsB+u3nV8j6fSRSLJOOzvYJQ/k66z65IB0i1layQDnUs+eOZOQuEc8qBiwoxFAkKhF+GRCryVACNdbD3cFH138hL19G61ixpUwTKS0w9R1GOe5W4fNsil9TNrDHf8Tm226OgMpg3nherNyUx77ImTF2VHZajLSeB48hi8Yh6BhkgmSxSlQLxJTymeMItpkyiL9uxTMDnozEjeLvsEiV5D7qiKx6LtFp2VQvX9aZfAdAHBt/ur5D0J0YQ5+A9qc3kZTXubjQ7wx8bLH+b8wfYtJZ9PX6vQSsdwPqs7jMcAaHdERyP5hlR3KVo49B23rjEAB5TbqBqsMwQe/JqkbrpR6kD0KEnDvaAysWJAFny7R/+DpP2OHqN8guAXF3C8jafsNj9NWozGBSaspm48yOKTVnqwc6kyR3h8v3V7xLp5xUspCHvhcZJna6dIBWQSqjU4VfZZ4r+9/+EsoXNuprtWH3/T/B8unvtWQaqF4fiAGgTlhkXHK1CWDnAmgqUhen5WNyx8t548eb943r1R3koo9sEEI/SqsFk63KPgzAq3V/T55m3tc1hUxEd+CYn+Xu9VaStS8JRWS6FfRmhA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7458498-6a05-4f0c-6a86-08dbaffad576
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 23:33:26.1030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ai7FE9hf6QfUnKA2JFwkPDmcYbpjJk+Pt9jE00POGkwLLpQ0WUvIGAxeQ7E/Kqq0xvrW1TnIV+yIk/g/s53Vew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898
X-Proofpoint-ORIG-GUID: Mh5eV3P9qEsPnB3xhpFpy-UTL0DSuos-
X-Proofpoint-GUID: Mh5eV3P9qEsPnB3xhpFpy-UTL0DSuos-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309070208
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBTZXAgMDcsIDIwMjMsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBIaSBUaGlu
aA0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gT24gV2VkLCBTZXAgMDYsIDIw
MjMgYXQgMTE6MDk6MDNQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFdlZCwg
U2VwIDA2LCAyMDIzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiBPbiBXZWQsIFNlcCAwNiwg
MjAyMywgTWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+ID4gMikgQnVy
c3Qgc2V0dGluZw0KPiA+ID4gPiA+IAlJIHRoaW5rIHRoaXMgaXMgc2VsZi1leHBsYWluYXRvcnku
IExhcmdlIGRhdGEgcmVxdWVzdCBuZWVkcw0KPiA+ID4gPiA+IAloaWdoZXIgYnVyc3QuDQo+ID4g
PiA+DQo+ID4gPiA+IEkgd2lsbCBoYXZlIHRvIGZpbmQgb3V0IGlmIHRoZSBidXJzdCBzZXR0aW5n
IGNhbiBiZSBjaGFuZ2VkIG9uIHRoZQ0KPiA+ID4gPiByazM1Njggc29tZWhvdy4gVGhpcyBzb3Vu
ZHMgdmVyeSBsaWtlbHkuDQo+ID4gPiA+DQo+ID4gPiANCj4gPiA+IFRoZSBkd2MzIGRyaXZlciBj
aGVja3MgdGhlIGVuZHBvaW50IGRlc2NyaXB0b3IgZnJvbSB0aGUgVVZDIGZ1bmN0aW9uDQo+ID4g
PiBkcml2ZXIgdG8gc2V0dXAgdGhlIGJ1cnN0LiBTbyBqdXN0IHNldHVwIHRoZSBtYXggMTYgYnVy
c3RzIChvciAxNSBpbiB0aGUNCj4gPiA+IGRlc2NyaXB0b3IpLiBUaGUgZHdjMyBjb250cm9sbGVy
IHN1cHBvcnRzIHRoYXQuIFdoZXRoZXIgdGhlIGhvc3Qgd291bGQNCj4gPiA+IGRvIDE2IGJ1cnN0
cyBpcyBhbm90aGVyIHRoaW5nLiBOb3RlIHRoYXQgdGhlcmUncyBubyAibXVsdCIgc2V0dGluZyBm
b3INCj4gPiA+IFN1cGVyU3BlZWQuDQo+ID4gDQo+ID4gQ2xhcmlmaWNhdGlvbjogbm8gbXVsdCBz
ZXR0aW5nIGZvciB0aGUgZHdjMyBjb250cm9sbGVyIHdoZW4gb3BlcmF0ZSBpbg0KPiA+IFN1cGVy
U3BlZWQuDQo+IA0KPiBJIHdhcyBzb21laG93IG1pc3Rha2VuIGJ5IHRoZSB3b3JkaW5nICJidXJz
dCBzZXR0aW5nIiBhbmQgdGhvdWdodCBvZiB0aGUNCj4gYXhpLWJ1cyBidXJzdCBzZXR0aW5nIHRv
IHRoZSBjb250cm9sbGVyIGluc3RlYWQgb2YgdGhlIHVzYjMgbWF4YnVyc3QNCj4gc2V0dGluZyBh
cyB5b3UgbWVudCBhY3R1YWxseS4NCg0KSSBzZWUuIFlvdSB3ZXJlIHJlZmVycmluZyB0byB0aGUg
YXhpLWJ1cyBidXJzdC4gSWYgeW91ciBwbGF0Zm9ybSB0YWtlcyBhDQpsb25nIHRpbWUgdG8gRE1B
IG91dCB0aGUgZGF0YSwgaXQgd2lsbCBpbXBhY3QgdGhlIHBlcmZvcm1hbmNlIGFsc28uIFlvdQ0K
Y2FuIHBsYXkgYXJvdW5kIHdpdGggR1NCVVNDRkcwIHRvIGVuYWJsZS9yZXN0cmljdCBjZXJ0YWlu
IGJ1cnN0IHNpemVzIHRvDQpzZWUgYW55IGltcHJvdmVtZW50LiBIb3dldmVyLCBJIHdvdWxkIGV4
cGVjdCB0aGUgZGVmYXVsdA0KY29yZUNvbmZpZ3VyYXRpb24gdmFsdWVzIHNob3VsZCBiZSBvcHRp
bWFsIGZvciB5b3VyIHBsYXRmb3JtIGRlc2lnbi4NCg0KPiANCj4gSG93ZXZlci4gVGhpcyBpcyB1
c2VmdWxsIGlucHV0IGFueXdheS4gSSBuZXZlciB0aG91Z2h0IG9mIG1heGltaXppbmcgdGhlDQo+
IGJ1cnN0IGFuZCBwYWNrYWdlc2l6ZSBhbmQgbGV0IHRoZSBob3N0IHNpZGUgbWFrZSB0aGUgZGVj
aXNpb24uDQo+IEJ1dCB3ZSB3aWxsIHByb2JhYmx5IHdpbGwgZWF0IHVwIGEgbG90IG9mIHVzYiBi
YW5kd2lkdGggYnkgZG9pbmcgc28uDQo+IA0KPiBCZWZvcmUgeW91ciBub3RlIEkgd2FzIHNvbWVo
b3cgbWlzdGFrZW4gdGhhdCB0aGUgbWF4cGFja2V0IGFuZCBtYXhidXJzdA0KPiBzaXplIGhhZCB0
byBjb3JyZWxhdGUgd2l0aCB0aGUgYWN0dWFsbHkgdHJhbnNmZXJlZCBkYXRhIHdlIHF1ZXVlIGlu
dG8NCj4gdGhlIGhhcmR3YXJlIHBlciByZXF1ZXN0Lg0KDQpSaWdodC4gVGhlIG1heHBhY2tldCwg
bWF4YnVyc3QsIGFuZCBtdWx0IGxpbWl0IHRoZSBtYXggcmVxdWVzdCBkYXRhDQpsZW5ndGggeW91
IGNhbiBzZW5kLg0KDQo+IA0KPiA+ID4gSSByZWNhbGwgdGhhdCBVVkMgdHJpZXMgdG8gcGFjayBh
IGxvdCBvZiBkYXRhIGluIGEgc2luZ2xlIHJlcXVlc3QuIEFsbA0KPiA+ID4gdGhlIHdoaWxlIHNv
bWUgaW50ZXJ2YWxzIGl0IHdvdWxkIHNlbmQgMC1sZW5ndGggZGF0YSBiZWNhdXNlIG9mIGlkbGUN
Cj4gPiA+IHRpbWUuIEkgd291bGQgc3ByZWFkIHRvIG1vcmUgcmVxdWVzdHMgd2l0aCBhIGxpdHRs
ZSBsZXNzIGRhdGEgdG8gZ2l2ZQ0KPiA+ID4gdGhlIGhvc3QgYSBsaXR0bGUgbW9yZSBicmVhdGhp
bmcgcm9vbSBhbmQgYmFuZHdpZHRoLg0KPiANCj4gVGhlIGhpZ2hlciBsb2FkIHBlciByZXF1ZXN0
IGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IHRoZSB1dmMgZ2FkZ2V0IGlzDQo+IHVzaW5nIHRoZSBt
dWx0aXBsaWVyLCBtYXhwYWNrZXQgYW5kIG1heGJ1cnN0IHBhcmFtZXRlcnMgZm9yIHRoZSBzaXpl
DQo+IGNhbGN1bGF0aW9uIG9mIHRoZSByZXF1ZXN0Lg0KPiANCj4gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJp
dmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y192aWRlby5jI24zMzENCj4gDQo+IFNpbmNlIGl0
IGlzIGNsZWFyIG5vdyB0aGF0IHRob3NlIHBhcmFtZXRlcnMgYXJlIG5vdCBuZWNlc3NhcnkgY291
cGxlZA0KPiBpdCBtYWtlcyB0b3RhbCBzZW5zZSB0byBzcGxpdCB0aGUgcmVxdWVzdHMgaW50byBz
bWFsbGVyIGNodW5rcy4NCj4gDQoNCk9rLg0KDQpCUiwNClRoaW5o
