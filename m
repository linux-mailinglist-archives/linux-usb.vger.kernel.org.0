Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB67F6DB85F
	for <lists+linux-usb@lfdr.de>; Sat,  8 Apr 2023 04:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjDHCvg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Apr 2023 22:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjDHCvf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Apr 2023 22:51:35 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADD8D501
        for <linux-usb@vger.kernel.org>; Fri,  7 Apr 2023 19:51:34 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 337MtM3b020097;
        Fri, 7 Apr 2023 19:51:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=YA9buEvLcfmSfc9ApAeUbu5KYBE+kWourqOSVfcA9PI=;
 b=sHAqqZrNro+L9WA8XpHA37sCc+FY8tzS2vT00BvjLoUie/9RDqucLIYaHmVq+vKPw9Da
 AMLgBq/Gxyv4zBKcLnenO+tZAjn1jqxpj7VqexvUuRK01DJobGDN88idz1uYbnjeUp7N
 tLd2TVaTsjqFJxSu2ZRIsKagHDnUnX4tDupTLEMs5ZM7ABy3e3Hd0+kONbQANac+lzY1
 3AQk97p9e/vLQkdrFZg1fnr1o3toGq4JlXxOTYMbz+OAPHrnhHndYY6OGZLFLAHvQvkS
 61UQlGiy1PMKLRswywdQs2/uUDwQf1e0B1DLoy17Jd5lMwALjT6pMuy4iL8Ha1C5gye8 Hw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkv9marj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Apr 2023 19:51:29 -0700
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9EC4FC05B0;
        Sat,  8 Apr 2023 02:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1680922289; bh=YA9buEvLcfmSfc9ApAeUbu5KYBE+kWourqOSVfcA9PI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gYjDm6jJ0KkZcDfBYkfcNwuS4z8TM9p3eJGWE9nGWP+UkuyyVMiV3fybY+2cGH2su
         Sj2CWxG2lOwM13HP8vsZupja5q4duTACARiCoI4Ez32+qRJVm1zZKB70BvbNz8KAuk
         AwPd2/oY8Cm0Bn2wjfGRu/WGSqYX+jfr+NAttdG9bUMdFAZCAH0SPO0QFReyBHZLQm
         jBS843JKmtFEOXMK1N1QXJ1HUqUrQaqGpL79wQOOJKOY6FO2U8Wt620HgeQgQov6PJ
         thYGm4ha7yp9CQsttc2QrDCXlCMNS4Phmb54jgTdzrGl0ZrKl/x7rCHjFVY29EQIWB
         +wo3D0OerqIzg==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id ED786A005C;
        Sat,  8 Apr 2023 02:51:28 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2FEBB4006C;
        Sat,  8 Apr 2023 02:51:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="rWd6WEHA";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGxobSOAwQQXL8YcJWCXrEimCZBmUWGnRew4pn7KHwl7IYnU1imcxNRaTiF67dZyRLfeNdpvJdZweEE7RWPzqC672dY6Z+UTQ2QFIe3Wdfcb5DfIgYpccM20uOmvItELlD+FTDbpR8NWhdaDt1BdwEEUzwBcR4iLYGC5i+u6zICNaet6uhtbAMmv0pJN0N0bYvRW/6PMxfQaZoyDR7OHAnI+BGivzhGBEfil/05R7rw4/qqnLD0btH+1H5SRXHUUIqnGhKSSi0WqEHjdtI27YYelOobGDdEBxZVjauxF8vbNxCNrtFv2VP8oMsyW2HmbH7jJ7DUoxoD0eMWGY7Zf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA9buEvLcfmSfc9ApAeUbu5KYBE+kWourqOSVfcA9PI=;
 b=GikeWopoOtVcZqVbiNXuhI/fXY247S9Ni5zOdX29T/E3Dz15mpO2Je0NIOcHwC/4dhRvipgBHqfxWveBWatwi+W9WStfWiy4rcGae6MgWi9P/ZWylzLoVqOdBbzE1AsJXM5SoIaf7AZh7bjg1WcxvRoRhnt3Zr4i/QLSMgO8rnwrIXshspsQuZiAPmmjpq7LSwgKAKhE01IdRwrTIkpHCPBpjd6uC96jNyv3g+BwjXXDUsD/II1ioYButx1V2c0kO2YjDSqtELGvrqFjp4CHJ7KKt4z82h/2goVwoSrD1KChmkuIqOf4Irt98uQnFXgjv2ry3p1ILWtVlkjSuuFGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YA9buEvLcfmSfc9ApAeUbu5KYBE+kWourqOSVfcA9PI=;
 b=rWd6WEHASqlokRAHysfPuBzOHGlfTmHu/pE951E/2wjvjXYGf6ABqlLJRpvTsm0o4nFHlAEVjrh6oq4lVIZqWA81P11NE4mOjZSOxkLpRYabPe3ZuV+qVBqBa0IGz3oOi9sB3mKL/FdzVV8dSqvQO7qn3Mo46U4c2xD9n2/s6hs=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MW3PR12MB4410.namprd12.prod.outlook.com (2603:10b6:303:5b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Sat, 8 Apr
 2023 02:51:22 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25%4]) with mapi id 15.20.6277.034; Sat, 8 Apr 2023
 02:51:22 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Stanley Chang <stanley_chang@realtek.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] dt-bindings: usb: snps,dwc3: Add
 'snps,fixed_dwc3_globals_regs_start' quirk
Thread-Topic: [PATCH v1 2/2] dt-bindings: usb: snps,dwc3: Add
 'snps,fixed_dwc3_globals_regs_start' quirk
Thread-Index: AQHZaRcw+gfkRyRuuUGnVgp9YLQVcq8gt86A
Date:   Sat, 8 Apr 2023 02:51:21 +0000
Message-ID: <20230408025119.jmiosqxbh2lzjefy@synopsys.com>
References: <20230407060703.19469-1-stanley_chang@realtek.com>
 <20230407060703.19469-2-stanley_chang@realtek.com>
In-Reply-To: <20230407060703.19469-2-stanley_chang@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MW3PR12MB4410:EE_
x-ms-office365-filtering-correlation-id: d040c9cb-4962-4def-2f67-08db37dc229d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZzKuDNzxgsViUtJpzetSMj0xX1a1WkbREoEN8Svbnoy8CfgePYRtlqhlC1SwdWtlfTLfjz+AwxIljUXX97AwTsMswxxqp2SarYcJq/yvUKbZYCjTSNRvBQySSa1sfmNLMeMNFC47PFIzXFfBAP9M2sQoa3jZ29Q08KVVaHSXhnPtbzQBuG0s/v0g2BWaJRdxkHfLHXpvrLNNzbPOtBUJ8Szqw3ckLbZN5PYz92JoY3MkWgu53FFiKyAcYA7JgsAa8ZwGIsXZB7bLZRpYc7AqArpO2JnhJyGQJgpL/n3xAlqwDNFuyHK869+AYeWx59WRocTltg+Cr3Ziqa1G6/Za42ItJtNRwh2A9h5qtN4nrK3WjVkrlEtMv/tqQwojDn/WgBj9EoLyACrpx/qSE4g7cmGkzNoo0bsrmEm/B1l1nmz124ZuVWgjVsuALiDUA6UtNJI8wsKxMguAeDDCfXMYiYhitUUACSF3UhSXIeUJO3FgAY9qv8otdjMBwc3NDvP+okLehEBeZXIwdedmUSk8UyCaP8NTWUyAOzZPyRMamsS4Fq5vWQ36h0bELJe03+MDzjkYLdpg3HD0apcPHZwVAf/t/6lv281MLMVBmUjg4015trw0gfRcjYSirQwJrbUn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(36756003)(38100700002)(66946007)(64756008)(5660300002)(2906002)(66446008)(6916009)(122000001)(8676002)(4326008)(66476007)(86362001)(66556008)(41300700001)(76116006)(8936002)(38070700005)(6486002)(2616005)(186003)(26005)(6506007)(1076003)(54906003)(6512007)(478600001)(316002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWMvM2RCUDVJQStLakR1Yzh1dFdvTTh1V3RYT3ZLb0xxK0hPQnJ1Mjc2ME5j?=
 =?utf-8?B?NXNNYkxNVi9XUEZwSUQ5VHVwcjNIWHErZFF5OVh6MjZSS2NERmRQTm80L3pH?=
 =?utf-8?B?dmRuMXJjdGhnalFwd0xCK3lMazc1SkdockhSNUJDWjNUZnlESDd0K3FGNDNo?=
 =?utf-8?B?NXU2SmVFUzZ2ZU83YWgzN091WEdEUldUK0xvQmw3cjFHZFVJdFZWaDJmMHlG?=
 =?utf-8?B?RTE3RmkraittOUFxYnl1TlhPM0pFRWFRaWwrT1kzVCtZblZzVExBamNkQVc2?=
 =?utf-8?B?OWFNTUcyaFRIaGNtd3NFNE5rckROMEErOHpxUlMxclNWeTllNjltWW1DeXBB?=
 =?utf-8?B?eGxkcG8vbUVLaE51bXoxSGthZHQ2YnAvNk9DejBqdjZSOHJ6UXRvUksxUkQ5?=
 =?utf-8?B?TWNHTnZ2bml2RzZUQkhPZ2tIT0JVdGNVaEZ4YjdMODUvU2FZb0ZYczBOVU53?=
 =?utf-8?B?NVIycTBaeXNyd01vMXVoU0dsS3pPR0VsMUNYZkhwclhXcFFyd0tCdEN1Zmox?=
 =?utf-8?B?Q0FWWGVjMUZmWkNCVEVRWkt3T3Axd1lFdU00SWF4RWEya3RyRzZXdEtxRFZh?=
 =?utf-8?B?a0ZZa1h2YS9IaDZLWjVYeGpUSURIOStnOFFoeXVQVnlUaEcvNHlieXRCUGxy?=
 =?utf-8?B?NmpIRkhzcy9BcnFYVEdwNkRVRThKZkxVS3R0VGl3UTV5ZFptRVhzYk9aOXBw?=
 =?utf-8?B?NlRLYWZIdk1DQnlFVGNuNFFaMTRwcFhQSnhuRFc0YVlGNlluMWtIVmx3d0lu?=
 =?utf-8?B?eUZPQW1DNmYzMUhTVkFlb2hsMHpGL25yc0t3OVVPZnduNisyL0NuS09oSk5y?=
 =?utf-8?B?QWtaUnZNc1hTWnNGSE1mY1krbnVROFVMSEJJc0t1SnhocEtITGtxNHhaSEFP?=
 =?utf-8?B?RzF4ZWh3SkF4aWhaeW8xOUllSmhWYjhlbFk1eCtGTmRldllHNHF2N2dtTzhH?=
 =?utf-8?B?cG5GVkxNNWlqT1NJVS9wc2JPeVNxUEVJZHQ2dktXRHQ1NWFBTHM3ejVZZ1Bz?=
 =?utf-8?B?UlNGR2FTY0pYWHMxMXBWdGQrZEJtSFNtVHJNSk44L3FrRmtYY01oNkllZDJ3?=
 =?utf-8?B?MnJRNjFyckhIOXJiZGRpNjFNbXBKUTdkbnZnWUN0Q2tUYkVFbDdxVG1qV1Ji?=
 =?utf-8?B?S3cyZkl3cWVGemVodCtENHlXelR2QTNyMklWekhVckdrWTQ5bEpXNmNRU01v?=
 =?utf-8?B?SzdNcGhmV2JZdXVBcWQ4ZEt1cE4wbFlFODdETGN3UUZwTnB4YWdVWnlZRWpi?=
 =?utf-8?B?ejVWRDZ6ZHpmZngzdWdCbHF4cHd5V212QmtRL3IzZHZocEd0ZTRwcDNPS2Nh?=
 =?utf-8?B?RlRRZzZ1bm1yOEhmUEJJbjZxNy81TXVPaGxacVgxODBRV1lVM0h4S3Y1d3lK?=
 =?utf-8?B?Z1V0ZGtBSWZJdEU3UUZMVVRNQy9aL3grNFpRampXWmhqK1FaUXZsYmpGa3g4?=
 =?utf-8?B?ZG51YmxPNWRlSmNOaG1tVVdGY09yQkhCbjF2OHZyZzRVU0FyUlVFYXJzY2lS?=
 =?utf-8?B?RFRUM1k0RGNoMVNQZll3blBqUWxOOCtGejh4K0lqTGY1YzdPN2gwMStYdXh5?=
 =?utf-8?B?eFdYTGhSdGxJdFdGKzZZaEh6U2FDb08zYmxmYlVMeHNoOXNnVnE0cEo1R0U2?=
 =?utf-8?B?Unh6VlBiVEtzMXdjb1FMbFpBYWNraUExOW56RVJPZ3RYUml3NEs3WlhoczRV?=
 =?utf-8?B?aitNVUlPdUt5WDRzKzNMd3BGay9TM2FNUWJpazl6QVpBRDBJTW9zU29VbDBq?=
 =?utf-8?B?NldtMGtubmhLclU3bXJjdmRoUnAzUDVNekV2VU5iZzdqK09jR1BUMnpaYklr?=
 =?utf-8?B?c1c1YlBRRXUzSWQ1U3lNeisyeEZRQ29HZUhpNTNJQVhZU1VibFVpMkMwRnJS?=
 =?utf-8?B?RDN3ZjZndWxRNm9ya3NZMEF2bVo2bUJKY1g3WWkrNmh5dGpzQmE5YnhNQmhW?=
 =?utf-8?B?SnJkaENya2FMVEVGSFlRWnl3akp1djNFTzN1NWFWNmR0V1Z0QXRsK0lMWHlV?=
 =?utf-8?B?QWt6RFhqNjFFZnl0QStpMmdtSGYyNjVrTTFXTC9oTTlJeHFpZ2RnVWdvaThj?=
 =?utf-8?B?Skx5enpWSmk1eTZPeTVkOEkyL3dhS3ZoczBSMXhOL1ZLL2xnSHgzMkhORkdq?=
 =?utf-8?Q?SPKAO/EBBsiAzxMVq0C98E9+k?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <590BF9FCC054BD4D9BA7C2FAE128649A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nO3Pf53uKncWSQzUqIacM2GAA4lOQBHZ2j5HZgQBqT/nRPBS+asVWgoavWrep2chjzvHzlaiZd8uLfAEO+sT/JLoZsCNipvzdKy/2ybIT3h4dTIWdvg+AELNhV75aB5hvse//BI/lNMi/k9aECvt2cH0VRjGNE4UqOj+ywLm8TPhcWwPIE7uE+4pfUhnTcdYY762y5XZNYhIHB19fEo883g9Dhc+JHnfAv1h9G9/k9KPKBLA3uvMhPUpG5hgay+BPv01dbVCeEOzbXs7E57T+UX1iMkAVuKq+MGt9zBUrq9P6NVSCrnyLI8h8jl1mIDRMX2ZRjN6A9J6zxNcjdbysug5pHcyz3IEDR8N+5nkrwvTgZmVvrrA5kEi+4Lwsa56j0uqAthqdto/8/DmK2Qlj8eZC3xBAkgoykB/2Ay4KFSyZ21NxAIaBxFMY5ucJeoh1jwwSxVmAD+9B2RGJWqu5wr3pGCcLr1XACV/cTelKMZcAsBrADVaffu0bfAVkUb23jaN0xaYzMnOvZuMXYx62m7Y4t4hO+BjE37/+RRHdVPWZFkZ8JIrI2K4riw04qARll8EmPRZCw1xeMUuiEntUbqw6h2cYndJldH79SP0g5adAhFknIeaiI3mJL8XOIZvshugE6lIxLBpuXLSD5axwIlPIMypTnDwDmvGuz26SJvr4vxb4b8S9Sb/JbM0vc8w7/eKJ9Y/6UAp+DDpc3iHaQCe6IAU/3jqRral9/E+j6bF3WlF9inEfeAILwUm6W6kQLzvsagri2IFAp7a3BgJo2dLBC0/h5jgvtVP37v4ALuYY1cPyELLTCMtU6S0Pp0/upAUXKGWMQRMNdGTPI4CYw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d040c9cb-4962-4def-2f67-08db37dc229d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2023 02:51:21.6110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZnBlawPYv4QQsCUvqqmmJpOMSFf4HyLhAewxkB5Lx203PVWlXSFp5D41MF0d/l86ERmD5ln1vxA0Fi/ATQ9A4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410
X-Proofpoint-ORIG-GUID: e72x_W8yi93kC846Qkf0v8XoF1LtshLn
X-Proofpoint-GUID: e72x_W8yi93kC846Qkf0v8XoF1LtshLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_16,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 mlxlogscore=842
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304080023
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBBcHIgMDcsIDIwMjMsIFN0YW5sZXkgQ2hhbmcgd3JvdGU6DQo+IEFkZCBhIG5ldyAn
c25wcyxmaXhlZF9kd2MzX2dsb2JhbHNfcmVnc19zdGFydCcgRFQgdG8gZHdjMyBjb3JlIHRvIHJl
bWFwDQo+IHRoZSBnbG9iYWwgcmVnaXN0ZXIgc3RhcnQgYWRkcmVzcw0KPiANCj4gVGhlIFJUSyBE
SEMgU29DcyB3ZXJlIGRlc2lnbmVkIHRoZSBnbG9iYWwgcmVnaXN0ZXIgYWRkcmVzcyBvZmZzZXQg
YXQgMHg4MTAwLg0KPiBUaGUgZGVmYXVsdCBhZGRyZXNzIGlzIGF0IERXQzNfR0xPQkFMU19SRUdT
X1NUQVJUICgweGMxMDApLg0KPiBUaGVyZWZvcmUsIGFkZCB0aGUgcHJvcGVydHkgb2YgZGV2aWNl
LXRyZWUgdG8gYWRqdXN0IHRoaXMgc3RhcnQgYWRkcmVzcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFN0YW5sZXkgQ2hhbmcgPHN0YW5sZXlfY2hhbmdAcmVhbHRlay5jb20+DQo+IC0tLQ0KPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMueWFtbCB8IDcgKysr
KysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc25wcyxkd2MzLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy55YW1sDQo+
IGluZGV4IGJlMzY5NTZhZjUzYi4uYTU1OTlkOTc3ZGI2IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy55YW1sDQo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc25wcyxkd2MzLnlhbWwNCj4gQEAg
LTM1OSw2ICszNTksMTMgQEAgcHJvcGVydGllczoNCj4gICAgICBpdGVtczoNCj4gICAgICAgIGVu
dW06IFsxLCA0LCA4LCAxNiwgMzIsIDY0LCAxMjgsIDI1Nl0NCj4gIA0KPiArICBzbnBzLGZpeGVk
X2R3YzNfZ2xvYmFsc19yZWdzX3N0YXJ0Og0KPiArICAgIGRlc2NyaXB0aW9uOg0KPiArICAgICAg
dmFsdWUgZm9yIHJlbWFwcGluZyBnbG9iYWwgcmVnaXN0ZXIgc3RhcnQgYWRkcmVzcy4gRm9yIHNv
bWUgZHdjMw0KPiArICAgICAgY29udHJvbGxlciwgdGhlIGR3YzMgZ2xvYmFsIHJlZ2lzdGVyIHN0
YXJ0IGFkZHJlc3MgaXMgbm90IGF0DQo+ICsgICAgICBkZWZhdWx0IERXQzNfR0xPQkFMU19SRUdT
X1NUQVJUICgweGMxMDApLiBUaGlzIHByb3BlcnR5IGlzIGFkZGVkIHRvDQo+ICsgICAgICBhZGp1
c3QgdGhlIGFkZHJlc3MuDQo+ICsNCj4gICAgcG9ydDoNCj4gICAgICAkcmVmOiAvc2NoZW1hcy9n
cmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gICAgICBkZXNjcmlwdGlvbjoNCj4gLS0gDQo+
IDIuMzQuMQ0KPiANCg0KVGhpcyBpc24ndCBjb21tb24uIENhbiB3ZSBjaGVjayB0aHJvdWdoIGNv
bXBhdGlibGUgc3RyaW5nIGluc3RlYWQ/DQoNClRoYW5rcywNClRoaW5o
