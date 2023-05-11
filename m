Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3E76FE8B5
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 02:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbjEKAc2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 20:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjEKAc1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 20:32:27 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D5C55BE
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 17:32:25 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34ANswxk016093;
        Wed, 10 May 2023 17:32:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=VMUgIMCMh/qbj3DT0hLgdbAZRszZcBqP5ZqUG+r2j2o=;
 b=aF9MKkow8ko5G5mOafV3Gtb2UTsGOsgmeenbBup7tWekcB1PbObdyke5g1jqqQprMIbz
 HK/ExXg/93/OCZbXgXHcm3GBjPn4520JF5Gd5ML/rJnJsoYv8e0AVvjgoRPsZBJub8Nr
 NnsYJPNmL6/fsnd8A0MwaniFLuU6UdslomIHHF1rRMIjNy9eqwGsoLr23+Nk8GDPRu12
 Cb3y/wlZTv8gg2gTjHflGzF8ZxG/Kj6w3O9RBXsiJh6F/dqU8N/Olp0W+yZDyWpfnTiv
 3CdMLiosgfvewNkTLJvzfCOblrAI+oOutndx5XZtyVBo0RCHSEyTpayPI9Rm0BKVEhXm AA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf772bty6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 17:32:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683765142; bh=VMUgIMCMh/qbj3DT0hLgdbAZRszZcBqP5ZqUG+r2j2o=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=h52rF7D2AgWkkJBseYM65h/TlRfoqJLAZmatYF8uz7TAfCPKHMkUuZ2oIvZM+LSYS
         LuPxjYB9clhQzpzT9pxFli+FlENGuB/X34+Es9xnHr9ZfUwmcFg5G6LeGmVmLyauKD
         F8nrB3bZSn9lvEx0LOGuO1epeG5R5Sx3Lu9nrgm/GXwM00FWfBkFWFer/z1fJqykwf
         pQCIzkmu9xxQL/DmBVcP8hMQB8RV34hxejn0XCoiVD03eo/6/vUNw6xbKMmEx4fErZ
         uOTaxZmkL2YNUaADq4EAUSuM5tui01ZFt+8RrTvLJQdnKhvVJ7j3YkEAk7PFZOppkG
         w6YSiQch6c6eA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 53BAE40407;
        Thu, 11 May 2023 00:32:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id CE876A006E;
        Thu, 11 May 2023 00:32:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=j+9aVt4s;
        dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id CDC7D40683;
        Thu, 11 May 2023 00:32:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2GcK7xW/lYF589do6ClbmpTsda0yFLMw9QBHcnPDLMeyUb0o/benMJgkUuMiPX0/WHEIl0n6HeHzrmAx3NhGaR5ORMUGzEpVOjHdD3amoHr9EpliYywr/v7IinuHSjbV7sfhBFHLZ32SfdYlOcWfVhqdiJ0m5ItKOriw20vLjQYI/UDYufhYwcrUxkpwf2wDpxvr6qDm2is7dLhOaJ68GkJXu400e5MNDTFuiVDB0y/quXE4Vup04bMdXXzsFOoHcmR1+67L6qTjmJT+raQx+e+v8zGOgdz3PzFGcRxm6L9/ASSfgIiTWg2PEnWMBn6/5VkMs/lLEpgitfRKh26xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMUgIMCMh/qbj3DT0hLgdbAZRszZcBqP5ZqUG+r2j2o=;
 b=T0BFaMskXxYYPeXyOLCjVRaf9pKC+4cx2TPA3DGvFS3UWczPXlVyEBxhEmT9BhCJhb7NZmgFI6nMZ0utXsSvpSt2mmV5DE2WyS99+6bYpyYGAvmazJLnOs3MH61QKPnFltjcVhDULwbvNHde5WX6CuXZTONhg9lyyunLCaEMErLGqj37f33ji5lcDONAf/XxFK2lGoj2PrcIkLFnZQF5QEvnMWa9HZkdeKCpmqA+UPhSmbgTwIcm4rVfMJk1s2VpRAcnY3BFu0NLGX0iUcC0ODYakVLy949xehj07DR2xffZYvcI2LWxnwa4G9pkxfcIReVyVtwfavaleHsxlCPjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMUgIMCMh/qbj3DT0hLgdbAZRszZcBqP5ZqUG+r2j2o=;
 b=j+9aVt4smN2KIAEY6g+tNNDxMK/iQ4htOyIUabDZ+Tk0JPBmsxbv0UbEubSgPCE0yYuPdm/4B+j1E3xA1wcSWZ+XT0ecCRMObx51iS8Ddxvi+pDJ66BOhmy+cBd0R0aH8r0i1nhfgNPBdwnbmQ0P4FQROt82moTlDPDwMyvF5q4=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by BL0PR12MB4913.namprd12.prod.outlook.com (2603:10b6:208:1c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 00:32:11 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 00:32:10 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v8] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Topic: [PATCH v8] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Index: AQHZguFoxFN5piRdgkmDQA1LgKQz2a9UOh0A
Date:   Thu, 11 May 2023 00:32:10 +0000
Message-ID: <20230511003134.mc2vilpbctrd6jzp@synopsys.com>
References: <20230510014718.13872-1-quic_linyyuan@quicinc.com>
In-Reply-To: <20230510014718.13872-1-quic_linyyuan@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|BL0PR12MB4913:EE_
x-ms-office365-filtering-correlation-id: be20b6a1-16af-4a39-f0c8-08db51b72883
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UgqABJrrWA9gXMu68iefzCrifnukXQ7ItEBMyMMf1tjmOL1v8ztpnI1efEj5nFcB6z7nDa2KqOUCJmaG/Jbu5LdCWUa3U6GdGSp+ZFpUOTVIweNs9QrdCSVJmR4HjJN+yA+gz/v7fr9DhpFnU2gmx1BLkU7Qao74eg4MBxh/tKD94/nD5Bv6vmJ40dWsspjZADHkM9DtSNfaha+T7ECMmOMFh4PYnyVnc0e7tHd6T76KBCaD484U0ODSSFIu8h4NPus/w3qrVRBf9yCMl3mHN2gOcdl8mRZyhqjIex5kdQI5YCfEjrVvgU2EnzJAVBruT3lzHpEG1xsQeJgvLdYuHh42BJOsVw4D5s2HrBgVBAZtY3GXOFdh9W0fUHz1wIUPTbHd1YAUPs0c7QB97QDfLn31sgqAmSdtWFihkDUEDjLnurj6LpqThJ63ym/NkqjLyjsUDypqUwMTpXF1w/87vv0vYW4XX9faMKsh/xLKFcnIrFPO0YuNl+uJnddO3tsgqg+tLAj+254pBxh9no64nS67JNX15HWjrW4y02AZSTARZmUZFYkazJ0pxIbN5jBY6WOM5jMOFdGvsDe0YaT4um2YkzsPjnkNEHyT9JA5WIU7WFpys7kRXV1cL04p5kHybEJLnCc02K53aBEN3DqtwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39850400004)(366004)(136003)(376002)(346002)(451199021)(2616005)(478600001)(83380400001)(86362001)(6486002)(71200400001)(6506007)(966005)(6512007)(1076003)(26005)(122000001)(66946007)(316002)(91956017)(54906003)(76116006)(66446008)(66556008)(66476007)(4326008)(6916009)(64756008)(186003)(41300700001)(66899021)(38100700002)(5660300002)(8936002)(8676002)(15650500001)(2906002)(38070700005)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU9rN3FZQkN2dTduSEZpcWhjMEVOL1FLKzhKd3VBMVlpWW5xQU81TE9uY3Rv?=
 =?utf-8?B?bllpMHhEUDU1MVowYnRnWEhHZVhDbEhqbFVYdUgwMlN5NzZ1N0pCWVh2SjFQ?=
 =?utf-8?B?cHZhL0JVd01wYmsydHR5SS9Jcll5SE83cVhGcTFjSEpiY3ZhK2NkVGZqR2Vk?=
 =?utf-8?B?ZWFRMEVuOENSUkpOc1haakxLVzBERERRbHBraE5mRlJPcUZhZDJBMWdFRnR0?=
 =?utf-8?B?SHNldThTUXRrMVprbFpBSkVlbHFEeWNnb2UvemZvdHZReW51TGNWMFNJZHha?=
 =?utf-8?B?VFNLNmwwTUJEK2lqTnI1VnFrY3dIRDV1c0lDdTk0aWU2QWJjSGFacklpNDJK?=
 =?utf-8?B?cXhmeStQZ2NxUnkwcnBySytsM2xEc2pEZTNVazJLNnlaaXBGcmtnSWxiSEQ2?=
 =?utf-8?B?eUVPbkZMcFhtVTEwV0tpWmNpek8yWVliU1E3UFNud0JvczJtSUNNVll2S1hl?=
 =?utf-8?B?bzRqYXI4VEtsTnVCdk1YTW0vV0NuMitzeHNjbUtxQkhkRHQyWnVKdHNObHZa?=
 =?utf-8?B?eGNhdzc4Yys3ZGp3cnpSN3BuZUpGMTlNVVhscGFIWUhtMW0xUWlaNTRwV2Z6?=
 =?utf-8?B?Mjk2UmQyWUFGVTBYbmxJaXhOOU1IZXN4M1ZmdGovclJOcjFiYWVSVEVyQktp?=
 =?utf-8?B?WVZhc0hlem1Xa3NUS3czM21DWStmRGtNdXlqdHVteEV1T25hSUlENldnN3ov?=
 =?utf-8?B?b0hCRzl5d3RlSTVDTmJqRXhvMkxRQXliOEFJN283Sk5WNVJKWDZLVEk1RXhq?=
 =?utf-8?B?SjFmVG95dWw0WFoxNnN0TUdBMmE5TXdMS1hCRWROcjloQzJKVjY5SjNJZThV?=
 =?utf-8?B?OFRoNmNnQWUrVElwSklVVGlLaG9JU09kWll4cmdIM3lKVklDdXRDOTVqRGx6?=
 =?utf-8?B?VnpLbUs2aStnQnd2YnZGT2xXT3QxdTdKaStiUlljWjlMeitqZzBSdzBYaDBr?=
 =?utf-8?B?a0Y3anRpa2FCVFRiUnBBdkdMMXB0Mi9QdXFkN0dpSmFUZjFqdDVYblI0eWNw?=
 =?utf-8?B?OElpcWRsSUdpc2VueWU4eWpBSTRPbEx2OFRXRjZadEVrZURGS2wyOFBtRkFv?=
 =?utf-8?B?Nml5RnQyczByTDV5US9DVnJNdHViMmZERHhibWE2eGZlUmR3SVpOR3NVNEc3?=
 =?utf-8?B?YWpEUUdUbkY4VU05Q051RjhEYVBXY1lBdHZzWUJldUFLZWFNUDg2L0UwUUph?=
 =?utf-8?B?UitGTHM3SHI4SEYxSHpIekNPTFhzTE9sSHc3Qy9xTml5N3Z4aktFRnBNNmdB?=
 =?utf-8?B?dEw1dnJKd0NaYXA4WmxaeFJKRy9qTWNoMWRGbDEzcWtNWnFORkFpQ0JNZG5V?=
 =?utf-8?B?aVBSRWVONXkya0NkMmVObExiaDAzN29iVldyWDNsVUpTYnU5QnQvd3hkYTdn?=
 =?utf-8?B?RUxBbzFlc1dDQnM5QW96LzJKQlZLREwvSVluOU1Ray9OM3lpajhDQm1TQnVZ?=
 =?utf-8?B?dllsRWtiRFlMeVZTajc3bjdVcFNXZHFuR3oxUG52YnVWZHdUMm9tN0VaTEZT?=
 =?utf-8?B?aDZrZloram9DWUM0WHRDR1JJYm8rVEJDMWlMWU5ESWx2VnVGdGxNVTB3MHFD?=
 =?utf-8?B?RGh0SHBjUmVucGxIdU9kd001Q1UzYndTdU5NcWw4dzU5S0JDRlhEZGRFTzVs?=
 =?utf-8?B?RHJMUFN1azErYUdQQXRLM1hEYktrOXQ2dWlmMjVqRUU5bDMrc2Y4MjdNN1pH?=
 =?utf-8?B?SllTUitkaDFZMnR5UXo3OFJISkpBOGdtYVNHL2pLRjlxb0ZPY3djMGlVOTJD?=
 =?utf-8?B?UzV5WG11emFkLzhKZXlHVjZpVGRCWnpIcjY5eURGOXYzYytrKzBUdjZlS2F2?=
 =?utf-8?B?SzNudDVHNE42OUE0ZEdZWDcwcmpMVmxFY3JRTjhFUWxjck41K1VYWC9lR2M2?=
 =?utf-8?B?V0NING9oTXd1SmQ4ZjFwRXN0bUlQeTdiMXRKOUZndFBsZzhvcGgwZndQblRY?=
 =?utf-8?B?Tk5oeGY0OXFuVi9HOGRkRFJZRGhzU1grS0V0R25LUTJXME9mbFIyNXM2VC9h?=
 =?utf-8?B?UXR2Sk9oMmp5dDYrQjVQRGpVdzhNRlEya0FuVFg3TTE3bzJiNjVldW1nMEZJ?=
 =?utf-8?B?SzFxbUh3S01tbFEvZVJIaU96M2wxUG1jcGZ1aU9tdXE0U3BEajZKTWhHZXlW?=
 =?utf-8?Q?TI5JZgZm73jNWBTGKqIH3y2YG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB778321C45B8E4CA7308F2EBB51CD6B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pI2ez69ZT3X9CclSKQC9MkSdTWZCSIRcnlDufiDWbWa8z2CvN6PJ0K0zNQOlESV58+0n5Nqh9WKHEnMX/8MII1zmXipc1+Y/mzZGVIwafkbx6tg2rFOU0DFswC98VCdm6pirGEN6agGxTK0hWhqETAk5jiOQAMAP6vJ/O2bdfCe30xh3xJK/5sQ5W+VSyyPOXlaBtMPjt/50Iwlyn+6UbkEynl7Om+UbboMKkowXKdS07goIF4drQ0KQ5u4CF2vFRLU1Vc6y12iGQuz5rLCF1Uuvip9ROY4cafz9Y7WV31CG/diFdB3Ab17oNtpYoG6F/vvc2yZs4TP/uoSSSXP8HSP1FgUWm3O4Oq1Kc95VHS7QXtjTZww1iEFqr4v/nhg/lBtcGi4piIKkdbyoFJzbJhVeX3zlwOgzk4n8QbsDDo5P5ZyTPYbPWFsKxsTrXPuKw0KuVeJTzfH+XADTK61aeB1KTSFD7detmDnTv6jx/AUrq3gYHc1E5jvRCYCceAumgDVTOT6Bde+Uwu9mBhM292CBYSuh5elaRYa5JM/di8GUekWAA5iwfInLkCeZlwX70wh7cK2OyzXz9r5L94WfZ8t9WQHeCFkil57DtIuNmZn8LgOpRD8WlajqwrsHOkPYGC8vmYD1KTSZVnupdpJPjdf+mSNFQEO4KJXilC619sPG6CVvZEymRdN8IdQqufoULc7tQrkYtcWTs+fpc4Or6Viy06Dp126jfiGeP137Du1HNEhAPZajwDZq/nxqz8W8VOH8GpAgujquGKaxGo8bIH2FPzgVQg9hbIIrPVlMv4MgFtdX20DJ/ohTP19LaVCY62zXkZ5uXvVEuk+GR1m8sEU+GdddUPPcf9SitnZ9NzT+VEfU4JmLzVRWM4BU25/u21tXCDTXUSM8efkxlJUIug==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be20b6a1-16af-4a39-f0c8-08db51b72883
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 00:32:10.3364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p1ksQWYPVXTeYQrY6GUnEoxHPKsJfDMP8Twgl2w9cJk5ybIgQ8gVhFKqq6BVqqJOqIennyQ0txhN6pZO6WNGiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4913
X-Proofpoint-GUID: UgFYsS2kbPUbOV2_VtPHPewW62QMk5qu
X-Proofpoint-ORIG-GUID: UgFYsS2kbPUbOV2_VtPHPewW62QMk5qu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110002
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBNYXkgMTAsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IFdoZW4gd29yayBpbiBn
YWRnZXQgbW9kZSwgY3VycmVudGx5IGRyaXZlciBkb2Vzbid0IHVwZGF0ZSBzb2Z0d2FyZSBsZXZl
bA0KPiBsaW5rX3N0YXRlIGNvcnJlY3RseSBhcyBsaW5rIHN0YXRlIGNoYW5nZSBldmVudCBpcyBu
b3QgZW5hYmxlZCBmb3IgbW9zdA0KPiBkZXZpY2VzLCBpbiBmdW5jdGlvbiBkd2MzX2dhZGdldF9z
dXNwZW5kX2ludGVycnVwdCgpLCBpdCB3aWxsIG9ubHkgcGFzcw0KPiBzdXNwZW5kIGV2ZW50IHRv
IFVEQyBjb3JlIHdoZW4gc29mdHdhcmUgbGV2ZWwgbGluayBzdGF0ZSBjaGFuZ2VzLCBzbyB3aGVu
DQo+IGludGVycnVwdCBnZW5lcmF0ZWQgaW4gc2VxdWVuY2VzIG9mIHN1c3BlbmQgLT4gcmVzZXQg
LT4gY29ubmRvbmUgLT4NCj4gc3VzcGVuZCwgbGluayBzdGF0ZSBpcyBub3QgdXBkYXRlZCBkdXJp
bmcgcmVzZXQgYW5kIGNvbm5kb25lLCBzbyBzZWNvbmQNCj4gc3VzcGVuZCBpbnRlcnJ1cHQgZXZl
bnQgd2lsbCBub3QgcGFzcyB0byBVREMgY29yZS4NCj4gDQo+IFJlbW92ZSBsaW5rX3N0YXRlIGNv
bXBhcmUgaW4gZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoKSBhbmQgYWRkIGENCj4gc3Vz
cGVuZGVkIGZsYWcgdG8gcmVwbGFjZSB0aGUgY29tcGFyZSBmdW5jdGlvbi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IExpbnl1IFl1YW4gPHF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20+DQoNCkNhbiB5
b3UgYWRkIGEgRml4ZXMgdGFnPyBIZXJlJ3MgdGhlIGFjayBhZnRlciB0aGF0J3MgYWRkZWQ6DQoN
CkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRo
YW5rcyENClRoaW5oDQoNCg0KPiAtLS0NCj4gDQo+IHY4OiAocmVmZXIgdjcgaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8yMDIzMDUw
OTA1MDc0My41NzgxLTEtcXVpY19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGch
Y3FpTXJnanhVRWhSMXVVQXdPLWhfQlhDUmFUNUtHZ0Rnd0tPTFJnWTZkQTdnMUNDOUhQYzlkcVRW
Q2taM251UTRBcF93ZGdkN3pacDlCZHFqdklLNUJJbTNfdkYwZyQgKQ0KPiAxKSBtb3ZlIHNvbWUg
c3VzcGVuZGVkIGZsYWcgY2xlYXIgdG8gc3BlY2lmaWMgZXZlbnQgaGFuZGxlcg0KPiANCj4gdjc6
IChyZWZlciB2NiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtdXNiLzIwMjMwNTA1MDE0OTAyLjI3MzEzLTEtcXVpY19saW55eXVhbkBxdWlj
aW5jLmNvbS9fXzshIUE0RjJSOUdfcGchY3FpTXJnanhVRWhSMXVVQXdPLWhfQlhDUmFUNUtHZ0Rn
d0tPTFJnWTZkQTdnMUNDOUhQYzlkcVRWQ2taM251UTRBcF93ZGdkN3pacDlCZHFqdklLNUJMNEI5
eHJ1dyQgKQ0KPiAxKSByZXdvcmQgc3VzcGVuZGVkIGZsYWcgY29tbWVudA0KPiAyKSByZW1vdmUg
b25lIGV4dHJhIHNwYWNlIGluIGlmIG9wZXJhdGlvbg0KPiA0KSBjbGVhciBzdXNwZW5kZWQgZmxh
ZyBmb3Igd2FrZXVwL3Jlc2V0L2Rpc2Nvbm5lY3QgaW50ZXJydXB0DQo+IDMpIGNsZWFyIHN1c3Bl
bmRlZCBmbGFnIGZvciByZW1vdGUgd2FrZXVwIHJlbGF0ZWQgY2FzZS4NCj4gDQo+IHY2OiAocmVm
ZXIgdjUgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXVzYi8xNjgyNDc2NzgwLTIzNjctMS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFu
QHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFjcWlNcmdqeFVFaFIxdVVBd08taF9CWENSYVQ1
S0dnRGd3S09MUmdZNmRBN2cxQ0M5SFBjOWRxVFZDa1ozbnVRNEFwX3dkZ2Q3elpwOUJkcWp2SUs1
QklOTHNwMkx3JCApDQo+IDEpIGNoYW5nZSBzdWJqZWN0DQo+IDIpIG9ubHkga2VlcCBzdXNwZW5k
ZWQgZmxhZyByZWxhdGVkIGNoYW5nZQ0KPiANCj4gdjU6IChyZWZlciB2NCBodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2ODIzOTMy
NTYtMTU1NzItMS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEh
QTRGMlI5R19wZyFjcWlNcmdqeFVFaFIxdVVBd08taF9CWENSYVQ1S0dnRGd3S09MUmdZNmRBN2cx
Q0M5SFBjOWRxVFZDa1ozbnVRNEFwX3dkZ2Q3elpwOUJkcWp2SUs1Qks5UEJpeW9RJCApDQo+IDEp
IHJlbmFtZSBzdXNwZW5kX2lycV9oYXBwZW4gdG8gc3VzcGVuZGVkIGFuZCBkb2N1bWVudCBpdA0K
PiAyKSBhZGQgb2xkX2xpbmtfc3RhdGUgZm9yIGxpbmsgY2hhbmdlIGludGVycnVwdCB1c2FnZSBh
bmQgY2hhbmdlIGFjY29yZGluZ2x5DQo+IA0KPiB2NDogKHJlZmVyIHYzIGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMTY4MjA1Mzg2
MS0yMTczNy0xLWdpdC1zZW5kLWVtYWlsLXF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20vX187ISFB
NEYyUjlHX3BnIWNxaU1yZ2p4VUVoUjF1VUF3Ty1oX0JYQ1JhVDVLR2dEZ3dLT0xSZ1k2ZEE3ZzFD
QzlIUGM5ZHFUVkNrWjNudVE0QXBfd2RnZDd6WnA5QmRxanZJSzVCSkxoaDRKZ2ckICkNCj4gMSkg
cmVtb3ZlIGxpbmsgc3RhdGUgY2hlY2tpbmcgaW4gZHdjM19nYWRnZXRfd2FrZXVwX2ludGVycnVw
dCgpDQo+IDIpIHJlbW92ZSB0d28gc3dpdGNoL2Nhc2UgdG8gaWYgb3BlYXJ0aW9uDQo+IA0KPiB2
MzogKHJlZmVyIHYyIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC11c2IvMTY4MjA0MjQ3Mi0yMTIyMi0xLWdpdC1zZW5kLWVtYWlsLXF1aWNf
bGlueXl1YW5AcXVpY2luYy5jb20vX187ISFBNEYyUjlHX3BnIWNxaU1yZ2p4VUVoUjF1VUF3Ty1o
X0JYQ1JhVDVLR2dEZ3dLT0xSZ1k2ZEE3ZzFDQzlIUGM5ZHFUVkNrWjNudVE0QXBfd2RnZDd6WnA5
QmRxanZJSzVCSlQ2M1pNaUEkICkNCj4gbm8gY29kZSBjaGFuZ2Ugc2luY2UgdjIsIGNoYW5nZXMg
Y29tcGFyZSB2MSBhcyBiZWxvdywNCj4gMSkgYWRkIGEgZmxhZyBzdXNwZW5kX2lycV9oYXBwZW4g
dG8gc2ltcGxpZnkgZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoKSwNCj4gICAgaXQgd2ls
bCBhdm9pZCByZWZlciB0byBzb2Z0d2FyZSBsZXZlbCBsaW5rX3N0YXRlLCBmaW5hbGx5IGxpbmtf
c3RhdGUgd2lsbA0KPiAgICBvbmx5IHVzZWQgaW4gZHdjM19nYWRnZXRfbGlua3N0c19jaGFuZ2Vf
aW50ZXJydXB0KCkuDQo+IDIpIHJlbW92ZSBzdyBzZXR0aW5nIG9mIGxpbmtfc3RhdGUgaW4gZHdj
M19nYWRnZXRfZnVuY193YWtldXAoKQ0KPiAzKSBhZGQgZHdjM19nYWRnZXRfaW50ZXJydXB0X2Vh
cmx5KCkgdG8gY29ycmVjdCBzZXR0aW5nIG9mIGxpbmtfc3RhdGUNCj4gICAgYW5kIHN1c3BlbmRf
aXJxX2hhcHBlbi4NCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgIDIgKysNCj4g
IGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAxMiArKysrKysrKysrKy0NCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4g
aW5kZXggZDU2NDU3YzAyOTk2Li4xZjA0M2MzMWEwOTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC0x
MTE2LDYgKzExMTYsNyBAQCBzdHJ1Y3QgZHdjM19zY3JhdGNocGFkX2FycmF5IHsNCj4gICAqIEBk
aXNfbWV0YXN0YWJpbGl0eV9xdWlyazogc2V0IHRvIGRpc2FibGUgbWV0YXN0YWJpbGl0eSBxdWly
ay4NCj4gICAqIEBkaXNfc3BsaXRfcXVpcms6IHNldCB0byBkaXNhYmxlIHNwbGl0IGJvdW5kYXJ5
Lg0KPiAgICogQHdha2V1cF9jb25maWd1cmVkOiBzZXQgaWYgdGhlIGRldmljZSBpcyBjb25maWd1
cmVkIGZvciByZW1vdGUgd2FrZXVwLg0KPiArICogQHN1c3BlbmRlZDogc2V0IHRvIHRyYWNrIHN1
c3BlbmQgZXZlbnQgZHVlIHRvIFUzL0wyLg0KPiAgICogQGltb2RfaW50ZXJ2YWw6IHNldCB0aGUg
aW50ZXJydXB0IG1vZGVyYXRpb24gaW50ZXJ2YWwgaW4gMjUwbnMNCj4gICAqCQkJaW5jcmVtZW50
cyBvciAwIHRvIGRpc2FibGUuDQo+ICAgKiBAbWF4X2NmZ19lcHM6IGN1cnJlbnQgbWF4IG51bWJl
ciBvZiBJTiBlcHMgdXNlZCBhY3Jvc3MgYWxsIFVTQiBjb25maWdzLg0KPiBAQCAtMTMzMiw2ICsx
MzMzLDcgQEAgc3RydWN0IGR3YzMgew0KPiAgCXVuc2lnbmVkCQlkaXNfc3BsaXRfcXVpcms6MTsN
Cj4gIAl1bnNpZ25lZAkJYXN5bmNfY2FsbGJhY2tzOjE7DQo+ICAJdW5zaWduZWQJCXdha2V1cF9j
b25maWd1cmVkOjE7DQo+ICsJdW5zaWduZWQJCXN1c3BlbmRlZDoxOw0KPiAgDQo+ICAJdTE2CQkJ
aW1vZF9pbnRlcnZhbDsNCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRn
ZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggYzBjYTRkMTJmOTVkLi5m
MjQ0YmViZjFlYTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBAQCAtMjQ0MCw2ICsyNDQwLDcgQEAg
c3RhdGljIGludCBkd2MzX2dhZGdldF9mdW5jX3dha2V1cChzdHJ1Y3QgdXNiX2dhZGdldCAqZywg
aW50IGludGZfaWQpDQo+ICAJCQlyZXR1cm4gLUVJTlZBTDsNCj4gIAkJfQ0KPiAgCQlkd2MzX3Jl
c3VtZV9nYWRnZXQoZHdjKTsNCj4gKwkJZHdjLT5zdXNwZW5kZWQgPSBmYWxzZTsNCj4gIAkJZHdj
LT5saW5rX3N0YXRlID0gRFdDM19MSU5LX1NUQVRFX1UwOw0KPiAgCX0NCj4gIA0KPiBAQCAtMzkz
OCw2ICszOTM5LDggQEAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfZGlzY29ubmVjdF9pbnRlcnJ1
cHQoc3RydWN0IGR3YzMgKmR3YykNCj4gIHsNCj4gIAlpbnQJCQlyZWc7DQo+ICANCj4gKwlkd2Mt
PnN1c3BlbmRlZCA9IGZhbHNlOw0KPiArDQo+ICAJZHdjM19nYWRnZXRfc2V0X2xpbmtfc3RhdGUo
ZHdjLCBEV0MzX0xJTktfU1RBVEVfUlhfREVUKTsNCj4gIA0KPiAgCXJlZyA9IGR3YzNfcmVhZGwo
ZHdjLT5yZWdzLCBEV0MzX0RDVEwpOw0KPiBAQCAtMzk2Miw2ICszOTY1LDggQEAgc3RhdGljIHZv
aWQgZHdjM19nYWRnZXRfcmVzZXRfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICB7DQo+
ICAJdTMyCQkJcmVnOw0KPiAgDQo+ICsJZHdjLT5zdXNwZW5kZWQgPSBmYWxzZTsNCj4gKw0KPiAg
CS8qDQo+ICAJICogSWRlYWxseSwgZHdjM19yZXNldF9nYWRnZXQoKSB3b3VsZCB0cmlnZ2VyIHRo
ZSBmdW5jdGlvbg0KPiAgCSAqIGRyaXZlcnMgdG8gc3RvcCBhbnkgYWN0aXZlIHRyYW5zZmVycyB0
aHJvdWdoIGVwIGRpc2FibGUuDQo+IEBAIC00MTgwLDYgKzQxODUsOCBAQCBzdGF0aWMgdm9pZCBk
d2MzX2dhZGdldF9jb25uZG9uZV9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YykNCj4gIA0KPiAg
c3RhdGljIHZvaWQgZHdjM19nYWRnZXRfd2FrZXVwX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdj
LCB1bnNpZ25lZCBpbnQgZXZ0aW5mbykNCj4gIHsNCj4gKwlkd2MtPnN1c3BlbmRlZCA9IGZhbHNl
Ow0KPiArDQo+ICAJLyoNCj4gIAkgKiBUT0RPIHRha2UgY29yZSBvdXQgb2YgbG93IHBvd2VyIG1v
ZGUgd2hlbiB0aGF0J3MNCj4gIAkgKiBpbXBsZW1lbnRlZC4NCj4gQEAgLTQyNzcsNiArNDI4NCw3
IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2xpbmtzdHNfY2hhbmdlX2ludGVycnVwdChzdHJ1
Y3QgZHdjMyAqZHdjLA0KPiAgCQlpZiAoZHdjLT5nYWRnZXQtPndha2V1cF9hcm1lZCkgew0KPiAg
CQkJZHdjM19nYWRnZXRfZW5hYmxlX2xpbmtzdHNfZXZ0cyhkd2MsIGZhbHNlKTsNCj4gIAkJCWR3
YzNfcmVzdW1lX2dhZGdldChkd2MpOw0KPiArCQkJZHdjLT5zdXNwZW5kZWQgPSBmYWxzZTsNCj4g
IAkJfQ0KPiAgCQlicmVhazsNCj4gIAljYXNlIERXQzNfTElOS19TVEFURV9VMToNCj4gQEAgLTQz
MDMsOCArNDMxMSwxMCBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9zdXNwZW5kX2ludGVycnVw
dChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgew0KPiAgCWVudW0gZHdjM19saW5rX3N0YXRlIG5leHQg
PSBldnRpbmZvICYgRFdDM19MSU5LX1NUQVRFX01BU0s7DQo+ICANCj4gLQlpZiAoZHdjLT5saW5r
X3N0YXRlICE9IG5leHQgJiYgbmV4dCA9PSBEV0MzX0xJTktfU1RBVEVfVTMpDQo+ICsJaWYgKCFk
d2MtPnN1c3BlbmRlZCAmJiBuZXh0ID09IERXQzNfTElOS19TVEFURV9VMykgew0KPiArCQlkd2Mt
PnN1c3BlbmRlZCA9IHRydWU7DQo+ICAJCWR3YzNfc3VzcGVuZF9nYWRnZXQoZHdjKTsNCj4gKwl9
DQo+ICANCj4gIAlkd2MtPmxpbmtfc3RhdGUgPSBuZXh0Ow0KPiAgfQ0KPiAtLSANCj4gMi4xNy4x
DQo+IA==
