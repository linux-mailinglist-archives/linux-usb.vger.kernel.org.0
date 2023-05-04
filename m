Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599B96F78C4
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 00:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjEDWFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 18:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEDWFi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 18:05:38 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4549EC5;
        Thu,  4 May 2023 15:05:37 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 344HFEgY024940;
        Thu, 4 May 2023 15:05:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=3f7Gnya/liFuD00aarQUIJecifofgEPZmtLWgsnYRjA=;
 b=Mat5Av/YY0Qn80HK3thhjo3M8HN7WW2U7HQmQ3aBa8rW5IvUJF32gPuEVIp4kIk1al+a
 Qn9IoRaxIRzx/mLDI0rPjiZ/wmmDsqkM89W7FPU9RiH/V3zv+U7uZopdw9Liz9ZQ8gdl
 CZytQvMyDoobmRf/QA+t1lbNmfirPUjk5ghVemquhaAsm1v60TeTzHHiluinQbDI6+pv
 IpvxJSOeb+ul3vKxJyR0sVhJ9yvtQvOoCsU9paAUj2l1phBEiQzxVEgWNDipKdGveZun
 omx1brCllccFXxQfU8yWxmHW5E0NaM2LElXtMba1XB2JrVD9HUAjD67R5SPeCmRmVx0n dQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3q928srpsq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 May 2023 15:05:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683237924; bh=3f7Gnya/liFuD00aarQUIJecifofgEPZmtLWgsnYRjA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=cEJl+8p+GzAjKMPp1joFQX1LxPwxN5V23aJIMAyx7Jf4HgNqtiEMUi7XqaL6UUpEj
         Xw7j6QSQFKa2YNTN9g9Cranx2HeUuPdbc39M+cll2DE3cjP5ywTTjedwXC1XUvfy1I
         Dl4rfhHl0MfH5xnLvr4EYewRUiFuW8T1osu+lF6b6EvU7qcUf3KN/efa+iHCtxhfaL
         PnqONqmF2fO2hsFoq1vdIyRWsGrbmJxo5FxCycotIeBmy2m+Yq1R26yLe2oFUN53xm
         RstqrmMl+2tLNf2So/KbWN//8M/qFK68xnSzRbgyopOJ6fcZX/MKCLM5hMGOHnKwi/
         HOqVQtDjMiCrw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4D33240520;
        Thu,  4 May 2023 22:05:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id A0AFCA0083;
        Thu,  4 May 2023 22:05:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MKmwfaD/;
        dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 04C0440683;
        Thu,  4 May 2023 22:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLaR3p0USzlcwRzaMx1AN6wLquUkf43fc2Y0z1AZHb01KIAgzqKdInsaf/a6ImzBXp35P+4Rc2+qe5sxGfo+LcS5R5le1Ab+wDw2zImaNM6KEUx30xmn+Q+8tgbEby4yeKKv9Up1HwKEgl+g3+gtZ78GA/nHBkGjpt64Fny0HW2cD3c72zOlxbHBBBpM6DbBCoQHoD4kMSkvYk5x/7d9dB6Q5dRBR1QQA61pjMquVXyQZorNJzGZ3k1ks2lxz9U0MDaSmu9JJEjRMyssyegtIqt3gNPqIOrg6IOmKotczlgLJw8EfsRUgNOupdApVReY+8RSq0TIPD9Iy+jH5KbNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3f7Gnya/liFuD00aarQUIJecifofgEPZmtLWgsnYRjA=;
 b=ZEytZHDYEME+xisPIfSmsSFxze83U/cBNgTFJ+4Wj8+g6D9uwriQvR8OJQVcrtd5Pf4AdowxAWb0vgPX8lQ3oXDZWpbLvuCIhqDx7npf6pcAP+p5EIRpi601etN97A25w6lKiuWNEdPwINaMuNm2Eyx/gLXHeL+VmoyItjG9VXDxWH1Fz1foi22aI2A+Fry1TeoZpzecMycQ7QWv0fDHggsjhemiauHsBWmARef4Xq+AAN23yLMC7cgyGo0IY1FsFTR6J2kNGjrYK4llwrHR0uWnUksAijTKr2apt0x0OPuaQdoOCYzfPewQUl/ZNXm+AlyG1oxGcAGyKY4ZQFGqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f7Gnya/liFuD00aarQUIJecifofgEPZmtLWgsnYRjA=;
 b=MKmwfaD/A66thcOpbbf3jHTErK6p3XQxRSto7vH5Tlkzg4zfwebszxR9XLR56XdPr93AW+uPdaQahOumOOTNhDAaR3+PZNFP70GDY0WDYRHXJOBZ66KjeT/FvWqg6wDc7aWgUzoVLbDzjbIdF7Vpn4ain4/4tDc74byXRpD3+ik=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Thu, 4 May
 2023 22:05:17 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 22:05:17 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Johan Hovold <johan+linaro@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: fix a test for error in dwc3_core_init()
Thread-Topic: [PATCH] usb: dwc3: fix a test for error in dwc3_core_init()
Thread-Index: AQHZfpkNh9k9kq6hMUOVf5pHFAzxkq9Kq88A
Date:   Thu, 4 May 2023 22:05:17 +0000
Message-ID: <20230504220514.2ughlqea6l6oawnv@synopsys.com>
References: <d0c5a04f-deee-4ebe-9b0b-dc5492564519@kili.mountain>
In-Reply-To: <d0c5a04f-deee-4ebe-9b0b-dc5492564519@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ2PR12MB7917:EE_
x-ms-office365-filtering-correlation-id: ebafebed-e9aa-4af0-8c6e-08db4ceba517
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PD8CcT7inC/z17CLNYA7UtsLu/zbSLE5jezGzS+//VrbZUg/cF0blHOAy+pOwbsnPfknA510hn6EnSpB1lvkW1jWdjo1e9bMM0PKLiGkKcpeTWbdbf0ZlAqgyV0QS1FkZt6Pzz5iw2d2mJvC3C5qazSCagHocjnJA/PeAjLnNvfY4mu0wS8QY+6c4bR5mY1YLlth71azsB3Q7XRixyA04w5vat2Fqbd6G/t+wK5vxFm0XYBp8vS7YZE2QMMg3QoBhOXh4SHRiIdIcQAUleZ6uP1sNIHFYBsIsjFmjzzM1dQAu2wICF8hRx2/tfRV9azTG2edn0P5omF5otzfHUwJrg5lAWJlbSl2e3ANI1hQV7+LfLPwYHkG6C0FNKmPOHeDMiNFN7ZrbuddkPdsbekk/5PrMpdxAP1ZW4NE39Xb/PEwdreXwakV3ejOoaqKu32bV26iqlgPkBEve20UYkVv9rdX0J6izf5w7eYUvee1FrSSJ3f8vnHhdwqJvGiRVjkPe50M7AojstjenojDoy4r8+jujsqnUMu1RHHEhjjRHGt1clLOy9amNwaH4TARkfTbDC+8bS5yR/X7KrrLhN3roXdPSRGXyYJbz4h0IlbuxrTLbtwMrrRYtopgseGmyrPk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199021)(478600001)(186003)(54906003)(2616005)(36756003)(6512007)(71200400001)(6486002)(316002)(66476007)(1076003)(26005)(6506007)(83380400001)(66946007)(66556008)(76116006)(66446008)(4326008)(64756008)(6916009)(2906002)(8936002)(41300700001)(5660300002)(8676002)(4744005)(122000001)(38100700002)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlJZSVlodkhKMmx1cDNoUVAvWVZxbkorVEJORmhaNnFPblZKK2NJcnRDbzk2?=
 =?utf-8?B?RnFPeU1oeXlJcmM4YzVjeXRaK2l5Zld5RGpJMEJNN0U0ZjNSQWQrczJRalFJ?=
 =?utf-8?B?S1plbnVXcVIxN1lXOWw2cEJXUThGSTZ6dkhJcElOdmhHcXBGMm1hNG1YQnpi?=
 =?utf-8?B?eFd0ZDFocmhNd2daOE9EcEpNL0VHbllXZ3NJUnhVSXgvbTd1REdCajRXVTBX?=
 =?utf-8?B?VnFyLytJY2FnbU5SMm52ODcvcWg4aXF5TzA5NysxbWlKQjJGMm54VFpacnRs?=
 =?utf-8?B?SUN4K0VwNFN5T1dIYUFTSmhtZGxIUzBpMkx0VHpVUTVHY2dnWEU3UG9Ha3p0?=
 =?utf-8?B?UXBTaVZqTEF0ZEZnQmhFRXNLSWQ5dURCY1pwZXZKYnZJeTB2WXAyZ2RVc01s?=
 =?utf-8?B?QU5INWFoYUlqNnJtZURZVFhVRXdSSDlNcTZVbS8zR0twaTU4YzNqMitsMnE2?=
 =?utf-8?B?eHMraEN2WlV1dTNrK2x1UC9MZkhYdlBjWS9rTW9wUHF3dWV0a3RYTWNxdzU4?=
 =?utf-8?B?ZGV2R0wvZk83NjJhQWZIZVJtS1k3T3puSjBnQmJDZzdwUndZaEQrenlSSFRP?=
 =?utf-8?B?U3ZCd1hzNUt4WGJwSFBmcWhIeHd0cHpya0ZFTkhEQ1VpUVZ6TjNkOFk0RnFT?=
 =?utf-8?B?TnEyUWRWTi9kSFJQd3pncUN0dlJxUU0wOWFXbjhTMGhyVVZtY04xQ3g4NzA4?=
 =?utf-8?B?WUxkTVhCS2ZvcmFqbVkyS2p0TnJnL3lSTmZZYTVwN3hnYjZBa1R0YkhOcWRU?=
 =?utf-8?B?UHZRY0RtNnozcW1rQ3pGU1d3K3hPUXB3ZUJmdlV2NUd6OWRkY3RDUC9Xb2Vh?=
 =?utf-8?B?UHVtc0ZZd1QrZXBzR1BhNmg5ek5vODJmNkU1YWljbk5oeTVTZHpyN2FzYWFM?=
 =?utf-8?B?YjNzOFJlRDNnSXpoVW1aUlZSNDFuRVE0Y3Y5czBMUzd6Q25IcldSZDBmdzhG?=
 =?utf-8?B?OHVMa3FLbHY0R0ovSG45V0RBSEQ4S1Iwd2YyQW5iTlZURUFxMGxpOVdSMTUz?=
 =?utf-8?B?cjY3cHdKbG8vUXN6b1NGRUJ6ckR6RDNsZzF0clpjWmdYeVpGRG4vNGFpOGpm?=
 =?utf-8?B?czRqNDZKYUlDM2c0SnFlTVBBUkxOOTZXNGVNeExhdys3azhCa2xjZFJFTTRX?=
 =?utf-8?B?a3FITGMvZUhIU0Z3NDJ5QnBEYUlhT1o3NGRGVzgrbjJTSmY3bEU1bnN5NjRW?=
 =?utf-8?B?ZnFoaDh5TSsxeVdqenE2WjRZZUs4ZDBtZ3c3V2lFZDl4WUxkOTdFRlRVRW5R?=
 =?utf-8?B?MGVWVE5zYmFmOU1jU2Y4d2o3NWtFWGVWcHAzWEpPbmJmaEtyME9Ta1FOTGdU?=
 =?utf-8?B?QXNlLzc0anloNXlzWUdpRC9TTFNiZWxSMVBQWDBTR1l5Wm9paHdXWTUzTGU5?=
 =?utf-8?B?M3hNU3FaUkJ3QmlqSVlSUlYwemtjTDliaGpnZWczR1hQYnhWdmIvWnpsU1p6?=
 =?utf-8?B?N1R4dmVjT3lRTUh2Tmcwd0NEVy85R3lkSWJMU25iVkMzTVBQZWVDL253STdt?=
 =?utf-8?B?M0Z2ZHVJTkRNcS82MDZNZmU2MDJ6NnBMNHJWcEl1bFBrQkpCdDdjQThhSlJq?=
 =?utf-8?B?NDNJVjRybmh5SWlDdi8yMTJMMGxrd29BOEQ1V3pkaitPYmkwemdqbyt3K210?=
 =?utf-8?B?cGFkMitDM0ZoSlVQRHl6MzU1RWI2RDkzZENhdGVLYklSTEI5Ty84bWl3M21T?=
 =?utf-8?B?RE1VaDNlbDE4VHBwUGUwaEJ5NG9zb0JnK2Jhb3l0ZnIySW5ZTmxkT1lxWVNM?=
 =?utf-8?B?c3NFQVBoMmo1VitHamsxUnlSaEFycGxHTHNMMHRuV2xUZS9Sdkl4TmFEY2ND?=
 =?utf-8?B?OXcraTI1VTFRb0dydWxnSm1XN010VmFCMisvbEIzVTFzaTYwRGlJYjJ4MHlt?=
 =?utf-8?B?LytUa1EwK051QUo4ZGVIT2l1cmtwMVV0cmFweHI5VzUzcHcxaXpqSzJFbnZq?=
 =?utf-8?B?bTl0MVRKOTRtVjZTWTd4VXRzRHRNTWRwbkpJdVFEdmRGM3h6cU43YzJOWDV5?=
 =?utf-8?B?S1V3Yzc4cFFjeHhnQk53TDI5UXA2NGllbU82a0VmTTZiMTI3UVFvVEh4Wi9j?=
 =?utf-8?B?blgyWmhXOFlzQjVtSW5TMzlMRUowcjhxVUQ5U0cxQjFhcWdJeHFUS1M5QXho?=
 =?utf-8?Q?iitS3JbSCC/sHKVytIsE1VKuF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B59B91D67FC56429C5D5A46E940AF88@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Yh/hRv+x8MisuNSrX1rsebEfdCE8JIbQWQevMFzq3+JbPs/gDcVAjW8uU1x2k/rXo2P2rRdJxL2LTkTR2NzcwxrjNdcVDAhtVM8YYi/P0eKiKIh0c9dbnzub5O5XqNIbfim+WDXyUuIWdjmSbU1/SVDn+jj5SkO5rD9vaDU3Kw3Jzvt+55Fy8EwSZ9YSgF7BPof73gVZ7K+IDa/VAnfc0vHquEDf73MZ0o57rcsM/waKl7ONzwGchGQB2dFwErDmOr2UTM5kKDSzF7vzY03x+iE2pjKA63kVVJk74U5Bwr6m2dncfdRqyYXJNhMPqK6Jc6FS8QptIu6H5mKYx1WpaQZBn2qoVpnfQO3hsBYDtPycdKjW/1Uq/pS34sAmmXD+9nDpRjdV/tRczAIoVf0wQS/ZiUWNoVO0YkoOjUoV90Or2EE8PSaW4lrDoGuyJc3tF8nS/lh0tb4OxXQdl0Il/U/q0ov2eeQsk1IGa2isJ3K7bwb7mlEjsfxmKyJVSyKJ1hEvD2L9u4RCNx0aqMdXfy6HpOoZDk/adYTf3/Gqxwm+EWy38VAjLrmaH66tUAGYuJfHIPXziYJeXE1RzapSq6osaFfpfI8kMNz6EFaOqphqOl20pgl2+4bCXOMtJS+1GcPF0sNP7h3fguRr2HlA/tk6Hb1Apf+IOWhVIgM8M2/PFTsjtGCueLIpeeKpWFAlh5PV0Ce4qOrkmpvgJw3zIMDCkZYhTkZbmC3GHHPUsxuHBd4F2zvO3IciXomaFXasVLMVTVtgsUVp+BAiuqYE45MbmZZKD8uUPHMi3cIeH+DISL+v8wH7JxJBzf31gnbF0X+hsf23+dO3Kzvz8WguUD+tfli2OA0q57ICp1uh+mQbOqdXz/LU1NtIxx6PlmKlaxJ9TguTwpxpVrqcX+hb33p7xhPJfWgbj0+/IPV24Q0=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebafebed-e9aa-4af0-8c6e-08db4ceba517
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 22:05:17.3536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A901FsyiRi0kkqXcAa3SlesSlxTyvcwbWXEsCrXvD+xf332k43+r4lHn5DGNtoIwLCvpirQayn9RJMFASb5pyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917
X-Proofpoint-GUID: QtaNZ365-R7cWUBOpjyrNgKO9hgdcqk0
X-Proofpoint-ORIG-GUID: QtaNZ365-R7cWUBOpjyrNgKO9hgdcqk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_13,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1011 bulkscore=0
 spamscore=0 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2305040178
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXkgMDQsIDIwMjMsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IFRoaXMgd2FzIHJl
ZmFjdG9yZWQgcmVjZW50bHkgYW5kIHRoZSAicmV0ID0gIiB3YXMgYWNjaWRlbnRhbGx5IGRlbGV0
ZWQNCj4gc28gdGhlIGVycm9ycyBhcmVuJ3QgY2hlY2tlZC4NCj4gDQo+IEZpeGVzOiAxZDcyZmFi
NDc2NTYgKCJVU0I6IGR3YzM6IHJlZmFjdG9yIHBoeSBoYW5kbGluZyIpDQo+IFNpZ25lZC1vZmYt
Ynk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBk
cml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggMGJlYWFiOTMyZTdk
Li43YjJjZTAxM2NjNWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0xMTM3LDcgKzExMzcsNyBAQCBz
dGF0aWMgaW50IGR3YzNfY29yZV9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICANCj4gIAlkd2Mz
X3NldF9pbmNyX2J1cnN0X3R5cGUoZHdjKTsNCj4gIA0KPiAtCWR3YzNfcGh5X3Bvd2VyX29uKGR3
Yyk7DQo+ICsJcmV0ID0gZHdjM19waHlfcG93ZXJfb24oZHdjKTsNCj4gIAlpZiAocmV0KQ0KPiAg
CQlnb3RvIGVycl9leGl0X3BoeTsNCj4gIA0KPiAtLSANCj4gMi4zOS4yDQo+IA0KDQpBY2tlZC1i
eTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpU
aGluaA==
