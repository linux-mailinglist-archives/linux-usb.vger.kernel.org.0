Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95A870CF71
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 02:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235299AbjEWAjl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 20:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235538AbjEWAbC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 20:31:02 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3C21B5
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 17:23:52 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKoZ6j017826;
        Mon, 22 May 2023 17:23:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=CfOXyOuNVy2L5V4Mt3lMW0gsQamXPFVj46vAnOFSwmo=;
 b=h6V0LpFAIyYpxCu2zj6Xm7TktOgVQN4NtJJIDGcNzm35YUwoFfGNGj3ePmx8+nFEJ4p7
 zcm+wfTSkqZ6Yoge7tShzXHYH0sp7L3nAq0w80xoxHIh3Ta6XDOL4QFagZcC9oCZuxKx
 TTc2ajpEJaI0P5+8z301Qm4wUI+FFmAWskLyiYKt1HjeGnC54acU6QJC4k+0IptCW6OX
 fsEmQEF0MNYGsziul1QUWkjW95MxmEgEhOGMfgdD9etbyQl+CC05JQPwBbZD/pd2zi8F
 4z154gvbSSgmmsKz4M9RoMOVw1SzHVjwEvaOt9W8eQWLSOPjXAZ/N6WvY5HDUtHWrszI jA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3qpvue9xpp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:23:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801423; bh=CfOXyOuNVy2L5V4Mt3lMW0gsQamXPFVj46vAnOFSwmo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QggG/tMSuKRBLfs21ltjuejsHShWCcRq4qoPoX9H1THnI5tbR+/6uyL6V2GCcYqrz
         9PzEywi/oPkF3TmO+zjZsB0zd01L71gal8rjKCzUSPjAEO1fra/dUbtuliD7qygvRQ
         PjMIkWD57Tyf8twyzHHAwwYQZ+Wy4Mp2RedBPktnISsykGdLzbajaT7nX3TammYXII
         Z2bKq+w0Y2d8YP1m1gq6p00Bu+zAzSGCA4AA6CPRfYkP013bhHILIWdECbzjignyb3
         iR+VnjiQpNlACNhcLbjBa1IiHqHFC3xOJEUN0c0aB1qPRsD+3VKVOUMPBS3V7hMs8N
         z+j2Kv4hsuOYQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3BD8440524;
        Tue, 23 May 2023 00:23:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 25582A007F;
        Tue, 23 May 2023 00:23:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vr+3vThU;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D1C18406B6;
        Tue, 23 May 2023 00:23:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh+TfYDuZK4kGulKTHoJJndPkGuXrHBCvw1M6+JE9CzM0UmJq/o3C1JbOgCorf0AemmlhJAyV3LwgKEO6cGUopy+U2aCE4Xwato4qF9ySrKyBh1O4HBdN/gQ4Ap7CtGWtfK2ZkHxNskcKaSMozBE8FeXwW6UUK5p8hcS7GHAHsVs/RL19kNUgGDEOWMHK11IVtZTdrmUpZaCgbwIuLlkdf0jOCqe6ycx+TVAjyLOgSw9tlPkfIQhpkDOYeMxpehnt0uNdZXND0AYcWM7q6pKpA6Jc7aKpx5Hg8DbYdfTnn47erfAN11P4KE2hA9fbcnwHZqbMyPHKDQ4H/upW3DPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfOXyOuNVy2L5V4Mt3lMW0gsQamXPFVj46vAnOFSwmo=;
 b=A4tW4BnAbx2PwSf567BJsDyYggOpMKI/2teN6R9g6YEYAa6kz95EhqDClWJ40o86oRA6EAda9Sfx93071DG6qyvdY+AoxsiAe8jSPhXUbl92e05mL4KKhIrTHGrz55SnNb6ZTW3GrcovCA6as9AVHTAQ8aQQWWhutcezv+bObA6G2zPBkhfPn9gS3+eKoIjk106oOD/jJYe2PUcdlLpUPmn4h31rD9eiH6eZ5JkBkrbeNehvc1rATeIKvhvnzj8mX/Uxv8nQD4+7Dt2obCvGTjxsrxk+IfORy8e6bm7T5t/9VRlXRm70hOQLG1llhmSgLcV/2q09uHRexc16bOLmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfOXyOuNVy2L5V4Mt3lMW0gsQamXPFVj46vAnOFSwmo=;
 b=vr+3vThULK4LGsBfETCOEgK16soPKStAb6mvqt3JQTxWZh7Ki9sfhuKuahPqbq5cf2BqOjRW1kw1XUd8ikwAqMnwH6B1SAiWzdjzs0+r1F2+4EklwBE9vtSEWMRTb5q9ef4xx1+AS30jNhi4dqT7U2RrnrXw16mje3YzmquuZks=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:23:40 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:23:40 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 22/97] usb: dwc3-xilinx: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 22/97] usb: dwc3-xilinx: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRO39RkRxcrzgEW2fGq6SVgpLa9nB3cA
Date:   Tue, 23 May 2023 00:23:40 +0000
Message-ID: <20230523002334.fxdlg7wn445swbyj@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-23-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-23-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: c453459e-c3a2-48eb-4230-08db5b23f571
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RchpSXZkMjQNehoflej7zISC6YeBSWr+f1K7EKb3JnmqaEPj+tpvUpGLSEkNdF2Dnuhk7l9WE9ja8MJXRn+MdyBfK3CpgaI6oquyUNYuY6AMNR+wosMCtTVEgN82zSq5sVd2a7QRyYC0KnjwpWqSDmI9Xrx61b6pCGG6CJOW0sJDWrnoS5KiTAbowvIslCT1huuHM7bXJsUPfEYXT0wmJgTkGkCkWrg5LhWuHyRNhkKcKs9vpnpMK6UiE0FPiGUC2C+sWRvFpAbueVXrsTbL9/X2kCTDNWLs5QYN6nP/S6Hlszj3GHTXLmwSltc8W5ysRUBH2tVW4lC2cxQ9R4s82yPuepH/93lCe0cz2GB/UnfywnjKUZpdcsI2o4cuuuYq9aJlu+bnrP68PxRHaE5xHVq+G8pWZnAyg7RxNDxUb7M//X+aYZRVMu3jHQahbDfGKLAz7af9K6lY/25viKhC4VDfVW3rsPnLtEjPWo3LCAclAeGv3dqEv9OtMjwJQ0jVutXaLjO3J8Mxc1AwvB8bYWXFV3pskAq3w4hg8SF9g3a9hRl9DfQ69Fj2Q2Has/Mk7pH88skjfNuYbdCUbj201qUsU7CufGEk0WBh+uV9pwfpXaDjOmuXvF4RkGS0AFhH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWo5YnRPM3pxU2NoWTlMdkp6YnF3emxSWndWcllZVENiSHR5ckdJMWhoQkUz?=
 =?utf-8?B?MVdIK3orVWVFOVpRNXNDSC9UQTkvL3Ayakc2c1pOSkE1SlJrcWxvWTF6MDdD?=
 =?utf-8?B?NkFmUWVKVHlSY1gxQWkxNzJjWmtWWTlCb2o5RktsM1UyWEdSa0VySGVFYlpx?=
 =?utf-8?B?bWZEQmZraTRvRWxQaEFjdDYyMXJCaWpWMm91ZkEwOHlLcmw3YUYwS3J6eDJu?=
 =?utf-8?B?ejNKdE5haVNiN0ViUzBOcGVocGZMWVZLeC9Odm9GRWNSMk1KNGlHTStKVzRl?=
 =?utf-8?B?cTYvaWtsRVR1cVZyYm5hUTMxbzdueG5LNy9weWpLVEVoZDUwZnJEejF6YjBz?=
 =?utf-8?B?bFhFbmh4bHV0cUQxUDRya0JPZFJWZUtuWncyZmc0emNZK0tPNy91ZWNCclA2?=
 =?utf-8?B?SHRCdHVRdlBrY1cvOWFHTENJWmVIeDRLMnc2Z1FQOUpuajRQKzRyRXJ3MWdt?=
 =?utf-8?B?UElmdWZNM0VHcjNuU3U0OGNDa250MHpNYWJBTHN2aFgrL1FWZGFCbGlFOCtF?=
 =?utf-8?B?cHVJUFMzMSt0cTNLdUE4UGJTVE01KzFBUkd6VFdZVXArZDB3VHpvYWF4aWNU?=
 =?utf-8?B?U1ZqdFZQNE91RHZ6YlNWRFhyVHdXaDdFUjgrWHJwUE0wVGlxeHpuT29BVHBh?=
 =?utf-8?B?bGRqTGxIeXE3dFdacVVIb0YzS0YrS3Z2RjJGT2N3eFBqby9NWW5yR3JTWG43?=
 =?utf-8?B?RnhjbU5QZG84eml1ckd3cjhiS0lhL3VtVFM2bWlRME8zcVRXQ045NHlsMmZS?=
 =?utf-8?B?NmNFWURuV09jeGZjZWl3bFVYWWV3ODJUSm1NK2krVEhZSC85SE8zK3NBbE82?=
 =?utf-8?B?VURvVThrWWlveFJMNHdkTzF2YmxWNndHVURodUQwKy9FQjhGZnZJSUs0UHEz?=
 =?utf-8?B?ZkVmb2xEVW1rbG9WTmxLL2JvTzZVMFVXdzNmb1h5VFk0ZmRIMklLd2dJczFi?=
 =?utf-8?B?UWtVSUFjUE9ZaUFzZEJka1NHTzB2NnExY1lWOWwrbnBBc2tXWjkrZDBWS0RE?=
 =?utf-8?B?Uk04OTM2Y0JjMk1mUUV2U0FzeGQ0MTZvUEtkSmRaeWZMTTRhMmpFOXJIcHJz?=
 =?utf-8?B?cDhqNE9mMUZhZUV6R1JITTJPU3dPK3paMHZlOHp3TStjVWJ3ZnpSWlBDejR2?=
 =?utf-8?B?YUNRZlBrS2hCaWpySFg3dXMrOHlDYzFibmxRdTZFbTk3THB2a21XaWwyREdZ?=
 =?utf-8?B?VmdkUkRyNXl0OGlseVcwY3NxSEtxbmRXWUJFOWZock1sUUY1OUN1V0w0VUV0?=
 =?utf-8?B?OTVXZmNLYUUwTDJxQm5VMm13dHlsbGYrelBKNGpvZmxDWHMrbDNJSFowTTRQ?=
 =?utf-8?B?blpuTTEyR0RWSXo2TEtuL1hveERuS2pOVHE5NEhrNEMxYW50aGQ3L09tbWY4?=
 =?utf-8?B?dDIzYU9xeXNPbG5hTE1mRmE1MkxQQlFScHdQRm5LL1hlTnpKejFuNktVTWhn?=
 =?utf-8?B?UGI2dTZhbjZtQllaeU9Famp4enVxNXpRQ3lrYkdoejVWYlRoYm5pcSt1cmpO?=
 =?utf-8?B?TFc0NWZ6TGVOdGdjRTRzdnJBZU12ajlGNWhMZTdTaDJMeVIzMGxpWnJFaGVx?=
 =?utf-8?B?NTA1WDlzK3hFRzI5d0hwakZtSnMyNGRiWVlHaEoyVUVqeGtVczgzVmNLaGRh?=
 =?utf-8?B?MWxmU09qMmljK01Xd05EVnRldEZyOFBkMEIyMW5zME16RC9FKzIwQVN1Wlp5?=
 =?utf-8?B?RVpObGhaZFBMMlJjR29TT2ozYVFodTZYK1JXQUFTOG05WHc2RFNhQjY5SE1I?=
 =?utf-8?B?NDZpbVpiUGNRV2JZdituVjJHWjd0RnBDTHpjNTFTcEpqTHlQSTExRzBPeENi?=
 =?utf-8?B?NW9ZdnNOc1JpYklxNUdTeFo4ME1zUFhmTmFaMXozbE9wcm81MlhQUVN3b05N?=
 =?utf-8?B?aGdOcS9lUjJmWUI1eWtWbXovYUVGVnAvWGZTY1JVMEhkWG5jbWZDcXpJMWpD?=
 =?utf-8?B?dm9VT1VTSUU2aTJ6V3o5WENLTXdyUHF2dWJNZDBsR2U1MEdhSm1tRUFIZ1NK?=
 =?utf-8?B?bHV6SXRDNithUGs0RG9mRnFmdHpyZ0dYR3BkZVBiMWFRcXIwTG0ydGNtZzdR?=
 =?utf-8?B?TW1mUGdoMGdSNk90UmU3NWtzbkttZkYyUFdPRUlObG9JK2w4QVpXYjVsWno0?=
 =?utf-8?B?L0RucHV3QnF2RURSSlJNS0FtZk03aGZLRlhWSXExTGkrZTJnRTUwb3BxTzQ3?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4624081AED83EC499803ADC47C9ADBD0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?UHhEejRmeitvUVFDOXpaVDFraGlMd3VodS9uMjRjN0VGelN2QkJBQnEvRS9L?=
 =?utf-8?B?dFFVdTJFVnpBektXQkVSbFRIL0hMZ2gwYmxkQkx0QmFPeU01ZlMxWENiQzJl?=
 =?utf-8?B?YjYwZTB6SER5NHdlOERydzdkWXRTYU9zbG1sRUlwMkRYZWdpWXh1K3J0bmxE?=
 =?utf-8?B?TVJxa1VqN2xwVjFaUlJpQTRGa3FrM28wcUxVemRCdmFENFgrSzJEK3ptL21M?=
 =?utf-8?B?UmZ3bmplTXBaV2JOWDNDTStRN0dIeStKSzBjT0s5RWNadllDaXMyUVhaL2Fp?=
 =?utf-8?B?NUpJY3V2dnRYV0V0RSt4YnFKa2FNakZ6QlZra3dQK2xvYTFmclR3ajB2Q3VO?=
 =?utf-8?B?Z29GU0x4dlpSYk9kYmN5aDFTZ0p6SjVKYWlQNXZoVXlsSGhBQnVBUUxOSTIw?=
 =?utf-8?B?WGljU1hjZEYxMW40ZlhHeFVKMUZHcnJpaTFaYk1aaWFPTjF2enA5aTQyOUZ1?=
 =?utf-8?B?bVpZZStCbmE5aXVCWTh2R0s5T0pWZXpNR2E0TnIwZVlyNWViS1BnczBLendX?=
 =?utf-8?B?cDZLMER4WTZ1ekxNOTUvaCtSQnFhSkUwSi9DVUZ5U3VWd0I3VHFuZlRhUDJ0?=
 =?utf-8?B?MHh0eGxTV0dOMXhBUmpvL1pJNi9ZWGJacWZwc3c2ZXp0NnBiREV2QWQ3Nks5?=
 =?utf-8?B?L0VKMlVUMkFudGNGbTBSNkdrMkcrbzczTGE4TGFvQ1hOYTBTSklxRUlxU211?=
 =?utf-8?B?S3hTTjRGK29KcHJrMExVL1k5R01jeWI0OEdCSDFFWUFMVzdNdzB0bXhoVVhM?=
 =?utf-8?B?UlRnNGV6TjV3VXdTeWN5RmU3Y01JMzR1WGpvRGJROW5tR0JoY2tUV0NCbDRC?=
 =?utf-8?B?a0g0UjNGLzgrczJmU2N0NExTNHJxbzdMWG8ydlNrdzhObmJvOUV6QnRCTU9v?=
 =?utf-8?B?VFQ5ZXMyWFlSczUrY05JYUNIbHVDVHNtK3pGazRNZThpUlVyZC9HTlkrVFJw?=
 =?utf-8?B?bTd2QmhyRlRoWFlJU1BhbGhNM3VGUC9Cc2FHMEpaZkRSUVVOcjlFOVBzL3dH?=
 =?utf-8?B?cVI2OTl0Mzl0OTRreWdia3lCZ3RwRHV6bkhGWXpkSkVGc2lvNDlxdXdxWmhz?=
 =?utf-8?B?K3FoY3VDbXQ1N1lJalhwQndKbFZzeU5nQVdxMUExK3FkRDdmM1ZxcG15czQz?=
 =?utf-8?B?SmxlN1Rkd1IwWngyQlVzenQxT1ZoUmZnTUZBMVNObzNFZ2tydUxuc3FKRGln?=
 =?utf-8?B?KzRKN2lDT3lzY0gxMWpnVFg5bm04VlJVcittOE5vQ2t5NmpVendyd1FLN0hN?=
 =?utf-8?B?Qnh3R1JOWk5JMEtIeFdNV3drM0RvL0lKTEtOQ09Da0plSWJnWmxXb1VucHlE?=
 =?utf-8?Q?HjC8gXP/OWfOg=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c453459e-c3a2-48eb-4230-08db5b23f571
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:23:40.2512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QslcotiIITkeP9ODoehoZGNO3/wprILNwlhGAcCDwlDr3OafNVVwvH6ZujpMqtp7InUJUKanuhfnvvqE+qS1TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-ORIG-GUID: fIkPe4a9204On9PejqKiwdtNHvCtYc04
X-Proofpoint-GUID: fIkPe4a9204On9PejqKiwdtNHvCtYc04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
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
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIHwg
NiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IGluZGV4IDJjMzZmOTc2NTJjYS4uMTkz
MDdkMjRmM2EwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMN
Cj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IEBAIC0zMDUsNyArMzA1
LDcgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IGR3YzNfeGxu
eF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3N0YXRpYyB2b2lkIGR3
YzNfeGxueF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gIAlz
dHJ1Y3QgZHdjM194bG54CSpwcml2X2RhdGEgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsN
Cj4gIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gJnBkZXYtPmRldjsNCj4gQEAgLTMxOCw4ICszMTgs
NiBAQCBzdGF0aWMgaW50IGR3YzNfeGxueF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIAlwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsNCj4gIAlwbV9ydW50aW1lX3B1dF9u
b2lkbGUoZGV2KTsNCj4gIAlwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoZGV2KTsNCj4gLQ0KPiAt
CXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNf
eGxueF9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiBAQCAtMzg4LDcgKzM4
Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBkd2MzX3hsbnhfZGV2X3BtX29w
cyA9IHsNCj4gIA0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdjM194bG54X2Ry
aXZlciA9IHsNCj4gIAkucHJvYmUJCT0gZHdjM194bG54X3Byb2JlLA0KPiAtCS5yZW1vdmUJCT0g
ZHdjM194bG54X3JlbW92ZSwNCj4gKwkucmVtb3ZlX25ldwk9IGR3YzNfeGxueF9yZW1vdmUsDQo+
ICAJLmRyaXZlcgkJPSB7DQo+ICAJCS5uYW1lCQk9ICJkd2MzLXhpbGlueCIsDQo+ICAJCS5vZl9t
YXRjaF90YWJsZQk9IGR3YzNfeGxueF9vZl9tYXRjaCwNCj4gLS0gDQo+IDIuMzkuMg0KPiANCg0K
QWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhh
bmtzLA0KVGhpbmg=
