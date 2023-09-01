Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E71778F6C8
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 03:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239488AbjIABfd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Aug 2023 21:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjIABfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Aug 2023 21:35:32 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF8DE6E
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 18:35:29 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37VLgRHF004051;
        Thu, 31 Aug 2023 18:35:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=jMfFgeqHhc/xJxle1Khi6KPoQPKQfZxkEu10m0JCGJw=;
 b=ky242niW9OoJfCaqIVsTzpPHn7rtwqTtuJ2NG8Xaqep7MfWfgHx4A6nqnVDHO4N+cWxZ
 hVtWbxUbP7QX/maZ7tl8RtOWn1V1z935B867/p/Yca2fzCo/viNFJedI9TRTMWFLefIO
 YZHuBFlAxV/6L0XHUG1dWxlf4Vsyi6Gxto3HB1wi68qYEkwACBps17Jx1bcfJTJclkSD
 1migCQMe4bI5JHiiygOMQ3Wlh4ZLVKSE8vQMcX/9GXGtoYQYD6Ng/iY7wbDz66raaf0F
 l34kmz22UAa/WtYhJ+JDaxZgjBTWQNwOYB6cHc4Nnrj4YUiVm7LbK78kyWGkLE9HP351 tw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3sqgav7f01-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 31 Aug 2023 18:35:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1693532122; bh=jMfFgeqHhc/xJxle1Khi6KPoQPKQfZxkEu10m0JCGJw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=BJy+VsRbtSip0IoX+zlfYgKltUSPUr8o/Oj2h8FUIXZIXSEBicF51KzquDjZt5LkF
         UU6jfDxFLlmm3Tc9SiD8vRC6sg05vQtYc0+ljvaJVirzMaP63GB1nqJdV44mc8+kOR
         6xmpwgVWk/Kfib4MwFiy13MKO/W/k74rpwR6sioezAls/n9OQUZ4KvZJTpOtlrkDaJ
         ee7lcdVv/Zaqcs6Su/F1fYx34nuFjED0/aGAo6lQZOQFelBbAeDq7rKJQQEyMxjjtL
         CvAMS0rZp5qCDAuYRLbp4fzXEuYeLNpYrzY5JIgWzdphxkEEXFduTxDI0BOqrUUzWr
         TDbmfRP3tNCbA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 878F640136;
        Fri,  1 Sep 2023 01:35:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4ACD9A007B;
        Fri,  1 Sep 2023 01:35:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=V68GnkLB;
        dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 55FB34035A;
        Fri,  1 Sep 2023 01:35:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4O+Bp4FyzRyQ2npwgM+wmzHIq9kfC8BUtDbYfOEh5LgLcjCk2hrutKCoGchZAJxzLRKzSlnJcKXta/qMLljHRGBFXh4UFPUtzeQ5iJG+YIKEWBLZQu230FZesIICKoZ98hTUHjGjaJ+vWsn7iftA84VvXAHhJY2j1p1b+/jOYGqqK6/HiI7LZI+mOnGNUfMKT90DsZtzVDVwAHiaM2JNZQKReknvmpQPuKNnknHbyjgHw5TSIhjCfr2Ac8RtHndBQjB0Wqrhtx780udtCVSxsCQggnbOCxmEOqdawHNVyWLkmNoulv4f1FHlxVLeZtm8gPr+FbtjE5sjFVaoBLVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMfFgeqHhc/xJxle1Khi6KPoQPKQfZxkEu10m0JCGJw=;
 b=YAxzOPSbdjNVblrOlnaoww/wc2n4fpli+Zp0oU5C/y3kRVjZvNXjLCdg8XSlTiA70A5a8c1q4lZ8w61X9eoOaETFY8FVARMFWXQrLvVMEZ+FrIJjj+UFpf1nlgC/BEIjyckTJe5tfPVKTybIm8WNsbbbY3pHFuA2HyoSVBgBfnutEuJdJlKge5Y9S+nMR0yDxq2gLoML4Z+AqdH6qmjAYxs5ZilWbvzHD1yrXU49ITbCMcyNP6iXLOoEsklqVvolGI9S4WafQBPudB1JvueaSPNF4DnciUawpsV08uvMG83tllvvi4nSLq4x+TuDVoDFYvH+UmH7zyWXBGdT6ejMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMfFgeqHhc/xJxle1Khi6KPoQPKQfZxkEu10m0JCGJw=;
 b=V68GnkLBB1LgCgD6CxzKVngo9cslH6sjJd4hLXRaQifKi0fzvLAIMnvmxql0QwqNKyXT59Z0JxbbNGVmJqZAWiZLgRJ9aQt9YICqEK/1lJPmnqMc9Jtf3vTiRIV2HZkPD3AMpIriaUUTbAwxnNPESKbC6oU40TbMA5LjJXoBz3o=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 01:35:16 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f%5]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 01:35:16 +0000
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
Thread-Index: AQHZ3FhJKJr5gUY68kuSvYhFApjTyLAFL1EA
Date:   Fri, 1 Sep 2023 01:35:16 +0000
Message-ID: <20230901013118.iqpegkklfswdkoqc@synopsys.com>
References: <20230831221242.GC20651@pengutronix.de>
In-Reply-To: <20230831221242.GC20651@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BY5PR12MB4050:EE_
x-ms-office365-filtering-correlation-id: eba18dfe-9f84-4843-c44b-08dbaa8bb1f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kGV0pcfeInuzeu8yPuO72k+PrJFj3oA0cn0tMgSngk/OXtT6752ydofu72BTbzeDMMjtIy40pzx+G5qFAKULA3FwYUVYuMh/r0eQW+9W2zA8ddJYJmN+r0js+fsrpve/vLxHSP934iVWOdBFDBAM//EXZAXD3nReL7CYk4FhoWw/qPBk3xxPj9ITjHykOxpNt/NwIHRF/O3zURzWZq2/1LI9I0yOldSzoKS7E+oIYBpdlTtha262+QSYJJNqybUs9gAzmwPnTcloFnhbEQIc1ytXNN6lqPIn5jMBNEPqSJ/v0O8p6rRvpS2nCdRvSxP9OGq7HftXgyYewDaoPeIzAIIMSS/YXE5TxuUQ2xAPMCFm13qHJE60916t/Uxx6PAPHCN+t3K+ncK1jm13XbF0caDYBUYUx91EuYWpFlKb+TtOuKZxihtqh7bEesL6ypgPHP+Xpel+Kxhl0VySYWQjEi3Kq8hfuzC5Y4ymD8gUIKWGT55k2c+sgySj+YyCD22awoBPLDPAfiImOnifqx1g5YDgD05uratR1x42e92IZA2kmnuxy881iyceP1XFjqT4YxPRzc9RUJ8ikLTx5dyjW/HYxP8poBqKPzSR5Rgf4wdTImWSo+bST/3Kq38Z/HS8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(136003)(396003)(366004)(346002)(451199024)(1800799009)(186009)(3716004)(41300700001)(8936002)(83380400001)(64756008)(66556008)(8676002)(4326008)(478600001)(66476007)(6486002)(66946007)(76116006)(6916009)(71200400001)(316002)(26005)(2616005)(6512007)(66446008)(6506007)(1076003)(54906003)(2906002)(38100700002)(38070700005)(122000001)(5660300002)(36756003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTM0NDkybS9aUkpjMUt2cUkzZUZTTkoxb1ZzZzVIZjdwcHU4RXBUSzM2TEo0?=
 =?utf-8?B?ZTExYlZVKzFOdzdYNGMvdlBmbTJWblZKUWtZOGs5b2JrMFdWVmk4NjVFcVk4?=
 =?utf-8?B?WFkrQW9WaFZmek1EVkJuVER4ZTEycmJ1Zjc4YkZFdDBJenVQTDZRbFhrT04x?=
 =?utf-8?B?MXF4QVJaZHVBTVRFM2lVYUhHaWhvd0xveE85TExlY1JXSHA5U0ZjdFcybE9u?=
 =?utf-8?B?c1VsYkJ2N2JPalJuTlFxaUs5eVhXSlppamE2anVyL2JiOUwrb285RHIzRW9Y?=
 =?utf-8?B?bFVyL1k3SUxNU2R6eUdkRjM0NW1HcDV0bUFMWDVjRWx1OU81RlZZc3ZadlJl?=
 =?utf-8?B?NEUxbXN3bEFXR3R0ODgwL29IZHdzNXBXV3NRbTdzYytiRnVlWDlaeHN4S1FE?=
 =?utf-8?B?SktCYkc1NDFnblAzZ1p4c3d4ekF4S0Mxc2ExR21IS3BCdi9md2VoMmlFTXU5?=
 =?utf-8?B?M0x3QkkrMTJlWkNZMnZxWStTdHAwclhBQVNGaGhPSDdad2E2UmU3ajhzQ2Jr?=
 =?utf-8?B?RHNwTXlHM0JVdDF2Z0RJOUdGZkxzOTQ3eFZRbVpUdWtFWGV2eVZ5NGtVT1dI?=
 =?utf-8?B?V1F4Q3BFamVOOXNIMXVBTk5EbWx5aUtBbk1uSGtRZ3h1TEZnYVdyYUJWeWZI?=
 =?utf-8?B?N0ljZ0crTVdPblJkMXdnaDRoNTNGS0VzWVR2dGw3c1ZudjRxZ1dHRHZOVVVM?=
 =?utf-8?B?Ty9JWEF1TjlKcWFia0QzR1VET2hvYWxtMUdlKzZZdTY3UXJnY2JRaU1mMC85?=
 =?utf-8?B?RHNtWWxRcUpncXlORzhJVXZVaTNJbHJMcEY5MDgxbGFXZ3lQL21NWFJlM0Nv?=
 =?utf-8?B?RjM5NVFrTTM4TlFBdlhDbUVmZk0rN2JBYk5DOUJJbGNpeUdOZWxsdDRRRE02?=
 =?utf-8?B?M0szNjQxOFJMN1QyRVRNZDJycnRIM09DSE1XRUJ2djJpcnZPRHhhTzAxdjRm?=
 =?utf-8?B?cmVueFcwQnJmZVRVSlpCV2lmdEJLN1B4bS9TM2tHakpSMFc4K2MxaGdwb25k?=
 =?utf-8?B?a1BGZDA4RVFPcnZ5OWQ3aUJOUndnemVaYXEyd1dFSWxsMlhCUW9VZW1pMkwx?=
 =?utf-8?B?THBJaEFNRkExSFNiSDhDb2N6VENISFFIUkRoSStsakwwRFROUTNUeDJjQjdO?=
 =?utf-8?B?b3RFRkxjRjBkWDVETWRScFZQZzVFNHQ1aFNRMkhLOGV0ZFh6ZWdpaTJuN1ZR?=
 =?utf-8?B?SEszRXlBYU1kK0tXMWo1VFlTa3JMSVdDbEdrcVVRbnBHTjdpZ1JVVHhFNTkr?=
 =?utf-8?B?TmRNalF1dm0xN2dINXpPVExYN2I3NGhUUGE2VEN3YXgyN3hNN3NkUytwdDRG?=
 =?utf-8?B?SDRyR1Z6SGRGL0V1NnNqd3ZZbmw0QlBHTmdyb2l0TDIyM1l2NHVPUTFub0VQ?=
 =?utf-8?B?aWY3U0ltRkVXYTE5VDI5YjZVOTh6VmwyWVZtWmJNYmtSaFM1OWlGVWpsK2Fi?=
 =?utf-8?B?aDlBL0E2eVJtTkpCL3VxQ081UVg5TkFYVFVRSWMwd2JPQWdYaW8zUy9veFZU?=
 =?utf-8?B?WTR6MnRicTVXeUxxdUNvTFZYR3FQR0M1bWtLREZtcE1KT3hQNGVQRkdKWGJ3?=
 =?utf-8?B?dFVJaVBhQlVTbjZvMG1xNE9TWkRvUmpLenNROTFKaUViTk9GT1ZzZ2Q2OGRD?=
 =?utf-8?B?amVQRTYwYWxodGZmcmI4bDc5Uk5URWpKUmRSVG9kZDBtUnlDc3JGZEZUdUpL?=
 =?utf-8?B?YVY1RU85VkFmM2J1MFYwV0czdndpZERKTmtycENaWFhwbjU3d2djbWJ6bFBn?=
 =?utf-8?B?MC9sUjd3bHZZSHQ3L1g0aVlEWWVyT0g3ZGlPZ0VLNW1YcmZ4SHNFUkhFYmRs?=
 =?utf-8?B?K2dZclFyV2J4K1lMMmtzbWNpaWdId3FGbkorRDYyMUd2Q3crcDh0b1N5ZUR2?=
 =?utf-8?B?NG12RkpwZzRIUHRJS3BTU0RHa1FpUVVvVTZOQ2Vlanp3aXkyTjZGcTNYMXVZ?=
 =?utf-8?B?czJkRk81ZnNRYWFRWGdqdWVNeG90V3U4ajBHdi9NYXFUUDJxMEUreldacFRu?=
 =?utf-8?B?UGMzeUVlMWRkWmJRL1g0dVovU0xLTDd2YlVqN0hSbzdhcDlCK3dIR3VTWGNz?=
 =?utf-8?B?dTBKN1g0UUtBb3diKy9IbnZRWnRWS2xXd1QvUjg5OGNZK2pKd21CMUhBVjF6?=
 =?utf-8?Q?bJQ4XOpg/D6PlojFd5454JqOI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FAC809699E05A488735DE816BD699D0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8/GqBqBLFbw3SfeS4o3ocoPXckAN1t9VFtanzOiatwxWNa6aEojZkwwPNPNRnwaA6lYC7LrxWQhTDrIDyrlasvT4Gtc2OMNeOZKhdo+1xCmo7o7gmGPptxSSm5BztK30bepIPagWD01iDPw8r5sJiNhIdyn1Zfc1MbXbfkOuor+G8DjxgqBSZNwBxbkje7E2/vxDq2lCUOw0LDnYtIZYiSLpYug/f4tLnf/FHuxpZDReUdFcK7zMkBlYg5NRHP1iTi4+XVZFYFy7G8gFRKAQNpMhfRnQ5W0Rdx9YQ/O9nVd+dChWb5DnJv/MSdT+QLoJ2Fp28ihdF9AQernC5FxD2DtbewzVCMcbGYD0CLgl7vcm/7uttenYfXhN9eSJWXMBaCVvh2migijfK/MVKCTtsX5G3CIW0cDd8J1TrYlTKwZLqR2b75n7hjhs2a9VrIE5m5FsseISK3OuS0yDTqetDd5XP3rhOtfVPjtZinEjdS0JZZvJ92VVMRiDClxfqoZnJ5x7vi7Jvd4f6oyO/USGM5C3cOvvc7dydwHpr9zq0h+v4qE/Q4IG50qyETYaKBGPYNz0E/L6yLF9fkNdjHxI+4ukKlCZl4N6qcmJxwvXbHaiJciwyMXYL92AVLgYHtpz+zgR51GsWxaDcFnJXsPr9yqZC+MbirLtg2o8VXShRmOpajXZyim5VeE74s29ykCOmOPbEwsFs8Ls+xuRFQDDrl3KYhv4swLEqN24YCH8y89V8ClVJMsG7cK7Q/cozC/l0A2JJRRsH2Yld0EKt/loSn4BGKgDhwaturHqTWUwQJdhldwcydflz3GVGsMXmHJKZEMLC8Y5GtgWZzdmnjjYxw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba18dfe-9f84-4843-c44b-08dbaa8bb1f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 01:35:16.5446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DySXM8qvoUBzBApLDw4f9pmuNc0R2Ovty783kMeHrKecbzui8yisD5+zvWT5yqKlZeRkDKMnguu/UXg3tOCPow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
X-Proofpoint-ORIG-GUID: swW9H4Y2O9_s6tJ8ZXK2peOx0EgSFZSm
X-Proofpoint-GUID: swW9H4Y2O9_s6tJ8ZXK2peOx0EgSFZSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_01,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 mlxlogscore=449 suspectscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309010013
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWljaGFlbCwNCg0KT24gRnJpLCBTZXAgMDEsIDIwMjMsIE1pY2hhZWwgR3J6ZXNjaGlrIHdy
b3RlOg0KPiBIaSBUaGluaCENCj4gDQo+IEkganVzdCBzdHVtYmxlZCBvdmVyIGEgc2ltaWxhciBp
c3N1ZSB3ZSBhbHJlYWR5IHNvbHZlZCBmb3IgdGhlIEhpZ2gNCj4gU3BlZWQgQ2FzZSB3aGVuIHN0
cmVhbWluZyBJU09DIHBhY2thZ2VzIGFuZCB1c2luZyBhIG11bHRpcGxpZXIgaGlnaGVyDQo+IHRo
ZW4gb25lLiBMYXN0IHRpbWUgd2Ugc2F3IHNvbWUgYmFkIGZyYW1lIGFydGVmYWN0cyB3aGVuIHVz
aW5nIHRoZQ0KPiBoaWdoZXIgbXVsdGlwbGllciB2YWx1ZS4gVGhlIEZyYW1lcyB3ZXJlIGRpc3Rv
cnRlZCBkdWUgdG8gdHJ1bmNhdGVkDQo+IHRyYW5zZmVycy4NCj4gDQo+IFNpbmNlIHRoZSBsYXN0
IGNhc2Ugd2UgaGF2ZSBwYXRjaA0KPiANCj4gOGFmZmUzN2M1MjVkICgidXNiOiBkd2MzOiBnYWRn
ZXQ6IGZpeCBoaWdoIHNwZWVkIG11bHRpcGxpZXIgc2V0dGluZyIpDQo+IA0KPiB0aGF0IGZpeGVz
IHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgbXVsdCBQQ00xIHBhcmFtZXRlciB3aGVuIHVzaW5nIGhp
Z2gNCj4gc3BlZWQgdHJhbnNmZXJzLiBBZnRlciB0aGF0IG5vIHRydW5jYXRpb25zIHdlcmUgcmVw
b3J0ZWQgYWdhaW4uDQo+IA0KPiBIb3dldmVyIEkgY2FtZSBhY3Jvc3MgYSBzaW1pbGFyIGlzc3Vl
IHdoaWNoIGlzIGp1c3QgYSBsaXR0bGUgbGVzcyBlYXN5DQo+IHRvIHRyaWdnZXIgYW5kIG9ubHkg
b2NjdXJzIHdpdGggU3VwZXJzcGVlZC4gTm93LCB3aGlsZSB0aGUgbWVtb3J5DQo+IGJhbmR3aWR0
aCBvZiB0aGUgbWFjaGluZSBydW5zIG9uIGhpZ2hlciBsb2FkLCB0aGUgVVZDIGZyYW1lcyBhcmUN
Cj4gc2ltaWxhcmx5IGRpc3RvcnRlZCB3aGVuIHdlIHVzZSBhIG11bHRpcGxpZXIgaGlnaGVyIHRo
ZW4gb25lLg0KPiANCj4gSSBsb29rZWQgb3ZlciB0aGUgaW1wbGljYXRpb25zIHRoZSBtdWx0aXBs
aWVyIGhhcyBvbiB0aGUgU3VwZXJzcGVlZCBjYXNlDQo+IGluIHRoZSBkd2MzIGdhZGdldCBkcml2
ZXIsIGJ1dCBjb3VsZCBvbmx5IGZpbmQgc29tZSBUWEZJRk8gYWRqdXN0bWVudHMNCj4gYW5kIG5v
IG90aGVyIGV4dHJhIGJpdHMgZS5nLiBpbiB0aGUgdHJhbnNmZXIgZGVzY3JpcHRvcnMuIERvIHlv
dSBoYXZlDQo+IHNvbWUgcG9pbnRlcnMgaG93IHRoZSBtdWx0aXBsaWVyIHBhcmFtZXRlciBvZiB0
aGUgZW5kcG9pbnQgaXMgdXNlZCBpbg0KPiBoYXJkd2FyZT8NCj4gDQoNCkFzIHlvdSBhbHJlYWR5
IGtub3csIFBDTTEgaXMgb25seSBmb3IgaGlnaHNwZWVkIG5vdCBTdXBlcnNwZWVkLiBXaGF0DQpm
YWlsdXJlIGRpZCB0aGUgZHdjMyBkcml2ZXIgcmVwb3J0ZWQ/IE1pc3NlZCBpc29jPyBXaGF0J3Mg
dGhlIHJlcXVlc3QNCnRyYW5zZmVyIHNpemU/DQoNClBlcmhhcHMgeW91IGNhbiBjYXB0dXJlIHNv
bWUgdHJhY2Vwb2ludHMgb2YgdGhlIHByb2JsZW0/DQoNClRoYW5rcywNClRoaW5o
