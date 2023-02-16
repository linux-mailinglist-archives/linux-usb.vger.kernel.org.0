Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD621699F99
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 23:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjBPWKo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 17:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjBPWKn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 17:10:43 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6620B38EAB
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 14:10:42 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GK9ZYV001351;
        Thu, 16 Feb 2023 14:10:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=OGjFtSUq9KaMmOtl+CegA6r2lssj5Ty013W6VjI25PU=;
 b=MUlAMde94G8YjaSIGTMzgTUkzh4GMuu9SJvm0UMIlQDuZEWzyYLOy6DC1F5voGh3+8KJ
 o8lAsNGbiOis/hTqCGeuQBjd2XmwNUfXPIA0A+mqOM391IHKZScz/8DnmOTq/WDNleXU
 vsdqStjYHllzxeFBaw6VWQoYyzuTSlXUNh4SK8tsKrYfvp0pcMqkPkLa5ZfPEeAq15pJ
 RvLlUFb1kcEEx5DXyh1Z9bfymXgbET8r8eafXxX5apXjDXL+cJM6x7t4ugVTJuFWQu0R
 GxZHhm0r5FF5DbDt6ukAtCPYZXIRV6mLA9sjivOxSf8oBofatGv9ucJD8q7XXh8sVkCZ 5g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3npawuq8gv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Feb 2023 14:10:37 -0800
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 17B15C00AF;
        Thu, 16 Feb 2023 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1676585437; bh=OGjFtSUq9KaMmOtl+CegA6r2lssj5Ty013W6VjI25PU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XADOikMaEhm1Phv9Ijk0XnHetB5zYB/NgnU1AYk+tS0zdGj5wIAHplzP7eC4H7YZ+
         25/f1EPmlQG856rO/pTKCRYKK8V0+Um19zO2rhr0Q8hs/Y3gNkKYrXaUsI5dHZZffb
         5RkcYrxm9fjI6TWo7cT0KzCyQmX6VwaaVpo9y80H28nErHdJvCZTQS8JU1VRJnIgCP
         GU3AEx7dN0ZZKw099ZOAEipHQ5r6+x2X3u0TD7i21lJ5M5e799QmS0NoMe4Q4R/HCo
         u7koGiwGqM49X+gIZtImwZZyAJDbMPe7V1I141h2L6wX3CLpgC7Yh0SmZDF2aKuhxa
         FdNbz2UfZB4Ig==
Received: from o365relay-in.synopsys.com (unknown [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3B6B3A0081;
        Thu, 16 Feb 2023 22:10:30 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 36670800FB;
        Thu, 16 Feb 2023 22:10:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="s/vxU87s";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhYzOqTe67KaQ520bBJsbHCIzT5+u/qW1poG3jkPwb4PErCER/Pgewla02gK/l+RWokJC5c+6TojgwL1ZpvCeCmDYIQYmZdS1QFnaEUlkVgD4nfB9BGV8B3V8dTbSS5Cn6ANjqbgmyMXC7RC38O0OAfSdDT0HztM7elYBYaEBtQXLEZpoS0HCfbLkC6ZhAj3ZUoJ0fKVKWkg1W+coBBpzWXmI/TK/GCAf5f6Jsg20Xj55MyIuiJYYnr9mgoDYxmtFgWpfSggLRYvMxajgbKvpI4bTBp8Yo/cNcFKFZkKiXG8ndsemITsZxVbP1wV5ju9x637MpJrHYI7WqRUjC/uqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGjFtSUq9KaMmOtl+CegA6r2lssj5Ty013W6VjI25PU=;
 b=M/QVgISEaAHa6Eeza7ZZi64iqMebaji3uAynESzLbSHA2FDc7ePBMNu28JcJpmzgdgu7kz1aPTtRkgsVhTKV4jpUZRUzAIA9NIs23EZetqr8niKHG2hLw0gGhLH2O3GRuv84feuaojZsOW8wXQts/G2olUT1rSWLSQnuHZacrLUaE+120tyTpYJHJ/W1o54hq5aq+ZYMAuFEnL8Qu/dXs/f6i3fgZzqXeBDYGy5/g6l4zFPwgjVNrZEKR77Xlj93gxKm7srt3LzM+T821omBUvyVAxuaLY72AOtRDv7MN3yOKh4+KREYwtCapr4eMDHvOpe7Q2dd4xLaLDgHide5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGjFtSUq9KaMmOtl+CegA6r2lssj5Ty013W6VjI25PU=;
 b=s/vxU87sk2xjjT+oV+hyN9SQnNvmxr4cLlZ8yhMlFfV4SQ17E543TYHD/oJxrQP2yusxYdArjI3H3rQVwJVG6kagtjTNuoTg91BDWJZEkSt2EfhBBta7ZaLvLxgmgK+bfnM3K/V4bsA/KAhN6wd/qP3YlGMZflyASPvRoHT6u/I=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 22:10:26 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6086.021; Thu, 16 Feb 2023
 22:10:26 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Roger Quadros <rogerq@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
Thread-Topic: dwc3: gadget suspend/resume vs system suspend/resume
Thread-Index: AQHZQSGIQpZyBgHR1ESwyvCYdmUCwq7QJboAgAAeOwCAAA9MgIAASymAgACj5gCAAJ+fAIAAH2GAgAAjWoA=
Date:   Thu, 16 Feb 2023 22:10:26 +0000
Message-ID: <20230216221023.akjxerp7mltecjcy@synopsys.com>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
 <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
 <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
 <Y+0jZScRX80mF8tS@rowland.harvard.edu>
 <20230215225337.wuzhpmikiqz5htqk@synopsys.com>
 <3b6f29e9-cc6b-d834-7c7e-7ae47b9fc44e@kernel.org>
 <20230216181132.k2jate2uwqadpqfh@synopsys.com>
 <Y+6MJ2juVmPdp15q@rowland.harvard.edu>
In-Reply-To: <Y+6MJ2juVmPdp15q@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA0PR12MB7773:EE_
x-ms-office365-filtering-correlation-id: 9ef39232-84a3-4c03-3ba0-08db106a9b59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mUQ7EffVSFIsCKGmWPnULFCp3nfDtkZyx1TyO7AKYZeD6FwtrSfzyKAH8j53iutBhJPVb11dSXMFUcZNRYu9L7F40r3PtCpvpYpi2s788GS1AvwK6AFcyPokHDXA22+nki/KaSrbeu8uNh1SE4ewrJMuguuVS5/0lTNLJqHiIKpmQ1ur8ntxC/0TiFYMfiRRwf/1UMRwLrw3zYIm4gozQ6YOoczwbjquCSa8NkDcqVtbY9CCC4h5zxjd50rvR1FtVWMUm5+26kKw0XSqD2PBb9iqoqPbahIvNZU8YVuMii/yrXyVLRUunbQ03lorWLIlkcoii12b8aCEYjZf+bO6Z+7VRKDW2HXDG4mR2P/BjNFYCF7FpnJTdYZyEpL8VxTyo12e3oiemCkPcrmfjNTnLBs1Rxuf6O17l1bMYkG0sxg9ZnBdFdmwsKt3+oG5PcQbK6pvY14oBDMn3z/Hb8EfRWOMKbObw5MZUZlcurDchvExaTQX+sdNOasXzcusaGzXaiupSYFqIzFufKvIvJb5pZkUI788lv1FAYFjGr1OjOV5UJj3SAYFp0z0laB+wBbtm4ns4P2PSGsayNMppK9EHNNO6g86YMJoicFnSADV6uAXBq483iwm4V/UwMIhc3XQacTaJMSVXDNQJ2DYQphTqq0MAcSIviwFVNvo4XUeAAJCrbs437YSzw031x2hGP0kSS4DyeJDFyaxpK1Qr0ra0A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199018)(66899018)(122000001)(71200400001)(36756003)(1076003)(38100700002)(2616005)(6506007)(186003)(86362001)(38070700005)(83380400001)(6512007)(6486002)(478600001)(26005)(316002)(66946007)(4326008)(66446008)(76116006)(64756008)(41300700001)(5660300002)(66556008)(54906003)(6916009)(2906002)(66476007)(15650500001)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDFhUXFJU1IwMmZoemhKMGdWekNsUzM3cXc3ZDFFWmJnZ1VyeHhLNGZtMkdq?=
 =?utf-8?B?eEJkaUlRVzY1aXZmalpYL3hHRGR4TG4wVzBUMmZ3WWt1bmVGeDRudmNBTUhW?=
 =?utf-8?B?U20wSEpWeDRtSTE0a20wdzRWdE1MTGV0cVBGanNzdi8rSit0SGppS1F0UC80?=
 =?utf-8?B?eFZSWFkwanFLOVE1QTNJV0w5UWV4Q0VmQmFGVHBkbDNCOUxkTE53Rmd0dnBS?=
 =?utf-8?B?U0VEdnd5Rkk4THlZN3pFMjNzdWo2RmdPVDBwTTJ6Tzk4c2NUejVwUE5IcUZa?=
 =?utf-8?B?NXlmYTRTbmZtNnFRMTZiSVlhYy9NUmE2ZEp0SkFOcVpjeXR0RUZuRFliWGtm?=
 =?utf-8?B?K01sTW41MlRoNkJacVJVaDdHNjVlbEhYOU5kOHhuZXdwRElqWDArYittaXJ6?=
 =?utf-8?B?SzJ3dUxmTVFHM3VpSWdnL3ZiNGpPOGdTck1YdXFkUUd1Ymo0OHM5aEJGR245?=
 =?utf-8?B?b3VJbzZFQnNvKzBvNjNGdnFnVXluRXd0Y0Rub0M4OTFYTE4xQkdRVTF4bmVZ?=
 =?utf-8?B?ZUtkZDFkUXZ4aUVVcUFrbFFNWVo3dFFBc1d6TnVVdi94TzZkOU1Hd0FhQTJY?=
 =?utf-8?B?N1BtNnUwcEszMllTYlREWmlSMnpndWJoWEEyL2tKcVBDbURxWjdPcVU3TUJz?=
 =?utf-8?B?ZUlYeDc3QnNrRmlnQVF1WUNJZmt5NGkrRGFwWFYrS1JCdkVVTjdRMktFdG04?=
 =?utf-8?B?b2xaaFJDSWNHcWF3ZmdBMjFVRjBoNEpnblZRbzFQTVBEeDREQjhSS1ZwckhU?=
 =?utf-8?B?d1czUldUb0R3MnhWWVloWGtEU1lPRTA4RUhtMmJqRFR1UkY3NWRZN2ZEUFRX?=
 =?utf-8?B?bFd3azlYSzR2SDFNUXc3YmVJNTcxYkg3ODVUb093Z0xoREExdDBmdmxENktx?=
 =?utf-8?B?RTRBd29kQ1dVM01wS1d6MEFHSitGV2lhdy9PUi9yOXZVMVlSc1pET1RZS0x5?=
 =?utf-8?B?dW10RFJ6UUZSTXJxWVMzdGl5UnhOZEhvYTBhWjkzbFkyblQxaU5TTG85RVN2?=
 =?utf-8?B?eENNdHM0QVNMelFUUVNWSU1XbmN1RmE0UExNTzY1MEpqTFh4Q3g4Zi9QazBR?=
 =?utf-8?B?aVlVU1o4L296L05XK0pHai9NMEtHeG5uTlBwUE5oLzlxSVJpY1VyZkpZcXJW?=
 =?utf-8?B?ZEtXbStVRVRhS083S0FrOEFZMm1VWDNWazdLcFJIWHJNMll3WnJuUC9xdEs4?=
 =?utf-8?B?dG91bFFtTWo0RmpvNkFORUxOcStEa0hxOGNYbWhHbDU2L3NMdkRlWjJYZzkz?=
 =?utf-8?B?WTcwNlpCMW9vUU56dndod0RJVlFTQ0RMTWdCV3JtTEp4NjJrZ3RvSll3bjZz?=
 =?utf-8?B?MDFQMGtoUVlyWlg4cHpLelZ2RUFQSlM3OWkyanEwNW90OTRqSDlnQ2FpdUph?=
 =?utf-8?B?YWVwektRN2tlV0ZjWG85azlHMDY1REQ2WVFVaDA5MHlBTmZJOFhDY0dCSHlM?=
 =?utf-8?B?T0VIMUFnSTNiK3U0akFLUGM2NGJ1OTVqVWM5QTdkUGpIRjdJTXRFK0swMi9P?=
 =?utf-8?B?dDAxSENocHlTQWRReTB0alh3SDUyaFhmbDhIck9iSHNnR2hndldrdUoxWmUw?=
 =?utf-8?B?VUpGSUFDVHhBZ01WbFFGNXpsM0xERUR1a2NhMGxlZ0R6bXJNYzlOMHRhN3pT?=
 =?utf-8?B?bHFJeFZsTWFlNTFZSkZKZzQrRnBLdVhvVERwdWl4QWNhQmkzd3NWWkFyaURn?=
 =?utf-8?B?aFpPTkkwbTFKSnd3b1FsMVdSOHRiUnZYcG1QUDlNVHl4ZTB6WlpMWjA2TDBj?=
 =?utf-8?B?b2tZUGgwbzNSM1ZuV2srbXp0Z09FemJSVUhXZU1mWFBHTlIyTDFicnVyVHNy?=
 =?utf-8?B?SU0vT1htRmpvUWt0aWhNWEJOZ1RTKzM3emx5cVFQT3MreVl6TTlXcHBIMXpt?=
 =?utf-8?B?eEVNS2xrY2d5cDhUSHJSbnpERWJHenFKcVErQTM1TjdiZDNvcFJRRmNONEk4?=
 =?utf-8?B?b0JEb2wrQUZscE5jMitvY21mcmNJSGNpako4UlNLOXhaVVdxQS9hNHdFNmVq?=
 =?utf-8?B?d205NElXb000N25yL3pmUzFUT0t6NTIyMkl2akRocWRYRjIwQ1VrU0F5cXcv?=
 =?utf-8?B?Vk5hRURDaFZnNUQvSlBSN2Jiem1RR0VIcTdkc3lXSUhCbCtJZ2pBYWo2RWlo?=
 =?utf-8?B?YXo3ZGZhdDYwU3loYi9SN2JaZHVXU2VRZXZ0VEt2STI3QnBQZVJCUmxkTFox?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E8F23F4F8AD0D4A9BEA0CB0617CDEE9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oEh4l3F02Zb6ZY9LP4xXdOiUrX/ZBs/oOdfF0qk7a2WtP/DZlhcZ8sAfwf9OYPSXQPAZUwiGZP2wPZcyRUhv80J7ZBMBfcqiLo5E6P4+P1E58pqmwjmw0Npq79Z+AYcx4+SYZH6ZIuy5NQNtAEWPZ32yEGlHBs3corwl9mOEmr1iZjGFVDV6TM1Cgk0mY3HJvO1dBdWVkRZ7y6T+vTnzuKw7Mi0W7O0yz1YxESZQbnLL9a5Y5tt/vn8L8PEE9lfBb9GnzFxk6+D7dFH66WrxeXREHooT5uT88vg5nYlRBEQ6svfw4n+G12jI4ve+30l5EXopGFHFJy/rlMEFKjmVscs00z4H3z1kWs2dS7DpZCnwiRzZJ3eGuMgsPt7vuowKLVPhm9Mx1nzDZvQto4yLyZ120fs8wdEl22hZqIplCjzDptqbNtmAsjWnG2tGxf0X+9MIHkhAGRrIzoR5NIIeqQswDuUnomhvo8vm4x7qRYEYr61MSeekQ3esZhp8CyFTetL0TvKdCiEGDQ1ybr1Aut99zzptRGefDqcV2ahCl3hQj3DCCk5VHqC7q70NJ2dMYzUfrW9xeIAyxFY3XCffddOX56g4M9NWtZv0s6CzZZelU8f1ji4tegt/rt47y+zCO35I1nX6eF3He+9y0n6pqR7xuFKRpkDXBqSv0evuQM30sGmhr5GqefKiYrpFQk2AxM4YK9gqeXnRHK+TKXwq+aLUzCo1J/qVeTA/DLsn2foIhu9hnrmCqLok5/wAQr6gUKoyikD1zvb4SPl5trL5vcfHcVXRqWsSVdGHCCcivq5Xxx+5FMGG725nFre39Pd1tMKW3kwX7utw7itqzbCpZ5GJx8nc6w93WHjwnQHg6I/0DOwkcjtabI3ySGkgNrNxOsE3S8Hbsmi4WpsWaw3w8A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef39232-84a3-4c03-3ba0-08db106a9b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 22:10:26.1638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kTAm5T2AEXzE5SrnLub+fsieyH6biDuyONW8Z8zagl7rsvrE+VonUcn2NYRzwOOt1BIpdjP6XhOg8H4zOaWSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773
X-Proofpoint-ORIG-GUID: EodLMifqpyuGOZorzc4dAtMnGsbNR9bs
X-Proofpoint-GUID: EodLMifqpyuGOZorzc4dAtMnGsbNR9bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_16,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160191
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBGZWIgMTYsIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFRodSwgRmViIDE2
LCAyMDIzIGF0IDA2OjExOjM2UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBU
aHUsIEZlYiAxNiwgMjAyMywgUm9nZXIgUXVhZHJvcyB3cm90ZToNCj4gPiA+IEkgY291bGQgbm90
IGZpbmQgYW55IHJlZmVyZW5jZSB0byA1MDBtcyB0aW1lIGxpbWl0IGZvciBzdXNwZW5kL3Jlc3Vt
ZSBjYXNlLg0KPiA+ID4gVGhlIG9ubHkgbWVudGlvbiBvZiA1MDBtcyBpbiBVU0IyLjAgc3BlYyBp
czoNCj4gPiA+IA0KPiA+ID4gCTkuMi42LjQgU3RhbmRhcmQgRGV2aWNlIFJlcXVlc3RzDQo+ID4g
PiAJLi4uDQo+ID4gPiAJRm9yIHN0YW5kYXJkIGRldmljZSByZXF1ZXN0cyB0aGF0IHJlcXVpcmUg
ZGF0YSBzdGFnZSB0cmFuc2Zlcg0KPiA+ID4gCXRvIHRoZSBob3N0LCB0aGUgZGV2aWNlIG11c3Qg
YmUgYWJsZSB0byByZXR1cm4gdGhlIGZpcnN0IGRhdGENCj4gPiA+IAlwYWNrZXQgdG8gdGhlIGhv
c3Qgd2l0aGluIDUwMCBtcyBvZiByZWNlaXB0IG9mIHRoZSByZXF1ZXN0Lg0KPiA+ID4gCUZvciBz
dWJzZXF1ZW50IGRhdGEgcGFja2V0cywgaWYgYW55LCB0aGUgZGV2aWNlIG11c3QgYmUgYWJsZSB0
bw0KPiA+ID4gCXJldHVybiB0aGVtIHdpdGhpbiA1MDAgbXMgb2Ygc3VjY2Vzc2Z1bCBjb21wbGV0
aW9uIG9mIHRoZQ0KPiA+ID4gCXRyYW5zbWlzc2lvbiBvZiB0aGUgcHJldmlvdXMgcGFja2V0LiBU
aGUgZGV2aWNlIG11c3QgdGhlbiBiZQ0KPiA+ID4gCWFibGUgdG8gc3VjY2Vzc2Z1bGx5IGNvbXBs
ZXRlIHRoZSBzdGF0dXMgc3RhZ2Ugd2l0aGluIDUwIG1zIGFmdGVyDQo+ID4gPiAJcmV0dXJuaW5n
IHRoZSBsYXN0IGRhdGEgcGFja2V0Lg0KPiA+ID4gDQo+ID4gPiBJIGRvbid0IHRoaW5rIHRoaXMg
YXBwbGllcyB0byBzdXNwZW5kL3Jlc3VtZS4NCj4gDQo+IEl0J3Mgbm90IHNwZWNpZmljIHRvIHN1
c3BlbmQvcmVzdW1lOyBpdCdzIGEgZ2VuZXJpYyB0aW1lIGxpbWl0LiAgSXQgY2FuIA0KPiB2YXJ5
IGRlcGVuZGluZyBvbiB0aGUgYXBwbGljYXRpb24gb3IgdGhlIGRyaXZlci4NCj4gDQo+ID4gQXJl
IHlvdSByZWZlcnJpbmcgdG8gdGhlIGhhbmRzaGFrZSB0aW1lb3V0IHdoZW4gdGhlIGhvc3QgdHJp
ZXMgdG8NCj4gPiBpbml0aWF0ZSByZXN1bWUgYXQgdGhlIGxpbmsgbGF5ZXI/IEl0J3MgcmVsYXRp
dmVseSBzaG9ydCBjb21wYXJlIHRvIHRoZQ0KPiA+IHNvZnR3YXJlIHRpbWVvdXQgYW5kIHdpbGwg
dmFyeSBkZXBlbmRpbmcgb24gaG93IG1hbnkgaHViIHRpZXJzIGluIHRoZQ0KPiA+IHRvcG9sb2d5
LiBBbHNvLCB0aGF0J3MgaGFuZGxlZCBieSB0aGUgaG9zdCBhbmQgZGV2aWNlIGNvbnRyb2xsZXIu
IFdlDQo+ID4gc2hvdWxkIGNhcmUgbW9yZSBhYm91dCB0aGUgc29mdHdhcmUgdGltZW91dCBhZnRl
ciByZXN1bWUgY29tcGxldGVkLiBUaGUNCj4gPiA1MDBtcyBoZXJlIGFwcGxpZXMgaWYgdGhlIGRl
dmljZSBjb3VsZG4ndCByZXN1bWUgZmFzdCBlbm91Z2ggZm9yIHRoZQ0KPiA+IGRyaXZlciB0byBw
cmVwYXJlIGEgdHJhbnNmZXIgcmVzcG9uc2UgdG8gdGhlIGhvc3QuDQo+IA0KPiBBbHNvLCBrZWVw
IGluIG1pbmQgdGhhdCB3ZSBjYW4gaW5jcmVhc2UgdGhlIGluaXRpYWwgdGltZW91dCBsaW1pdCAN
Cj4gZm9sbG93aW5nIGEgcmVzdW1lLCBpZiBuZWNlc3NhcnkgKG9uIExpbnV4IGhvc3RzIHdpdGgg
YSByZWNlbnQga2VybmVsIC0tIA0KPiBvYnZpb3VzbHkgbm90IG9uIG90aGVyIGtpbmRzIG9mIGhv
c3RzKS4gIE9yIG1ha2UgaXQgYW4gYWRqdXN0YWJsZSANCj4gcGFyYW1ldGVyLg0KPiANCj4gPiA+
ID4gSU1PLCB0aGUgc3lzdGVtIHN1c3BlbmQgb24gdGhlIGdhZGdldCBzaWRlIHNob3VsZCB0YWtl
IHByZWNlZGVuY2UuIFRoYXQNCj4gPiA+ID4gaXMsIGl0IHNob3VsZG4ndCBkZXBlbmQgb24gd2hl
dGhlciB0aGUgdXNiIGdhZGdldCBpcyBpbiBzdXNwZW5kIG9yIG5vdA0KPiA+ID4gPiB0byBnbyB0
aHJvdWdoIHN5c3RlbSBzdXNwZW5kLiBGb3IgdGhhdCB0byBoYXBwZW4sIHRoZSBnYWRnZXQgbXVz
dA0KPiA+ID4gPiBpbml0aWF0ZSBzb2Z0LWRpc2Nvbm5lY3QuIE90aGVyd2lzZSBJIGNhbiBzZWUg
d2UgbWF5IHJ1biBpbnRvDQo+ID4gPiA+IGNvbXBsaWNhdGlvbnMgZnJvbSB0aGUgZGVsYXkgZnJv
bSB0aGUgc3lzdGVtIHN1c3BlbmQuIEZvciBleGFtcGxlLCB3aGF0DQo+ID4gPiA+IGlmIHRoZSBo
b3N0IGluaXRpYXRlcyByZXN1bWUgcmlnaHQgYWZ0ZXIgc3VzcGVuZCB3aGlsZSB0aGUgZ2FkZ2V0
IHNpZGUNCj4gPiA+ID4gaXMgc3RpbGwgc3VzcGVuZGluZz8NCj4gPiA+IA0KPiA+ID4gSW4gdGhp
cyBjYXNlLCBzeXN0ZW0gd2lsbCBnbyBhbGwgdGhlIHdheSB0byBzdXNwZW5kIGFuZCB0aGVuIHdh
a2UgdXAuDQo+ID4gPiBJdCB3aWxsIHRha2UgYSBmZXcgc2Vjb25kcyBtb3JlIHRvIHJlc3BvbmQg
dGhhbiBpZiBzeXN0ZW0gd2FzIGFscmVhZHkgc3VzcGVuZGVkLg0KPiA+IA0KPiA+IFllcywgbXkg
Y29uY2VybiBpcyB0aGUgc3VzcGVuZC9yZXN1bWUgaXMgbWVhc3VyZWQgaW4gc2Vjb25kcy4NCj4g
DQo+IEl0IHRoZSBnYWRnZXQgaXMgdG9vIHNsb3cgaW4gcmVzcG9uZGluZywgaXQgc2hvdWxkbid0
IGJlIGEgYmlnIGRlYWwuICANCj4gVGhlIGhvc3Qgd2lsbCBhc3N1bWUgdGhlIGdhZGdldCBoYXMg
ZGlzY29ubmVjdGVkIGFuZCB0aGVuIHdpbGwgDQo+IHJlLWRpc2NvdmVyIGl0LiAgUHJldHR5IG11
Y2ggdGhlIHNhbWUgYXMgaWYgdGhlIGdhZGdldCBoYWQgYWN0dWFsbHkgDQo+IGRpc2Nvbm5lY3Rl
ZCBmcm9tIHRoZSBidXMgYmVmb3JlIGdvaW5nIGludG8gc3lzdGVtIHN1c3BlbmQuDQo+IA0KDQpJ
dCBtYXkgbm90IGJlIHRoZSBzYW1lLiBUaGUgaG9zdCBtYXkgdHJ5IHRvIHJlY292ZXIgYW5kIHJl
c2V0IHRoZQ0KZGV2aWNlLiBJZiBpdCBmYWlscyBhZnRlciBhIGZldyB0cmllcywgaXQgd2lsbCBz
dG9wIGNvbW11bmljYXRlIHdpdGggdGhlDQpkZXZpY2UgdW50aWwgdGhlIG5leHQgcG9ydCBjaGFu
Z2UgZXZlbnQuIFNvIHRoZSB3b3JzdCBwb3NzaWJsZSBjYXNlDQp3b3VsZCByZXF1aXJlIHRoZSB1
c2VyIHRvIHJlY29ubmVjdCB0aGUgZGV2aWNlIHRvIHRyaWdnZXIgYSBwb3J0IGNoYW5nZQ0KZXZl
bnQgZm9yIHRoZSBob3N0IHRvIHJlc3BvbmQgYW5kIHJlY29ubmVjdCB0aGUgZGV2aWNlLiBJJ20g
bm90IHN1cmUgaG93DQplYXN5IGl0IGNhbiBnZXQgdG8gdGhhdCBwb2ludC4gVGhpcyByZXF1aXJl
cyBzb21lIHRlc3RpbmdzLg0KDQpCUiwNClRoaW5o
