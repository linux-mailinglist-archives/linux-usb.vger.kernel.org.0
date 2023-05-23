Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B74870CF7E
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 02:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235368AbjEWAju (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 20:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbjEWAYp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 20:24:45 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A0B100
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 17:12:14 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKoeb2017869;
        Mon, 22 May 2023 17:12:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=ln01b88laYunnsyJEL/3wk1F+kcpVRFRwrKUYdoD97M=;
 b=dL7tzUp+YbpR606AiuP2REEAKm29pmLmjwnWb0DCqN/Ew8nWpb5kBgtZ+9qZn1+TXTt/
 1zb+tx+/9RplC0WOwttU8A/RkHukdqQEkUbzAKvtMdw5Wje2wPpn7ANPVauI4ZMKIS1L
 sSFdZ/+7WMr4n37mvuLcAnZE9f3ckCPk9dts23l3CVywOjSQ14KXC9sUuAYAxi9o5qqp
 ibIgeYuXkGbwWchMVr95GK571/Vl98sTEj3vo+hZR1eOkI1ipXZPbhMstCz4yyOqrOzA
 3BI6wI3x2T8NrjNR15yY2Q653cPwG1JAwvcBfIbL1SrBEvB20CTicB3PS3PhQux69oAy 7Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3qpvue9wjh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:12:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684800727; bh=ln01b88laYunnsyJEL/3wk1F+kcpVRFRwrKUYdoD97M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XoT1dMNj7Qg+tiJBg9LCxf219Mou5SVLDWzh/uRkrTDLUXpHMvj1vEx7S4htWX9FF
         x+0xvssITMeA9G3HvjK2/D+20r7fWoNcXlIyzelkF6Rb+mbZK5r4g3LVB4TbWl2XPd
         g2lG4+TCMEOTleyMtAR3Ijm6IF3r0q/+OZz3Q55VQBFtcGlE/GyzXfElrcqRNWVD3q
         G+BLrlsyctD7DUgolZmSQdq8UMpmWX9caKpeV9TE0QVG9jQLy5RVUlUXb5Eov3rp/e
         0VMDUokTho8yBX57TLnSZ9PADImXkBE/9CNmjudVyFQfOdLOeYA7uZqBeI7rzexjpn
         y+HjYAPdKe4Gw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3B89E403EC;
        Tue, 23 May 2023 00:12:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3DB7FA006F;
        Tue, 23 May 2023 00:12:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Sb83l6vf;
        dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 23EB3405C9;
        Tue, 23 May 2023 00:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=minxCD3Gs+HcBW3fPUz8t3SdAPL9ER7FR3cCfA4EkiQKSV0L0X3ENZabs8tQRXYgJJw7fHKFyvVloiZTwbb/lwQRsFV09be1LI72+YkoCwk8gY4dz3sUfZNGlz5MQAVFJne7Th+6VRy5wUCrjxCQDjOynOGi37tsGneO6LdzcVNRhdqzBigo0deqUeyKbrjSlaQ3bJztZg09ZJTYIVydTEaAtBBPuZuQoDBtHvDjO622upms8gPs72Vn6va9amBG0vnn9h9tKYd97U4fDEMq7LG6PrbDj8OcLZKSHdXb4mLkR21RssLSN+mqJ+HxOrt6scVgr+qebVFtIgh0k2KN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ln01b88laYunnsyJEL/3wk1F+kcpVRFRwrKUYdoD97M=;
 b=dCQap1Dke/QTu2LI0hEHw9Ec+EUVHr+w2MPTYTea4FMwRAXkdxnyICi8rEIAJNMWGf/TGmV2VYslQDOvq4iMMtM7pycvQdxlf+F8ssp+TGmK6O0HK4Y1NQbmu3bdGAVfx0bwNEANt+bM8hsKAtIGakIuwvKhYnNPuEjDnEg+0AxUCIeXuHjm/QM+fe+6vvNUM6fIJUb5O5rgIzxohE7PCTM9hvKk3lHgiKj49B8vEiN6Vvyxj+Vtr3+5trve0lcTm1eNHG4G49xO1Z+A/4V57aasUlSnRSe/gJ0B+vlUjAtXDfZOUrn0TGOQX5poPk+V9HAJcZUyV60vbHj3JHyG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ln01b88laYunnsyJEL/3wk1F+kcpVRFRwrKUYdoD97M=;
 b=Sb83l6vfJjiC+6jJwdjt+8/odiSEWQNGMY/m1VLh5/x/CFxrlhrmRXL4QBwTQ9w41tIPS3M9Jms/zdmIi11oe7NJAdDeNyL0F6KmfDLhDBU82fucJQ1IYEO7X7SnPB3UBM7kLhU1Up3gQ7R1LSTnD7Lxl531l2JF+KdCAO3Mqa4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CY8PR12MB9034.namprd12.prod.outlook.com (2603:10b6:930:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:12:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:12:00 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 12/97] usb: core: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 12/97] usb: core: Convert to platform remove callback
 returning void
Thread-Index: AQHZiRO24knCtXCYhEKtKelr/phmM69nBDQA
Date:   Tue, 23 May 2023 00:12:00 +0000
Message-ID: <20230523001154.ehwbz6o3s4zyxmq2@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-13-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-13-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CY8PR12MB9034:EE_
x-ms-office365-filtering-correlation-id: 76fc9206-f39a-4bd9-01f8-08db5b22546f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hgtCZ19w0SOaCyjF3tojvRudLJlc8Jh+musYRYaYzad5AqlMgHVhY2igyyJlVVrCsmNNuQ+UUF1D9qgdOy48uDKU40F6KXkWjSmb7accCnLuDZLJE9YTFqJQUd1NoSAJBeGGHzHPsZtRoM0ugXARsEFO/aZQxn614DHpGGvUFlE7TkSQenSM4IV7dLEJVCRgCkVuW0ENV9JHT6K3P14y84Zp7l0qzcAIxEss1cZmS/bLMG89lQDNt261OkGFNJ16zLV91hW9EWrAkys4fBMIl6eojWQviTicsATc0D+bi/SR3oNjSuyHEmdvyYAWs1EpWalUYSmRQeawGDYiJHNkVvGeV8ZIkCfZa4M194lbPcq44zMiYk1RlcweYK+59AnBL8+gU8JWaJ+hMIcWRqZu5QJ9p0t3cenQTOw+rGJr46fShbshNB7+110pydtxoQ223S/sQZauN6bgeT4rACrhJN9+spHVXdw4V7s60BtG7EjY45Uvq6IBaf/w6QwlRjbf4DOTe1XlqKO6g2E40eNziH0oMHKM5Zi/bocDn/0/b4C+dFlZRUdrUaoe2chZyMeDBSULSzDqa0EkuPK7f4VveThIvBV9b+RrG9Le9130xfFAZeEoS3XQMNfnnYNoJhlF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66556008)(66476007)(66446008)(4326008)(6916009)(64756008)(66946007)(76116006)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVA4Vmh0WEZIZytxVUpTUjRHWFpiU05kK3B1MXVpbnNhU0J6SnJwemZHeFpX?=
 =?utf-8?B?U0pGUFIyNmJETjJ1Nk1FMENGQ1k1aEN5K21Vb1doWlJhY3F5a1BlMUVSUU9s?=
 =?utf-8?B?aGhhdnplVDk1dWVqYmZ4OU01eVJlN2YwTVlzYjlCNjRYOExqSjcvajVSUDRL?=
 =?utf-8?B?Wit1UkRUbjNvZHQ1aGsxQ3RJeEF5QUpBZ0kySjNGMk1HL1hjTi9IS0loUk83?=
 =?utf-8?B?ZzYwZit3dU5zU1dPNDdtM1RxVjFMOUtSNGx4dVU2RWhvQkZzbHNMaE1IM0Za?=
 =?utf-8?B?NGhsdDBKYkFjYTdnbndxbkpieVFzTGNoWHhaTmpweHVoT1RMejljcW11Zjdj?=
 =?utf-8?B?M0ZOMlgycC9QelRIL2NDa01tWHpmYnJhTExTNDdGaUs4aW81anJ3M1k2ZTJw?=
 =?utf-8?B?YmN6UmRML3pJMjhIcC9hQUluK2l3NE1PM05ud0g3SzI5UjRNL3AyeUVBR2hh?=
 =?utf-8?B?ajY5S2owMHVaZkYzYUEwTU43OVZEQ3l2eVRYUHBxckJLQWc1UDNmeHJNMWV1?=
 =?utf-8?B?SVN0MytoM0c0ZkwrMFNDZUk0UU1zVkNNZWt2S2J1cEQ1MXZMNCtJNDJwNjdZ?=
 =?utf-8?B?L3hVaGN0N2RmNkp1eWFQVHJLWHcxbTNFVXk0Nkg0TDhZZEZXK21ZUFFJa0lv?=
 =?utf-8?B?UmdkWmRmTVloWGtNY1JWMzBQMmVwUXRLV1FiTjhsNTBoc1grbEhxMVd5dUFt?=
 =?utf-8?B?WXprYW41L0Zwblljc0Zsb2libFR4U0NwaHNGKzF0dFpkbXY0VWdtY3krTUJJ?=
 =?utf-8?B?TC84NnkzdGEyamlZaExVVDZQZEFmT3FHb08rckhBV2lZYjl4SHdkUlhISkxr?=
 =?utf-8?B?VjY5OVJBamgwcm1EQnNFYXkraHhXdmo3OHNuS3I1TEY2YnJHRDkrT2ZEaFh6?=
 =?utf-8?B?amNaZTM1QUNudVRBSy9OZ0wxeGhPQjY4MDRJQThKRGVhcEpmMDdySXBRSDRa?=
 =?utf-8?B?WWZGaW9EaFhOcDd2S0RhTllQZmcvdWh4UE82NElEVWpMZTlTbDRWeEhLN0FN?=
 =?utf-8?B?N050MWJQMi9nencvNW9sZVM1SzVMOFNqZldMK1YwQjN0aXI0SVBmNkE5bFMv?=
 =?utf-8?B?c1VDZS9GdE1VR1lBdG5PTEJCN2Fwd3hBcytvNGkzdSsva1NTZjA1QjZERkN2?=
 =?utf-8?B?UFdRajhRdmhMYXg2bjVsak5IRkp3YXZIdW1lTEpYMWJNb3Bsc2YvYUg4S0Vh?=
 =?utf-8?B?WFRsdjllUXVkS0hzNkNoZHlvbnZwa0w0eW03eUlQM1pscHJYU3laSmVFUzV1?=
 =?utf-8?B?NkFMclQ3WHhNQTJXLzViTThQQjRrNnVJMFVreHM4YXpLMUIvTW1HY2xYK01C?=
 =?utf-8?B?dTRLZkw0dVJpR0FmSHE5YU5zQUl1eU9zZnM1azZaeEFmblVVRGJZb1ZGeGVn?=
 =?utf-8?B?TitraTNIWFJMMk1EdGhsdFJIbXBCN0tZdG1MQm9DUllXMGtHc1FpajAvZnA4?=
 =?utf-8?B?MnRCWU9wcnpOdWpnOGNpcU0venhQSzJMZkxFeTdVamFGRXVoaW9Ybi9neVBR?=
 =?utf-8?B?Z0pxS0QwaUxXbURiWmNjL3FQT1lrenl5RDl2aDMwbjFBaEt5cElXL0pmUFJw?=
 =?utf-8?B?c0RwakVwSzFXOG14dFlDS3pGalJaVGZQcW1OcXJxQU9PM3pnRTZEcU1WcUFV?=
 =?utf-8?B?bk5WaUxscW9RMzFrM2VGMnZUdHNwQ2JhdlpuTy9uTlpqL2k2RG5QSDZlVCt1?=
 =?utf-8?B?cnJ1a0kwZFBmaXZOb1JhNmIxV3F6NTF5ZStZUkVpOERuQnJVQTZBVkdZY2Ry?=
 =?utf-8?B?MWd5bWhWbk51T0dQUWJlUCtYUGttWG5IeG03b3Z3ckFkcDcvM2Iwdzlic1Js?=
 =?utf-8?B?M2VxN1dMQXNZUnVFMWw0OG9JZnRhV1ZjdFJuelRTVGVDemMwUUd0b3UzWTlU?=
 =?utf-8?B?U0lnNUNJU2VaMjdVNjIvd1lTVEZtSDlTKzlQcUVBRHM1SXJ4Q1QzWndhNFFC?=
 =?utf-8?B?Szhyb3YzNzVGU2xUVFJOWTlIU1lSRTVaVmpTOURFekE0UytRSk9SUDR4NmRD?=
 =?utf-8?B?QUVBbE9SdStkYko4Vmk0cERwV0R5ZVhkOFVJbGErQXh3WC9UaW1nckFPaU5j?=
 =?utf-8?B?YzdSazczYnhwMURFU2xvS3Y2TnMyeSsreXp3bnZVcDZVcnoyZURWV2pTTHdl?=
 =?utf-8?Q?noK4rF36QolYzYooHotoHcxYe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE49B84C7A81F649B8E84012CFCB66DD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MguJ7I7gv5V7xHRH0rW1hfQwY2dijI1CGFfJC1yrhOKLWNl8FTLx4oE2ASiepBSVEIx/eqXSGihL3EknXH1vdQ30D4/vrCY0dfMjk72xv6qCEnyKhUZqzndJ5LdavEme/lFpqTCPdWZTKvu2ua2XdpzD8hdwaue7Whf6uA+HBLetJHhTFXsuGkhGjBFuH1y8QzXa31SoXIFHnGS5nwKDVCp9UKTYpcAKJCBb69wLub6XjyYt1NGXApVs+hfUE6VGWcJAlmrhJZUztn/fzy65TksS469jYDfEPmwjuAilVewq10QYIhq0wtpfNSJFpjtZgU8olOvQmCVaMWZQz5OaDvxs0wKy3wKx894E1opWvn6Q4+RAFyRASgaDp4dVbQyQjwh0fKC9Ab2mmgNyKUJf1X6Ge+XK9anwnt8DojbHIlUucCjUly3cnnergZpImQ1jLteN/t/OS9E4iW/POyyTMgaD7SFnnTiIjyZ/MTPEddmW/G5APrdFImpuabh7bp9UVctSeSupvWqAo7M189uxH/CDKW7nnGZUNHFYulgxf3QDdLxR3Fqtibn7MzAV/YFbz2T/TETgf7b/IQh9bLUfFHjK9fHPvWFKszFgxIcN7zOE+2tYsspD3n+e84/Nnf/mFT/I84nl04qbnBUOlVtrDX8/83cOuUqzJ8AyBFoWUlwLyvU6Xrko2AGU4K5NHCYyjh6x906fvOwcZmQ3+GgsHZfIn9HDTLY7jJBuTC/LMCBn7v3gi+PDLzwCUXUh1cxTRKtWckUZikKX/l0gOCKMTxUKroAXBnGpbZ7MCV+Fs163f3CC/KfcDlbeV2GaZOD+aGYycG+iIv7xa3S1n4NqPF+rQj8mZ0bg0YHVyE/YlRd//KSvBlM7ItpuT6J8PJ3ZXYVADO2V3Xanm0YqXYIWZA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fc9206-f39a-4bd9-01f8-08db5b22546f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:12:00.6362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jwounoc/pSGIMLYJ+I81LfCsZnhOcDSkvKwHql8WrpmtIFmMdq7JnZBSfFfX5HZHG4oaXZEtEWuXa525PgzxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9034
X-Proofpoint-ORIG-GUID: VVi-9z6LYY-OcapgYxT3MwShPx9_qKvZ
X-Proofpoint-GUID: VVi-9z6LYY-OcapgYxT3MwShPx9_qKvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305220204
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
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCA2ICsrLS0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jDQo+IGluZGV4IDBiZWFhYjkzMmU3ZC4uY2QzMTI2NjcyMzA2IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuYw0KPiBAQCAtMTkxMyw3ICsxOTEzLDcgQEAgc3RhdGljIGludCBkd2MzX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gIA0KPiAt
c3RhdGljIGludCBkd2MzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAr
c3RhdGljIHZvaWQgZHdjM19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
IHsNCj4gIAlzdHJ1Y3QgZHdjMwkqZHdjID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+
ICANCj4gQEAgLTE5MzUsOCArMTkzNSw2IEBAIHN0YXRpYyBpbnQgZHdjM19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIA0KPiAgCWlmIChkd2MtPnVzYl9wc3kpDQo+ICAJ
CXBvd2VyX3N1cHBseV9wdXQoZHdjLT51c2JfcHN5KTsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiAg
fQ0KPiAgDQo+ICAjaWZkZWYgQ09ORklHX1BNDQo+IEBAIC0yMjQ3LDcgKzIyNDUsNyBAQCBNT0RV
TEVfREVWSUNFX1RBQkxFKGFjcGksIGR3YzNfYWNwaV9tYXRjaCk7DQo+ICANCj4gIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGR3YzNfZHJpdmVyID0gew0KPiAgCS5wcm9iZQkJPSBkd2Mz
X3Byb2JlLA0KPiAtCS5yZW1vdmUJCT0gZHdjM19yZW1vdmUsDQo+ICsJLnJlbW92ZV9uZXcJPSBk
d2MzX3JlbW92ZSwNCj4gIAkuZHJpdmVyCQk9IHsNCj4gIAkJLm5hbWUJPSAiZHdjMyIsDQo+ICAJ
CS5vZl9tYXRjaF90YWJsZQk9IG9mX21hdGNoX3B0cihvZl9kd2MzX21hdGNoKSwNCj4gLS0gDQo+
IDIuMzkuMg0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9w
c3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
