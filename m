Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8273070CF6E
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 02:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbjEWAj0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 20:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235517AbjEWAbC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 20:31:02 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A27E4D
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 17:22:00 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKnUNX011542;
        Mon, 22 May 2023 17:21:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=k1ZCDQNq4npJeoU1L2RTSIA8Ho3Fah8gdR1LIlSy1fE=;
 b=rfwVUQfEE2J5OlY+lR11McwTQw/NWw9lsuOBJZDP0osi9gx5T272uUgPWGxwFkApA0hG
 bpLX4oMDbs1Le9vMWsiTq5aqNrC6qHzZwftIxwAeC9G4k4mINgYaLg68nHbkci4Hi4jf
 gRtD3l3I2MtQRgf8jRfSfogUAFBdr01P9uUcvSLk4aki+pNg72xOmRAYdVxCtvRaR0sB
 sIJtTdgafKhCNdnFZKF715+FRs+IHZ14d0MEcVwJtbbsTKqVP72d7FCe16K1AeufhIKp
 P4t7F7GzcE5qhPfCSYj44pk+KqTfKOjKBAyvxXe+OboUOzB/4YOGe7wrOSUSZbpy09kl Hw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qpwf4rtpk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:21:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801310; bh=k1ZCDQNq4npJeoU1L2RTSIA8Ho3Fah8gdR1LIlSy1fE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YY0B5Vd3q2qG5beGsulLGYLoVp93t4QH16i3vy6KXYwmCGYVPKb1S3sHDYk6Oincl
         e2t1tMT+fN/wH0+QUg8mlmnU9QRXp9yFA8qnmMw4LvK8oi0PiSuIZokmNdBxa3kblQ
         ry/TD0ZzkE+5WLo19GEk0ta59PwwLUOF3yOFdpL/KypNXjycohFs21p8QMxSqTxn0e
         dXxAk7BW7RV+1e1S5sjEXVAY9GhFSkNBrCmplMxvTHR6UtuTJqyaeVbGbeGp9BlM3f
         ZYb+6RLFZBOJNTfbAJVtpPtU/EoZf42o4NmC5qs5USZ8nC0g3X7CkjD87zh+PienXE
         JvlQOe6ZYv2Jw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 48CEC40523;
        Tue, 23 May 2023 00:21:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 71E56A007F;
        Tue, 23 May 2023 00:21:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Pptfsj8C;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 79F1E40360;
        Tue, 23 May 2023 00:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQFC7Nrp95qx170au/nsIM8H4p+ZgFQo6OJgRrDTnioUqJrLW/8su8I7ZrQZExPsVkmHinKtU9GopC3lukljnkKu7rscGj+2PHfur5C06atZW2u1hUAGZhmhj9G8o+sCnSsjF2zVKd4rxZPXM74FkTU6jlCL2R5ziK4NXFRv49VIss6xWw15LdFmlfGezS9ChY0ugedCNMVNs8ADB3CA7TcQGDPA6yxjiyUNujs79Jho5rETUeNFoucAwYG6FBY4bXARy4BP7m2WeydxXXqtaI9vYXpH4hO4vqnps3Ym7zz5DR78lupt+kQ5fD+5Fq4BmN61XJBTWrNFL4yQQ1gKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1ZCDQNq4npJeoU1L2RTSIA8Ho3Fah8gdR1LIlSy1fE=;
 b=g242L+DSYirXMbA/BmkaaGzabBT1RqG1VoPXQVlH++i+44rbaeiffjom3gziMMnFvhfMzHrit3EVobNUGih2vBTLUOp1HxFhC4WnNfvhOkU/plpXzLkyyVeXmKmTo0jmtFQGdY0OzbsIasDB5q/0lXHC875n6CjlcXLZHswpBgUcpbbB8z7tUWWH9LoEIJcsQfn0wxbPWh3T0FBr2BFyTZLN+9mVqC/OQu/Dth1A0XxbFqN6cpQCdKUNffzQjSj2jiCddn9bzB0GOqIhg2T/SdRC5pDOw9oj8Ofgy9kfg5IykK45z/3ZUV/o9RzenQmEonX66YW2AFV0m+T23pCN3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1ZCDQNq4npJeoU1L2RTSIA8Ho3Fah8gdR1LIlSy1fE=;
 b=Pptfsj8CNY+nRwuSU/5zcZRuSadMD9fyrbFpQlYmmUCZNxD+SzA6tBxlqU//mkGhkcnIRqUp1V/IMdDckG9fjvcrWpigq7yHko0m2UBnszwajuFGSfYKAMSN0a9m3LrnzAFDSLiV6FNDafS3XxQnMUdirOBiCqahzcVmlzDInhY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:21:43 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:21:43 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 17/97] usb: dwc3-meson-g12a: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 17/97] usb: dwc3-meson-g12a: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRO2zm/d4KlfeEOk1D+8o8L6Ca9nBuoA
Date:   Tue, 23 May 2023 00:21:43 +0000
Message-ID: <20230523002136.5cgojhfdrcy223c6@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-18-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-18-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: 2bab5fdf-50b2-45b6-a311-08db5b23afa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N8BzKNX5TG9d6XdAyYdQsXD1yT/x7QdgOCXmiO8Y2ynCpQ9x5tH5vSdf8XhyUayWvjqGfTYfGpP8BEtX5q5aBSv4RchDyyeWrG67nbaKhIHNmE4bUp1u5t98cfRAMZXgFh1oNWx7IpdSGr3x2ZGScY87ZZuLrkiUumGYsjNHtcc1W2rhuJFSsf34SR8hj9VeeHnHuI2y3uaNEmYNeTT9lbD6LFItaliegdVGffF44byh5T0hWHG/OpuSoyR9VeE66DilQSe09fDYW9X7mBa5PzSfy5d8iWISQwygTy9CBOHX1px4naE70XPuiRX0us6vh0bHzMIkiORv/toGtjNZfTOqWrz6kKD57thek+EtPjo1eWIKSkkDQit9duOGbqAIKFmDNsFJQj9c1+UfWczcY1eRdWQ7YEX21d/xPII4rkikfMAUOqt4do0HzRp3xrWiJy4cQ9M6Yzmi1qc9vUpvJFaH/dZXF6VCBSPnXkRvSdXwxzNjIgto2ZJf5/SM7k9XZ/I6kDAYvwOU1QP0Ak+QKZcko80aK7iYQvqwXlWgq2RceXCDXVW6cNClFT8VtQp9BAO1YzUZG+LSMhykDh0P1FPo6o5PGnMewR4u0c+RMFeKldiraHIHhxkOR8obYyd/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(7416002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TS9OOHJhSVErSjc3UnRlYUJ5SStycEhBQnFuZ3BSWTh4MXpnVkNkQTc1RnlO?=
 =?utf-8?B?NDNnOVBTRlhOS01BRzFPY21HMzVuaGNMcHJLN2NWQyt5YjFQSE5EZStyYUk3?=
 =?utf-8?B?Vzk2Q0lQV0cxNzdhSjFieldIOXFQT1FxWjRKVDJRN3A4ZWw3UElNdTBncG9a?=
 =?utf-8?B?cGdtWkVYZkk1NzdQc2ZLR1hTc3FaTCt5MjFSODJSSXJ3N2MyUmVQSllzYkxS?=
 =?utf-8?B?bmVUNTd6V3liaTc4UVRDRUUzbXpQeGFnRkJoa0hEOTlHYlNlb1FrUWlWeDh5?=
 =?utf-8?B?dlE1Y2tWMGFURjZmOEYzRy9HOWkzT3l6RzBXVzVsc2kwNE1EQWtzeFJlWVUz?=
 =?utf-8?B?QUJDejdSdFdjOWJOQ1JzRnlDbkZpdUFoeDJMaUtpSzBMK3k1MmcrVGJLWVpo?=
 =?utf-8?B?ZHdwZE11NndYSHRTaVVWWDJ5VVJrQjVjZGdsYTA3bVJMc0UyQ3Q3cjhvN1Jr?=
 =?utf-8?B?SEhjQm0yVUFGTVI3WFE2ZHhIN3lRZGc4OUJJVktZWFJKNlNtWVRGaHpVSm9K?=
 =?utf-8?B?RFJDK1dGUzRwZldaNE1JcFNDS0FDWm9kYmU1THV0K2lEQnZvbHNSK2QzK0x6?=
 =?utf-8?B?OGNsSDArSHlvTm9mQ0M1WUxKWlcya0VwbjB2bXp4RUN5ZGpobURnV1hkUmRD?=
 =?utf-8?B?ZS9xL0NSY2p0bllsc21NdUY4aXdZQ0FYa3JWVEpjTktvemhqUnhpN3Q1WXda?=
 =?utf-8?B?Q0k4OXJ3VEdQcHhvYVpzNSttbHdGeGRlWkNZaG1meUlWcjZNT3h1WDc0a3Zt?=
 =?utf-8?B?bG52QkVuN0dSY3ArbDJvdXA5U3kvdENwTm9FcGxsUkNTSUd3ajlidmZYYmNU?=
 =?utf-8?B?VFZWdFlzSjRXRnhYWGlkaG5yZDM3TVFjQUhHL21RNmZndEIxbnhHNmViWDd6?=
 =?utf-8?B?dW1WQ041enNCS1BEQ2wxdUdSbWgyZGFvMlRhZjUxU3VkcUoyNFEveHJ5T01Y?=
 =?utf-8?B?K1VVc0U5M2RtS3hZSGdkVDMyaG8zaWRMdkJaYkhHWjRNKzJreG5PVjJ4S1pO?=
 =?utf-8?B?NlBoWFdMbGVPK1NCWmpDdVlhc0JFeXpCaXUwanRYc3YzdWVGQnJGUW5Pb1Rz?=
 =?utf-8?B?cnBkY2FXcXBmN1pXdjBkaVl6SkJ3QzQySFlSWEdBVG1ranNrSm9TOG1wMlZv?=
 =?utf-8?B?QUZqTU1vdlhaZjRSSHYwRjFFMVJkRkU2blNIRzlwVWgyOGp5b3JTeXE0WGlz?=
 =?utf-8?B?cVNoalByc1dnSDZmWFhzNHNnUjFUR213aXMvZ3lja1RGTW0xUjlzL2xZNVk3?=
 =?utf-8?B?dC9xakgwM2EvdTFSMkZSR3FCNldwbVU4N241blM1RTE4bHMrbFBpbnBkV3VK?=
 =?utf-8?B?RElxZVpqUDhFZDJXY0pBcHFGZW84OGpxR2l3bzhPK1FKdUdXcE1rMFIxOGhy?=
 =?utf-8?B?Rjh4QUkyV0l6YmJhQkNvMEV6Nmt6ZXM1eVlHSGp3Um9zSk5zckR0cHJQMGJl?=
 =?utf-8?B?dVlHTEEwekp5YVM5M2hKMWVUaVBFVEMwbHArMjR2cFpkcXl6cUxqdDRmdjBi?=
 =?utf-8?B?WWQraWlJWWtFZFJTS0lmcHFPNFFZSEI4QXdDWHpLVkRFZVJLT0NiN29mV3ZY?=
 =?utf-8?B?ZW83Q1QxOGFuY2JpQXZFaDV4Mm02d09DVUlPYWxITS9HekprM3BLeW9qcktJ?=
 =?utf-8?B?b0RrTHZRUFRkOEJ1di9PaUlDNnp2TldUeVpxRS9EcDgvTGNoZ2gyNFlrdHpX?=
 =?utf-8?B?MC9VWmZNUkJpQ0d5V2E2bVRGdnZQL2c2YWQzNzRLUVJpQmtHTlRleTEyZk9u?=
 =?utf-8?B?c2E5eWR4L2ZnN0U0bEhHb0FHWVpUbEwrRVVOZjk0eHd5a1hMQmZWcFN3ZnJq?=
 =?utf-8?B?akgxSlZyYVBDdEdYWVozcmNHbkRlajM2azBIK1Q5MWxPaDVOcDZLRXNQMmVM?=
 =?utf-8?B?dFNpL2ZFaDRIR0JaSUt5MUwzRVU1VjZXUXJvWGV4OExDUkRoMklQUHNmWXhu?=
 =?utf-8?B?aWpkSU9HeTRHNTJMMkE4UDBTQVl0TkRlOXUyRzdpNWlONHNxbWhrWFpOMHdE?=
 =?utf-8?B?UlBTNmlEM1Z5azFTZUhYODMyVGtIc2dsbFdKaGFISnlDMmVGVTMwL1Y2QVlM?=
 =?utf-8?B?a05WQlVTQXNzWVVXMERJMHZpY1o0KytjOHFyYzhHL1Z6NEFVSlRqN0pqeVNh?=
 =?utf-8?B?ZWZwQU9wS0NhcEZvVG5KMmhLajhBRXA2dkFNQkVYcEh1STZPWlBkQVVVUndS?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C2CA5927BEFC44C87EA8E644ABD6379@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?bC9ha3NDSGdqNTFMbkljbXFZcEVKMmg4a1ZjcVlUSzI5WERkQ21zSFRNaVNl?=
 =?utf-8?B?aVFZVXExcTJ4OWxxMUo1K295ZGxUbkZ2RlpJdTlEOW50U3h5Zm5DNVhidUN4?=
 =?utf-8?B?MGZsNExLZ24vemdVZ0tkY09iQmpRZ1dhMlQ1Y0VzaHZyRW84WDBJK0c4NC94?=
 =?utf-8?B?T25VWkQwelducW43UmVvQldhazg4R1VBNmRvRzRLSEhoZTZrODBXRllGakNM?=
 =?utf-8?B?WWxndHpTdHRtVGtOMGVBQmVnM1hZV0t1alpIcjJZZXJ3ZVRWZTJRNUdaN1Y2?=
 =?utf-8?B?bWlib1NJK1lmVEtvWjJXN2hhMWttSGV1dGcxbFZKSXRMWTVVU0trZHVONlJi?=
 =?utf-8?B?ckc5VFQvQ1V0TVhYRkxSY1pPQXQ3VkRvQXJOdERXb3lLUGEyU2ZKVzNyQWN0?=
 =?utf-8?B?QmRFZW9HKzVxcStNYXVCT2ZtVWlpRzIrQVViSlhrQWpGc1NvVmFtQ0JKOStp?=
 =?utf-8?B?ZmhwNm9EZ0l3M21yd2NvcW1iR3NXNDYvK2RVRitEdU9hMDZDR2g2OGxCb1BM?=
 =?utf-8?B?SHY5Zm9yalpiQWNTelJIYUJORjFGbGZ3V0llUXpack12cXlxUnpNaVdWVUFN?=
 =?utf-8?B?ZWZhWmhtVThHVFlEUDZmVzBBNU1DNlJDbzJXU1pQbEIzZm1ML2d4aC8yOElL?=
 =?utf-8?B?OFVNN29GMnNuRGhsSVRWZE9GTVNiMXJEYXNLdFBLbGdwOFVFUHRDcVhUaUVa?=
 =?utf-8?B?NVFtaVUvbnR5ZHdIanR1cE9pUzZiZ3d6dWlIZUlWN2lQMk4ybWZMYysrSzlU?=
 =?utf-8?B?NTA0MWs0ZHJ1RzR4S0YzRitjVGc0bHJhRUlwRlI4amlRVm9PelVXYi95eVlT?=
 =?utf-8?B?UU94bnBsanEzeDhTWjhoakM1N0tJbmV5RC9LaVlRbHQ1YmpBa0IxSkp3alZh?=
 =?utf-8?B?YmVzNTBtTlJlc2YvR05nTldhekRLZngyNVVFZHdWNW1yRnUxSnRBd3BWay9i?=
 =?utf-8?B?MmY1M2x2ZVdkakFyNSt4Rmxkcmo2L0JOU3FIVVdkSHpJYXBOeXI3b2RSa2dX?=
 =?utf-8?B?VlhuUkRQYmFoeEZhZWFkSnB0RlViVzBNRHFadGFxV21iMmJsN0RQUU9xSDlM?=
 =?utf-8?B?SjNTNjFmSThvRmc4R1k1RUV6TUQwZFBXalFSZ0xEc1RtMkdrd2pLbXFRRytJ?=
 =?utf-8?B?YS80N0xPNjZwSmZGNEhFTWphK0ZZdlRjdzAwRWFBRkY3V3VxMlFNRVgzdXRM?=
 =?utf-8?B?dWlaYjFWS1pFSDRHdXk1R0pkaElpOE5CdDhiTmY2RW9ydVd1bXd6RDl5R2tM?=
 =?utf-8?B?NGR0b2tRRDYvdDN5WWxLVWh3K2RkcWp6aElrblY5VFpzbnN6VmppY3hIYU11?=
 =?utf-8?B?Y3R4eUk1OC9nN3RaV0EwS1Y0V2ZCR0ZobG1JYWtEcE5IQzFSd0JDS1IxYmIx?=
 =?utf-8?B?ai9LKzh0blBYb29hMmtqQWU0MTNrU1Z0UU11UG1GUnJLU0p0VFJqaGJMSmcw?=
 =?utf-8?Q?l28XV04f?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bab5fdf-50b2-45b6-a311-08db5b23afa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:21:43.1317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4k8z0w0TXUXB2xUbD5IRjW/GY7MH3i0x2VfwTpcVPMub5oeqfVyJEqPrbiY010mfVJRaCNgHPE1r91GCJItVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-GUID: X2fc0YH3AE1Wi94lxZvvNfUUWp4ZRGCu
X-Proofpoint-ORIG-GUID: X2fc0YH3AE1Wi94lxZvvNfUUWp4ZRGCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
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
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLW1lc29uLWcxMmEu
YyB8IDYgKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1n
MTJhLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24tZzEyYS5jDQo+IGluZGV4IGIyODJh
ZDBlNjljNi4uN2VkNWEyMWZiNDQxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtbWVzb24tZzEyYS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJh
LmMNCj4gQEAgLTgzNSw3ICs4MzUsNyBAQCBzdGF0aWMgaW50IGR3YzNfbWVzb25fZzEyYV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+
ICANCj4gLXN0YXRpYyBpbnQgZHdjM19tZXNvbl9nMTJhX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiArc3RhdGljIHZvaWQgZHdjM19tZXNvbl9nMTJhX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBkd2MzX21lc29uX2cx
MmEgKnByaXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gIAlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiBAQCAtODU5LDggKzg1OSw2IEBAIHN0YXRpYyBpbnQgZHdj
M19tZXNvbl9nMTJhX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgDQo+
ICAJY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+ZHJ2ZGF0YS0+bnVtX2Nsa3MsDQo+
ICAJCQkJICAgcHJpdi0+ZHJ2ZGF0YS0+Y2xrcyk7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gIH0N
Cj4gIA0KPiAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBkd2MzX21lc29uX2cxMmFfcnVudGlt
ZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gQEAgLTk3MSw3ICs5NjksNyBAQCBNT0RV
TEVfREVWSUNFX1RBQkxFKG9mLCBkd2MzX21lc29uX2cxMmFfbWF0Y2gpOw0KPiAgDQo+ICBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBkd2MzX21lc29uX2cxMmFfZHJpdmVyID0gew0KPiAg
CS5wcm9iZQkJPSBkd2MzX21lc29uX2cxMmFfcHJvYmUsDQo+IC0JLnJlbW92ZQkJPSBkd2MzX21l
c29uX2cxMmFfcmVtb3ZlLA0KPiArCS5yZW1vdmVfbmV3CT0gZHdjM19tZXNvbl9nMTJhX3JlbW92
ZSwNCj4gIAkuZHJpdmVyCQk9IHsNCj4gIAkJLm5hbWUJPSAiZHdjMy1tZXNvbi1nMTJhIiwNCj4g
IAkJLm9mX21hdGNoX3RhYmxlID0gZHdjM19tZXNvbl9nMTJhX21hdGNoLA0KPiAtLSANCj4gMi4z
OS4yDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMu
Y29tPg0KDQpUaGFua3MsDQpUaGluaA==
