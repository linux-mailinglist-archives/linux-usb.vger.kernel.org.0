Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4045170CF7D
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 02:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235277AbjEWAjG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 20:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235522AbjEWAbC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 20:31:02 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9910E4F
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 17:22:10 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKoZow017823;
        Mon, 22 May 2023 17:22:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=uEE2U8Yq6G9zqDhEdG0fByusluYnBZ/RSR+sWZPSTWE=;
 b=eCh7pXfcyBfkzhbGMC1vhIXXa0VoG5tY97BYLfyt5vlvR9kdvPCHLufG6hwZg3/iniIQ
 DtJMlaGy1JsOVZJuD75LY6i/16XLvOBIU5MMaEf6AGJjSbsLqARvKED0tWF/sUPNj7zO
 Vt9xDg/xaVTvrxrkNoFnqZKiaBXjY22UldQuPHtRVV3Xuur90N4jbHHl05IpNpG7NKPL
 qkU7xd9H2ui/Qg7g+G9JaiN28iD0hKUMST3aOmxmNqo5/Vo/hJqIFQd43GcdXh5W+xFu
 2HYBCNFzBknx0hXvSFzZnS3PpPw63YZo9i3x94TBpHBIAD70csMsUxAQqyhz0asvkqcb SQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3qpvue9xhy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:22:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801326; bh=uEE2U8Yq6G9zqDhEdG0fByusluYnBZ/RSR+sWZPSTWE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bgiTNbrbQtfoA9OtdrQfSGQe7M9yhvZYW+XkX3l8uSANYffTnSDi/U2nS0DH7ycM+
         FFk/QcBB/q7pvBnx4xHl6jn5mxlHrWmsYo4RRVl+VgLxJM8sUko+/bb5r6SUrSIZB6
         O/Rn/KKjFT434RUAUu8Ba7my+wEeqTedBYnOrIq8FcPKuQWdzgfRhRRuNc/y9/UyVm
         mB3vX7HF2sgt0MsqoehLUc3tDPyq0ddxqZ/8Sk/wHnFTL4BEEGTnMD2SgdUZmjLStv
         wxHl1T7edPKmSo+0wT77TDyMq0vxAD1UFhSe79b99mr/NsYx+UC/KBGDV75iaClxxw
         QiujUH6Etnmmg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3307140638;
        Tue, 23 May 2023 00:22:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C67D4A0083;
        Tue, 23 May 2023 00:22:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JGuPUeWM;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 476A2403EC;
        Tue, 23 May 2023 00:22:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7NnKcy3netXBKFnw0nDgUofITs7Jw7rGUw8NZ8YZPbN4GuvKoJTEAPcxDtb5aF7DzmFrYh85S5adHD6o7coEUNfvSBevU+oLGJltllBonedQTq3PUMrB7dNeIu4EUMr2Q9HAcUPpkorPsQ3tdzMY0Dn/KIr8iEcIIyTsCjvshXDaMItRFv5B30qu2hbtUxJHA3cqmuTdCEKGo0OIRYTcmKp6Ph/IRqfa5/B3443Xo+UWUDWeDr+DV0zBMTiBMy6xMMYf6nrn559pf8SOhnPdxmxDpLv7UjuUCj0NhgwH4KbnCMgU7gEFljBZ6dBCG2BfAcQbBN4kj6RVMlVTO+X1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEE2U8Yq6G9zqDhEdG0fByusluYnBZ/RSR+sWZPSTWE=;
 b=bVHpCCPRDpok0uSGdv7vVknuSQX+2UCpjbD3zL7xJMwcyKB+QAKESfl4p3bc/fdvlqVs+IJx+ur4VNYUHTr9HzdRw2T/Xxv8WeHUpZM9pkPBvq/vkTlxH3H0HFxqGnPULTj8fWibplJMa7e4IHThzaS6FqAI+5+DSfYNNcboahvjqlDSrSILdjU3Z3SZwD7iz92BW8LvNCcCrcDQ2jjDnBaojNTLR3y1YWcOvTLjaHMbjOT2VrLxrGquHqj12F2w0zyzbpkws1Wa047lYhaFJHsq/yXfDLgfL0BWtzSJqMhzxWedSkHeTXt6w89RYbfYOIoZm1JZZowxLuPpghljOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEE2U8Yq6G9zqDhEdG0fByusluYnBZ/RSR+sWZPSTWE=;
 b=JGuPUeWM3cGPQjuLTpNFSTDxFRVB0sIUvkJDUkIQ43iVQuonjlK/Et+A+4ps4K4sau7mcTlWKYfGrCdsgv84pIg4XmcqodiY3QUXZLH9bb4c0QPI+FP6j5A9UbIMIhLmXjq0JTP2mJMdCgZ7pSGImwMb48QMrqXRo03CqgFJesc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:22:02 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:22:01 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 18/97] usb: dwc3-of-simple: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 18/97] usb: dwc3-of-simple: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRO2lC9PtDniV0mpVZ8FpQvWYK9nBwGA
Date:   Tue, 23 May 2023 00:22:01 +0000
Message-ID: <20230523002155.6blarvtxusglmz5d@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-19-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-19-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: bb369880-1fd0-48a4-0199-08db5b23baba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ys5Yb+NpSxykM54iNcm+D/1+F1rfPC9MkhbCPvaR4OSIXQfz2dcyMI9yeluVUpVoEZuTj1dwFdH7qMFFnCj+I80sHK1m7dV6qYiBJKqX/wP/NDUzB/WKkshos/TSPIq8jH364+WOWFPzdu+PgXDGZNkJ9LZxKFw0CwdnqP/fB9c7va8rKoqT+D/CJQNzdRJq3Z0/SwE6os8611w1P78psxFyGwW+McjnCYEFXHJ9i+sxAzXd/oX6bkN6BKMCmXHYwYY29eN9YDSYHt5bLgr5T2uIV1sCTuraVQK2IHXqNuGCq4/LoQU4p0LydFGX2Xr7YxzDn7Bg3O//MglrwJB5HnuzBzC2MgZbkU2hAj6MP/zVUtjK10b01/rI0ox5zy7/K1Y4RRtQY8u9E4tj45T0xjJvdWuDaSsJ5CuOSFHpm9IKlMbn5SZEi+rfeAZHYo1RAMwLxbHzj4TyNIbeOXQ6+eSrfuyiOAHqwEq09fWNwY82Nx0jO2CJIY3HYpKX2g0ABmAWsBz1cfOgE5s9dkSE0+Qupyo4HDT4i1bWKRkTnGbzu8LrU5dPR8wD3KFmabOI4Ruati3PqYnIJ/0e/iEWiXXzZ05YabqY/6gz97BPLde/y85vq/oBnTyGsSkiRpbn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1phdkZYK01xcXdkQXBwcEI0L0V1Ulk0endvSDNQZkNqZExZbnJRT2E2VE96?=
 =?utf-8?B?c3Fzd012bThLRDBXQzdVdzRhQmVxNGpZSjNTalVqSzNaUFpoTEkzU0VKeFBy?=
 =?utf-8?B?Rmx6eEhxaFA4ZFZqZ0J3azVzSTdoNUxHSFF1R3o1UW4yTGQ2RkFoUXNmS1E1?=
 =?utf-8?B?YlFPbjdGcmVKQ3ZNMzl5VTVpbytYWE5SeEd1K05FTy9KUlUyTDhqZ1g1V05K?=
 =?utf-8?B?QjNoZjFhQXFaK3Y3YmJjS2JxblYrY1FUdy85V2dGc3NPTStKQWl3YUZubXBt?=
 =?utf-8?B?VHNFSDVObkpZaDkyUEZ3K0JLeUpySlptR1ZBSzFYYmJzRlJxOWxSRDFSYlJP?=
 =?utf-8?B?TTdqV3NLeERmTGlTRjF1Z0VZd1JSUExOQUlUa2xqU0Y5Tm1OalFGMHU5b1lG?=
 =?utf-8?B?VVZ0bnZFZUN6MHlWZ0padUhYQm1vSnN0QkJmVnlYdnJsbUs2dWh3Rm5CTXpF?=
 =?utf-8?B?S1U2SzV6MDd3andjU0Uya0p3T1J3UDdSa2NJT25mekFTWHRrbkc5S2EwVUp5?=
 =?utf-8?B?SVVWYnhQR2U2c0UrNXRFUFMzZUdKN0tCaFc2NXM1eEFyTDVtK29Ia1pKb3lT?=
 =?utf-8?B?YlhISVhjdUFHbEY2QWFFMkZaSHc1ak1LMXRIT0JMbXRCbGJjeno5emVjWk15?=
 =?utf-8?B?cEZtQ1Q0OTRnVWI5akNHbFRqOG9UbzVFU2Ivb2JsN0JXQ0NKSlpvLzFUcDky?=
 =?utf-8?B?a2xnK3dSN3pSV2xYZmcrRGwxeE1HY0xKYm9lb3pNSHpNV3BiTmlQdUlMUzJQ?=
 =?utf-8?B?UWhVVXFSeW9jdXZwcVJTN28rNzk2V0hLWHRvWVdXUkZuMU9RbDVPUVNsNjFM?=
 =?utf-8?B?Rm00dlFyWGJwRHBmelBMUk1VdUJYR0J2WmNzQjFsemZ0LzRyY05uY0FONzhH?=
 =?utf-8?B?WnI1SnBteFRVQmxHbElhOGdEblF0N1pmNUo0eFhxR2l5L05SSWpzWDFqWXp3?=
 =?utf-8?B?czV1ajlWbm55WUkzRHBEVXl5cmFQWDlQZVo0MFBHK2dMZXg3aXNMTG9RSzht?=
 =?utf-8?B?K1RKNlVUTy9JSFdpaktqdEtHeHVvZlVhNUM0bDVseHBXc0pHR3VOS3dWazl4?=
 =?utf-8?B?VDNaV2FTL3VmbHJkOWNZYjhVcm1RSm5jN3VxWXk5aURIYk1FcjdNZzdXNlda?=
 =?utf-8?B?WGNXVWFYSEdqWW81d1docTYxODRHTmRxc0FMRWNNRjhqZWhYZTFJQWlPV1dB?=
 =?utf-8?B?ajlIK0lzK0RiQ0UyL1ZtWklFeDFkZCtNRFNuSTZYVUFaQkNvckZNMEtJYVVl?=
 =?utf-8?B?R0RrRkw3Yi9NbVlOcWlLWkJtZEpDN0NpcUp1dVRHT1VsbkQzUnVGRVNnRDgv?=
 =?utf-8?B?UWlpUk05Sk9DREpSNlNyckZVb0hwVENaSndiU052M2dwSGtJNGltQkE2aFpG?=
 =?utf-8?B?MDRiUlZMeEVON0pUYzRFOFVJa252dTlqSXNHS0ptWnFLblRyNW0wYzFuN0s2?=
 =?utf-8?B?bnFPb3Y0UlV5ZXVGbktOMVcrMExzT0VpcHNuZmNPWmZ1K3MvY0dLOFhMVTRr?=
 =?utf-8?B?aTNrc0liTlpXcTJtU0c2bXVhL0ZnK0NySmJxZnd4SEVoUVY3TVdyRm1CbWJq?=
 =?utf-8?B?VTRKdGVuWXRHYmJWampSYzRTUTlBU1pxd1VrUFdzbUFzOXZsUUxMZ28wd043?=
 =?utf-8?B?eDQ0Y1k0Szc2ODZSV1pDblpkeDcwdDZ2c2ZMdW5pTldxbGZXOWhSb2xwOHZm?=
 =?utf-8?B?cWtXaHVuYlB1aTJKU3A5MTNVOW15K0ZXZG1XU1ovd0JUV3ZEWTI4U3RnM2dQ?=
 =?utf-8?B?UkJpZHZPQWxWSEZqYm80aTlvYUpxTDB0NHBNQU1IZldxeDNHWllqaEVlODNp?=
 =?utf-8?B?bG9sUnM5REZZZ2NHTWE0dExiR2tCcHRIc2puR3F6RjhDWll2UWF4dEFzREIy?=
 =?utf-8?B?eEdrNWprOHk5RDRnYTA2UkdZZlM0VzNSaHAzaEtSRDZqQitYNjJGMDhsRmFR?=
 =?utf-8?B?TXIrSVFFYTNFRTRLNmFrcC83RnhXMEdZVFhDc2M1YXdTWWY5TCtMbE52eVVz?=
 =?utf-8?B?aG8rRi9jZFdoaDRWcFFVUFZIbnh3VkgvRjNwb3pFSWtMMTN2aUw2cFZGNHMz?=
 =?utf-8?B?dXZyTlh2NWtpd29PUFJQbCtya2NEeDNGYUZHK2pENk54QjVoZmlUeFd0Z1Er?=
 =?utf-8?B?c0h0TGZua043aE50aFo2QlRuSm1RUkczb0Y1NnM0bSs3S3VWMHJZY0dLWkYz?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53E58AE3D9885D4BA2C90F1D51D41731@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 63VnlBjENKEOvBu9h0xD/knv5qSuPHm1TQ0y5oLutsrPVBK/8QxOMsJzT2DJlsIYj+Et0lFwhgRmAWoH68CTng7157qSw4RcDkjJDGVBDKnAjNEQL3LYkb3YvTszBtHfXFQj7TKJMi1jQZOGFKR+f7FgUau8giMCS2cY4TGtukiXciFz9iHddOyoL/dV4EzqW3k5oCHGrzxAs++x58rH8dmZ+51xnvlm7gv8gdnA7rOL7Iroj2zsrBfV9NXf5KTJu8QJJNrKo+qIxtAmnmTXNOlAr7PcIuoB0XC+mGM2L+2MYQ/yrVuzMly74wSvarE5wNEmcUG+f6123W0r6TbO9HUBCLkuBRhwCnQ79IAM9zJdIr4Y0Oc/X2q0kbFRWo9JKhQyF5+tIV4OJCiB78oPq17KqBxnRbfCRqcd8+V9pndGyHMZ1OO3AP11PiZi5hAR9Sv+CLW5jDRxd8qCMx4M26hbEuYW9vfUA3Vyn0SZ6aTOTfSu/bzPP9fa1C5KhwprZa5ww/TlU96LeiywxSTlL7mJ/obEZ3wP701Amr69dMCZ9c7tkni8wu08wTKlzDsInDRyNJbJfyxmi4LmgepN2SUruhmVAXlpLWe1t5FO5CJxcx2ZM+cDumXFLJTF7ipOIqkjQb9/DMqtCc8cAKAG4eFX9eNjl/36jfVdJPXBbOjAJHt1ljiM3zGzeF2scMnaUNLPdYGAfpFfb+9NNogoHicIlxpRT4xfOmxIa5+mQzIprYGFDkORZFWz3OWS1/ff7eX/fN23DyOTEcczmNNRUmGORStcRqeN3cwEIXnb59Z2tvgoSnc+a6CPcZ0lFMevM75LNomUgP70PtDC1mMEW0iGRIUWcfm3GqXJl9iKGkxaz2eanw3sUQzHA7n+1Uad+IRlJysmSDx32v3vyayg/A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb369880-1fd0-48a4-0199-08db5b23baba
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:22:01.7256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kHptssTW2pvgSWPx16G3I66kfYWIvvby0N5iwGbQpXmRRM9G9Yl6g+qmYUFInYIQCrY5Ybvt6FuQTp3+owW6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-ORIG-GUID: Dpnsx3Mfjdc5lT9E_WGsLz1DIjUXy_ep
X-Proofpoint-GUID: Dpnsx3Mfjdc5lT9E_WGsLz1DIjUXy_ep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXkgMTgsIDIwMjMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2li
bGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhv
d2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1pdHRp
bmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFr
cy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3Zl
IGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1ZXN0
IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5
DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29udmVy
dGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLW9mLXNpbXBsZS5j
IHwgNiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9mLXNpbXBs
ZS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9mLXNpbXBsZS5jDQo+IGluZGV4IDcxZmQ2MjBj
NTE2MS4uN2U2YWQ4ZmU2MWE1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMt
b2Ytc2ltcGxlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9mLXNpbXBsZS5jDQo+
IEBAIC0xMTIsMTMgKzExMiwxMSBAQCBzdGF0aWMgdm9pZCBfX2R3YzNfb2Zfc2ltcGxlX3RlYXJk
b3duKHN0cnVjdCBkd2MzX29mX3NpbXBsZSAqc2ltcGxlKQ0KPiAgCXBtX3J1bnRpbWVfc2V0X3N1
c3BlbmRlZChzaW1wbGUtPmRldik7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM19vZl9z
aW1wbGVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9p
ZCBkd2MzX29mX3NpbXBsZV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
IHsNCj4gIAlzdHJ1Y3QgZHdjM19vZl9zaW1wbGUJKnNpbXBsZSA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOw0KPiAgDQo+ICAJX19kd2MzX29mX3NpbXBsZV90ZWFyZG93bihzaW1wbGUpOw0K
PiAtDQo+IC0JcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGR3YzNfb2Zfc2lt
cGxlX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IEBAIC0xODMsNyAr
MTgxLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgb2ZfZHdjM19zaW1wbGVfbWF0Y2gpOw0K
PiAgDQo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBkd2MzX29mX3NpbXBsZV9kcml2
ZXIgPSB7DQo+ICAJLnByb2JlCQk9IGR3YzNfb2Zfc2ltcGxlX3Byb2JlLA0KPiAtCS5yZW1vdmUJ
CT0gZHdjM19vZl9zaW1wbGVfcmVtb3ZlLA0KPiArCS5yZW1vdmVfbmV3CT0gZHdjM19vZl9zaW1w
bGVfcmVtb3ZlLA0KPiAgCS5zaHV0ZG93bgk9IGR3YzNfb2Zfc2ltcGxlX3NodXRkb3duLA0KPiAg
CS5kcml2ZXIJCT0gew0KPiAgCQkubmFtZQk9ICJkd2MzLW9mLXNpbXBsZSIsDQo+IC0tIA0KPiAy
LjM5LjINCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+DQoNClRoYW5rcywNClRoaW5o
