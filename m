Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735586E705C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 02:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbjDSATz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 20:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231924AbjDSATx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 20:19:53 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BB05B81
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 17:19:51 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33IMshlo004043;
        Tue, 18 Apr 2023 17:19:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=hHqQ9hguLtsIU8QbsCj7/cJCfI++vts6kCCnNPEmWt0=;
 b=QssZ2gr31uW5B741U5v8t3oWihI0fnKt+Xbie+BTySdygbXV+9XaJBUEp/bapbT7mcM4
 /ZSIklcX44tlOxpczvPTwwnN0o9v40Z5ePchozVrfIWsY3g6Bh51Ox0RFRu7XwADWZ8v
 GF4fq/Dntmm5jirtGPsnkV9zieXSrTnw9nWPNeWBFgZJq4hrucpPsAmuIXG9A5n3eczJ
 +jXu6z20O1std0WmZlbZn8AKBGqAKQWwLREa0MVlVbmMW9r3HT7ogI5ucsOhQKFPh7Z0
 86b04kv+JTCDibkTumFAdZK4/ZFIeuifWShABTX5+eTMIPJO9yT5ednLDv8oeYfXcZZQ ZA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3pytjf7bes-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Apr 2023 17:19:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681863584; bh=hHqQ9hguLtsIU8QbsCj7/cJCfI++vts6kCCnNPEmWt0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Hj+we8FiLpq5aCY1rDMWOXSdgZJ1I134ikCgA5KbSsaDqHCaK4iKfNbTFehLwN4JR
         6/jgD5T8CFsxSy/e2gGKL0U+E1au2UUTmdeHI0fWnTtXIh8U01uz1HGR+cDvPyccmD
         qT/LEwZ3ZzfQj2rtbfMD2mNXkQVHRjRQKzkIxFD6VFltK9fbWr4X0AEP7Yyerq6BfV
         zpOZCM+WEChF0EfyEGCvs8HxIi645fn4yH7+RynGCVA084fwE6MLZ11piER1pxyrRw
         rFOjRv3Du+wiiKW767Vq7x+o6giShfUXfQT5byqHQlwhagQlQ/3aukGuyHrVF0EYmO
         kvI77vgABZgww==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 936F740D88;
        Wed, 19 Apr 2023 00:19:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 72323A0083;
        Wed, 19 Apr 2023 00:19:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=s76+OnSL;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 43BA640DCE;
        Wed, 19 Apr 2023 00:19:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKscyrdz2d2ROaST9l6xahhzTJanVOCVdrB5HTAsVg1jyuACFlY+ZvR6tJCD8ccZh1lT8+r+CdcYbF8BOWJ6wmbVc8C94L2UamFU/rIrsU37KIVwwu3+dR1IrIWd0SKyxpXJ+wQW1Q+FN4IKIz5PtWeeUrryHPMMuRWLlxJl8zK19cM08lLgWD/631tn2mtYZQeXVZFdVNC5GWhd/DyGHoa1p3R2Mm31YH8H+xiZtlNs1RZXGJ5FVT+ybD/71yqv80F84RlXBXm1bPCc4N+sXcKAmoRNpHvvHpxQ1wRFvr7uv0Lp1tS32dVwHF+N+ztvkks1DCCRu5CiMLfNewwP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHqQ9hguLtsIU8QbsCj7/cJCfI++vts6kCCnNPEmWt0=;
 b=NG5+qFnE2dQpTn5AbKmNtEGoyTRPKlKqAicdwwWKUv7/zynd5rRV8uqQfwFyWxGGrHj+c6ewXkmtDZtC5J7FE20RN+BMHYws+2wnXYswd5yYE32uc74iehHPEhJYS89X5YRyTBFRYVGmZ6NBrY0+aMxN01yxlkMbDvPvO03hPs6rRNN3WdyIrW8tZs8Uv4SaIKcfr46GqZwuokbYjbmpBjPU3S9RC5xRF4B0o9o1ZzqRjovAiUr4LD8TfZLl5sHHvAt9n53Ctm9W7jds8SlrSPwjthX7yIzqjr7ixTCBvyCueYbE9kBBr+7d+ODQoXo1eYUFWqZU1zRVdHuj5sRRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHqQ9hguLtsIU8QbsCj7/cJCfI++vts6kCCnNPEmWt0=;
 b=s76+OnSLkePz2vtdpi/EMjAh6IQm8bYwGwnuqJp4N+tgyXyCpTaNIiRyHakCdrwZ7nAg3wlHNL8mvPp8bhejOpAMl7CF50kcs8Ft5KRaexSfLsL/Jmy1ktCd6t6lPPvpvkO+8p0u0R7fRJkqR67R/Wzh+EyEiDsDYD3NmctzMIs=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 00:19:31 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 00:19:31 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAF/uAgAACIQA=
Date:   Wed, 19 Apr 2023 00:19:30 +0000
Message-ID: <20230419001920.7gughc2sqwwx3a4e@synopsys.com>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <20230419001143.pdxflhzyecf4kvee@synopsys.com>
In-Reply-To: <20230419001143.pdxflhzyecf4kvee@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH7PR12MB7283:EE_
x-ms-office365-filtering-correlation-id: 2f0985c3-817f-45ff-b6ac-08db406bbed8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2oWGQXRkuGFvEVXhBip2sf7W6XfGxiLItMCP0RW49E+R+zQT6EaPBGocCPdGQ7a5ChAu80x2slz34YZgqzN4/o8rDeZEdXS1+kggzAhWZcWZ4FJPQBjSjCevTMka0mTBOTIj6UuVSHLwSnqs65zF0hhoL0EDqUM2ZBo4Mz+QQuZHknYaFviqREhg4cFKMn5WO62dQ0a9hN/8Z6b7ZyseMMFeD/Nxk17b5RJk8Z8dwnZo8Ol10PbvXnNr1GGgieIKIZvxn3Mc52dG4WFu5rsR73ftLeZrFAHvB5JlhFZyuPVyYi/suAmrqBRaNYQw5DYlNEva6k5BKCzs64oyOKffWxTuBk9HuOsOw2xeNnbvyZxHfwyUW65okND/1CYPHAopuDhSHQx8j5yty5VZtgp940d3UzdQLpsPR/jOr5UFiwuHC86yk7WYdYLFmy2LNwYeM+P6bbnSsidryZrKPWPIVjcNX40Cgq3mKYOfgxSWgvDFFsX6BMMqH6Ye2ffzM4nxrkQrOeVQDWPr08E3a1SsALm4QVOPPFve7lFWEBRvssYogXOjAZSMKGMVd/DhLrcnExpbk/eMAuFr4BMl9wpJfO5/TFDqQ3GyNBPFUbNOAgMGwOhwERGHbMGDJWRl+dEP177rSE08Ep4tNK8V5w97vA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(38100700002)(5660300002)(8936002)(8676002)(2616005)(38070700005)(83380400001)(2906002)(41300700001)(186003)(316002)(26005)(6506007)(1076003)(122000001)(66899021)(53546011)(6512007)(71200400001)(966005)(66446008)(66476007)(76116006)(66946007)(66556008)(86362001)(54906003)(6916009)(4326008)(36756003)(64756008)(6486002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWUrenRZbUpuNXpUbWFWSTV2Ky9qTWhTYzhaTE03VzdFa2dDdUh5ZzREQ0Jp?=
 =?utf-8?B?UVQ1eGxsYzFFdTVKU1pXOWZCNmhENFVmZlRSZ1hxZUtvajhOb1NzT3JzYmlC?=
 =?utf-8?B?dXROQzg4cisrdDFOdnE2Wk5WNTB0SWRkUG14dEpTOEptNHZDRmJISXZjUEQ0?=
 =?utf-8?B?aHAxVHhyMVVBc2RNN0lpY0huQkhtVnp4S3FPbDYrbVNSY0pkeEFxMU1RRk1J?=
 =?utf-8?B?QnRyMmNISmg2ZGV3WStUc0xXQm11VGI3M3lZcTdMNGtGZkE4bzNwTVFZTmJL?=
 =?utf-8?B?Q0FiRXBtUW9hYUxnVnlhVVAxSVg5RUE5TTBoVHVCdUpRN0Q5UUh3YWd4dXhu?=
 =?utf-8?B?cENkY25tWWFibHpmKzhacUIzbHBSWkZhT0JKOFZJRTB2TU9vNVdIdGRjNENV?=
 =?utf-8?B?cE1zdm9uMVBqc2tFdlJCRnkyR0dncnNnSWUrVUV0NXp1cGtiaGJKNzFOcjhH?=
 =?utf-8?B?N3lpZ1ZaaktiUitPalNBZm1jcXg3eG12YW9GTzJycXJtemRvbTNpM1YxcXla?=
 =?utf-8?B?aVNjMUcvMFNsdnJZUXhtYk1RcHZJQkJKbE5PR2RkS0MzdVJ3Y1hrRkZPSTEz?=
 =?utf-8?B?NWJkazMzTXAvc2p6NHZoaUdVN1FQWjNoQXJaNWxtT1N6RUxxNVREVnNTVWti?=
 =?utf-8?B?QTR1NVJSaXlpZ0NQeGhDQVpCU2NRdW5nNnlOMWx3eTVTRVM4Q3VRaW80QlJL?=
 =?utf-8?B?cjV6UFh3ZUdNWWRrZkI1RWVtYnVqVTJHOXVPT2ZWanZ6MWM3dXdpczhWRXJD?=
 =?utf-8?B?N2RKZGxOUjkzSWZrRFVQTDN4QjBaNDNXQ2UrQlFpLy9GbCtqUElLTUorZ1ls?=
 =?utf-8?B?SnVuS0lsN3RTeDFseHN6ZVJhelNCZ1hxQnZCU3gvWjZrRFhJUWYzMC9UTitm?=
 =?utf-8?B?UCs5bmJmN0tKU1ZCT0RmOXdHcUtoRG1xZWpCb3hTSXJadmRCMlhVWDRRNWdO?=
 =?utf-8?B?cnFMUFdLWnNIekVQSityY1RrelhMVW4zcGNwbC80eC9TK3Y4MS9aZGpkRkFj?=
 =?utf-8?B?Z0VyTVJGd1ZYNUZGQ0Vrd3h1bWJ3UVZUQzRENWEvQy9xVGVFV1k2QXlSdUFo?=
 =?utf-8?B?d0l3alZXS0x0Wlk3NGFUUnhJQXo0UGRzYnNsdmtHVElRS29lTlFrZUFNR21Z?=
 =?utf-8?B?UFdSQndGMmlVNHVTdDhvb2d4bTZ6MUJwa1lROFpRVUdrTW8vV2oyTU9FQTFB?=
 =?utf-8?B?UGlrZE93RE9vaUF6Y09EbEo1TCtMUmFCTnhjZmo2QzFCYnd6cEZlYnpoNDJx?=
 =?utf-8?B?R1pYVWxUMW9UeUR6TUNicmxrODkrbzUwZkhPeWFsM3lhbzB5QXpLMEpyUmRh?=
 =?utf-8?B?YlhGUnZCN3QzVDV6My9nK0lSaEg3UGx5VEJSekZSOHdQSzNTaVdrQUF3LzZW?=
 =?utf-8?B?OFdTSFFYQytrbHh3SkJPL0FwT0Z6K0p1b09SR0tQYXpEdVoxUE8rM3R3VnVz?=
 =?utf-8?B?cGxTZmFDeU8zd3BjTTFJRmFxaUdwVVdBeldxWFVORHJwM3V2WGhoZlRobzl3?=
 =?utf-8?B?akJOcHgyZVBicGo4ZVk3MTdXZEtCUm8zakxBcjRqZ0dXOVViNjNMdW5FMGgx?=
 =?utf-8?B?YWhUNVUwTWdHMFZLeTZ1SEQzZlY5Ukk2V0RPM3FtYVJ2S0RUYWZxZEpXYWdp?=
 =?utf-8?B?cHBIUXFjOVk5QUFENUNneE8rZW9FQVYyVnB4QlJqUFVUdUdvYnh4dm1Pd28z?=
 =?utf-8?B?NjQ4NXdnazZsbWVWbXk1dkJ4ZUVOQjRSOUdHS2Qzd0owbGM1QXNiV05SdG9a?=
 =?utf-8?B?RHJhVUdESUU4N0VsTFVCSS9vYlUvR3FQbWhxbEdsaVpydTUwOWdtQXlsei92?=
 =?utf-8?B?OHJ1L2tuZXZ3RXoraVlFU2VKenNybWhDeE5JSlhvZkFGRzZwWm5VUi9LOHdJ?=
 =?utf-8?B?UDBvRXFZVjNiK2RSZ2FHTzBXSnJFWWJTQXVPUnE3dXkxNnVabTExbzB5WTV2?=
 =?utf-8?B?YUJSNHhhSGl2RE55ZFdmMU1GSUhDLzR6c3lvWmpXOEJ0OU10Y1piK3MyMngz?=
 =?utf-8?B?eC9zZ1VlVkpTd3hLbXg3R2xDeGViNFY1MisrZzI3RnhpMUNnQUpRRjZabTdS?=
 =?utf-8?B?WlhqTGU0T295d1hxd0VXT1Jzd0gvdStLRmRYR21ZdTNFdjlmaTkxNEQrN2Zp?=
 =?utf-8?B?UVF4VzJ1YkpFS3lYQU91Z0N2V1E2em9SU2lSZjlJQWpRM3FMc2swV1RkWStY?=
 =?utf-8?B?WUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6E15AD56C8EB644BDB3F19047369EB6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?UkdaVnp6Qkk2bDFzQllSOWR5SXRWZHF5cXZaMUNteHZVZ2ZCR2JtWHlTZHky?=
 =?utf-8?B?STcvbmZmeEk0U1prWUxDazBmcS9xM1cvZ0hSL0NlSlVtYldFbTZCR1RVd2FW?=
 =?utf-8?B?MlUxZjRyOThINW5XT2RZTUhtVXVUa21QaE12dzZ0V0kwd2RmS0x2YWI5M1Zx?=
 =?utf-8?B?QXgzVHVMK0xERnQwTVY0aUQ5dWVSZG9pbHpEeXBjL3REYnZhZ2pzTWgvM0FM?=
 =?utf-8?B?Y0VFOWZTYzhYTVZvY0hsRysyaDZlZUhVL1pvTzN1b0owNG01YnRqZnZESFhn?=
 =?utf-8?B?R2VKRXFVZ1luV0prZUwzVEg0cWZ4TXRWUUZnWWJmdXphTGhQNllPd0hXaWdO?=
 =?utf-8?B?eFMvVmE1WHQ2b2VlTmQ3R01nR0R6UnY0L0ZQZFpWaElsQVR1YWVVYm9EeERX?=
 =?utf-8?B?TU1OQTFZRTBHTkxTcVNVcWxUdy9pcklQZHJKUWhvTTcwUHkvN1NEZmo5RzBn?=
 =?utf-8?B?a3NVRUZhRm9HSTRlL1Zld3FKUlBCU2J5M2RhRm9nc1VRcFJQWUMyTWNzRjQ5?=
 =?utf-8?B?cWNRTnJJeFBxYmgvbDRHSjFUWnZjejR5VVFUWEJNa3BwZ3J5ak1TL3VGSndK?=
 =?utf-8?B?cFhXa1hzbUE2aUlPeXZMZGdBQlBaYUtiTnZuRHZQcEF1VUY4TW13eGgzZ1hJ?=
 =?utf-8?B?bzBySW9SNTdDOU1XK21MY3ZvRzlFZTJUNE9tOEZwMURTODY5VVBzdzIrNncr?=
 =?utf-8?B?d1VLOWtwbFhTRnc5RDFxL3U4TjlQaTdxSjlqaW4rUERySElwMENLOGJRSkI3?=
 =?utf-8?B?ZE5obk1sVkdYY0JyaG1xUVowVWFTQS8zd0czeE52WGpyTjJZNGE4OGZ4Mkw4?=
 =?utf-8?B?aThzbTBwSkxxVnRxb2hKMWw5MXUzUk1HRkViSXRpZ2VTQzJrVWM2MWNrU3h3?=
 =?utf-8?B?NDVjSmRsREYrVEZUMmVkdFNWSWlNYlhiL3FPcFR2aDBacU82M05aOVdXNnV0?=
 =?utf-8?B?cTZwcE85MGxDRnIwTTVDZmo3NmVsMG5xcTZBN2g0eUNUNWwwNjBySm9zNXo2?=
 =?utf-8?B?MzNNallxVWNrcm1xeml6N1VXcUFVcGNsRnV0WnQ4cmZzbGRLVklQR0NkeDhm?=
 =?utf-8?B?QUJGSkxyOWZ6NXRLKzViYnJjOTBIQi9hTGRicFRNejB4RE5abUorUmZoY1Vx?=
 =?utf-8?B?N3FoQ21HUlUvUDNiM2hvN1ZsaDZxeVRPVVZyUFYyWEU2YmI0Mk1vcXBna1Zz?=
 =?utf-8?B?cC85V0lvWWxEK3JPS3BkTDJRWXBUbVlNblhlQXI3OUw0REdDeW5HUHNhMm5V?=
 =?utf-8?Q?1QMoz4cw/w5IQIK?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0985c3-817f-45ff-b6ac-08db406bbed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 00:19:31.0127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m+slh+H6ihjNZT8uCcmIuato/82YpeJiuKyQR5bEiFWvLvs3+joRNXbB3yKj/06yCMPUMNc9QfKCONyDTuXDMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283
X-Proofpoint-GUID: uGkB05yCoP21izScgvTG1ya6jIUx5ruD
X-Proofpoint-ORIG-GUID: uGkB05yCoP21izScgvTG1ya6jIUx5ruD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_16,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304190000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBBcHIgMTksIDIwMjMsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gVHVlLCBBcHIg
MTgsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiA+IE9uIFR1ZSwgQXByIDE4LCAyMDIz
IGF0IDEyOjQw4oCvUE0gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3
cm90ZToNCj4gPiA+DQo+ID4gPiBPbiBNb24sIEFwciAxNywgMjAyMywgQXZpY2hhbCBSYWtlc2gg
d3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgQXByIDE3LCAyMDIzIGF0IDc6NDnigK9QTSBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gT24gTW9uLCBBcHIgMTcsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+IE9uIDQvMTcvMjMgMDY6NDksIEdyZWcgS0ggd3JvdGU6DQo+ID4g
PiA+ID4gPiA+IE9uIEZyaSwgQXByIDE0LCAyMDIzIGF0IDAyOjAzOjAyUE0gLTA3MDAsIEF2aWNo
YWwgUmFrZXNoIHdyb3RlOg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPj4gVGhpcyBwcm9i
bGVtIG1heSBiZSBmdXJ0aGVyIGV4YWdnZXJhdGVkIGJ5IHRoZSBEV0MzIGNvbnRyb2xsZXIgZHJp
dmVyDQo+ID4gPiA+ID4gPiA+PiAod2hpY2ggaXMgd2hhdCBteSBkZXZpY2UgaGFzKSBub3Qgc2V0
dGluZyB0aGUgSU1JIGZsYWcgd2hlbg0KPiA+ID4gPiA+ID4gPj4gbm9faW50ZXJydXB0IGZsYWcg
aXMgc2V0DQo+ID4gPiA+ID4gPiA+PiAoaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jZWQzMzZjODQ0MzQ1NzEzNDBjMDc5OTRlMzY2N2EwZWUy
ODRmZWZlLjE2NjY3MzU0NTEuZ2l0LlRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20vKT9fXzshIUE0
RjJSOUdfcGchZkIwa3JVWDZxc09YckJzT0h6THN0VkZXcVRMTDluY3dHRlh4bHhLMGVlZExZXzI5
WGR3alhSdGJPLUVXdjFlWDVva04xck9lQlpzcFoyMUtTYjViJA0KPiA+ID4gPiA+ID4gPj4gVVZD
IEdhZGdldCBEcml2ZXIgc2V0cyB0aGUgbm9faW50ZXJydXB0IGZsYWcgZm9yIH4zLzQgb2YgaXRz
IHF1ZXVlZA0KPiA+ID4gPiA+ID4gPj4gdXNiX3JlcXVlc3QsIHNvIGFuIElTT0MgZmFpbHVyZSBt
YXkgbm90IGltbWVkaWF0ZWx5IGludGVycnVwdCB0aGUgVVZDDQo+ID4gPiA+ID4gPiA+PiBnYWRn
ZXQgZHJpdmVyLCBsZWF2aW5nIG1vcmUgdGltZSBmb3IgdGhlIGZyYW1lIHRvIGZpbmlzaCBlbmNv
ZGluZy4NCj4gPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPiA+PiBJIGNvdWxkbid0IGZpbmQgYW55
IGNvbmNyZXRlIGVycm9yIGhhbmRsaW5nIHJ1bGVzIGluIHRoZSBVVkMgc3BlY3MsIHNvDQo+ID4g
PiA+ID4gPiA+PiBJIGFtIG5vdCBzdXJlIHdoYXQgdGhlIHByb3BlciBzb2x1dGlvbiBoZXJlIGlz
LiBUbyB0cnkgb3V0LCBJIGNyZWF0ZWQNCj4gPiA+ID4gPiA+ID4+IGEgcGF0Y2ggKGF0dGFjaGVk
IGJlbG93KSB0aGF0IGRlcXVldWVzIGFsbCBxdWV1ZWQgdXNiX3JlcXVlc3RzIGZyb20NCj4gPiA+
ID4gPiA+ID4+IHRoZSBlbmRwb2ludCBpbiBjYXNlIG9mIGFuIElTT0MgZmFpbHVyZSBhbmQgY2xl
YXJzIHRoZSB1dmMgYnVmZmVyDQo+ID4gPiA+ID4gPiA+PiBxdWV1ZS4gVGhpcyBlbGltaW5hdGVk
IHRoZSBwYXJ0aWFsIGZyYW1lcyB3aXRoIG5vIHBlcmNlaXZhYmxlIGZyYW1lDQo+ID4gPiA+ID4g
PiA+PiBkcm9wcy4NCj4gPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPiA+PiBTbyBteSBxdWVzdGlv
bnMgaGVyZSBhcmU6DQo+ID4gPiA+ID4gPiA+PiAxLiBJcyB0aGlzIGEga25vd24gaXNzdWUsIGFu
ZCBpZiBzbyBhcmUgdGhlcmUgd29ya2Fyb3VuZHMgZm9yIGl0Pw0KPiA+ID4gPiA+ID4gPj4gMi4g
SWYgdGhlIGFuc3dlciB0byBhYm92ZSBpcyAiTm8iLCBkb2VzIHRoZSBleHBsYW5hdGlvbiBhbmQg
bWl0aWdhdGlvbg0KPiA+ID4gPiA+ID4gPj4gc2VlbSByZWFzb25hYmxlPw0KPiA+ID4gPiA+ID4g
Pj4NCj4gPiA+ID4gPiA+ID4+IFBhdGNoIGZvbGxvd3MgKG1vc3RseSBmb3IgaWxsdXN0cmF0aW9u
LCBJIGNhbiBmb3JtYWxpemUgaXQgaWYNCj4gPiA+ID4gPiA+ID4+IG5lZWRlZCEpLiBJdCBhZGRz
IGEgbmV3ICdyZXFfaW5mbGlnaHQnIGxpc3QgdG8gdHJhY2sgcXVldWVkDQo+ID4gPiA+ID4gPiA+
PiB1c2JfcmVxdWVzdHMgdGhhdCBoYXZlIG5vdCBiZWVuIGdpdmVuIGJhY2sgdG8gdGhlIGdhZGdl
dCBkcml2ZXIgYW5kDQo+ID4gPiA+ID4gPiA+PiBkcm9wcyBhbGwgdGhlIHF1ZXVlZCByZXF1ZXN0
cyBpbiBjYXNlIG9mIGFuIElTT0MgZmFpbHVyZS4gVGhlIG90aGVyDQo+ID4gPiA+ID4gPiA+PiBj
aGFuZ2VzIGFyZSBmb3IgdGhlIGV4dHJhIGJvb2trZWVwaW5nIHJlcXVpcmVkIHRvIGhhbmRsZSBk
cm9wcGluZyBhbGwNCj4gPiA+ID4gPiA+ID4+IGZyYW1lcy4gSSBoYXZlbid0IGJlZW4gYWJsZSB0
byBjb25maXJtIGl0LCBidXQgYXMgZmFyIGFzIEkgY2FuIHRlbGwNCj4gPiA+ID4gPiA+ID4+IHRo
ZSBpc3N1ZSBleGlzdHMgYXQgVG9UIGFzIHdlbGwuDQo+ID4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gUGVyaGFwcyB0aGlzIGNvbnZlcnNhdGlvbiB3aXRoIEplZmYgbWF5IGV4cGxh
aW4gdGhlIGlzc3VlcyB5b3Ugb2JzZXJ2ZWQ6DQo+ID4gPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMTAyMTE2NDM0OS5mZnQ0
eXFueHV6dHNxZGV1QHN5bm9wc3lzLmNvbS9fXzshIUE0RjJSOUdfcGchZUszVnlBcTd2WDcwdkEt
V0pMQTZfYlBNYlpGeDBuMzN3SDM5Skl0SHp3Q05WcUtTa04yYUcwaXpGMEdaUFdxWXhrZ0wtZk5p
bldsSVc3MUhiR0dDJA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVG8gc3VtbWFyaXplZCB0aGUgbG9u
ZyBjb252ZXJzYXRpb24sIHRoZSBVVkMgbmVlZHMgdG8gbWFpbnRhaW4gYQ0KPiA+ID4gPiA+IGNv
bnN0YW50IHF1ZXVlIG9mIHVzYiByZXF1ZXN0cy4gRWFjaCByZXF1ZXN0IGlzIHNjaGVkdWxlZCBm
b3IgYSBzcGVjaWZpYw0KPiA+ID4gPiA+IGludGVydmFsLiBJZiB0aGUgVVZDIGNvdWxkbid0IGtl
ZXAgdXAgZmVlZGluZyByZXF1ZXN0cyB0byB0aGUNCj4gPiA+ID4gPiBjb250cm9sbGVyLCB0aGVu
IHdlIHdpbGwgaGF2ZSBzdGFsZSByZXF1ZXN0cyBhbmQgbWlzc2VkIGlzb2MuDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBGcm9tIHRoZSBkaXNjdXNzaW9uIGFuZCByZXZpZXcsIHRoZSBVVkMgY291bGRu
J3QgcXVldWUgcmVxdWVzdHMgZmFzdA0KPiA+ID4gPiA+IGVub3VnaC4gVGhlIHByb2JsZW0gaXMg
ZXhhY2VyYmF0ZWQgd2hlbiB5b3UgcmVkdWNlIHRoZSBpbnRlcnJ1cHQNCj4gPiA+ID4gPiBmcmVx
dWVuY3kgd2l0aCBub19pbnRlcnJ1cHQgc2V0dGluZy4gVGhlIGR3YzMgZHJpdmVyIGhhcyBzb21l
IGJhc2ljDQo+ID4gPiA+ID4gbWVjaGFuaXNtIHRvIGRldGVjdCBmb3IgdW5kZXJydW4gYnkgY2hl
Y2tpbmcgaWYgdGhlIHF1ZXVlIGlzIGVtcHR5LCBidXQNCj4gPiA+ID4gPiB0aGF0J3Mgbm90IGVu
b3VnaCB0byB3b3JrYXJvdW5kIGl0Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gWW91ciBzdWdnZXN0
aW9uIHRvIGRlcXVldWUgdGhlIHJlcXVlc3Qgd291bGQgbWVhbiB0aGUgY29udHJvbGxlciBkcml2
ZXINCj4gPiA+ID4gPiB3aWxsIHJlc2NoZWR1bGUgdGhlIGlzb2MgdHJhbnNmZXIgYWdhaW4sIHdo
aWNoIHJlc2NoZWR1bGUgdGhlIG5leHQNCj4gPiA+ID4gPiByZXF1ZXN0IGZvciBhIG5ldyBpbnRl
cnZhbCAocG90ZW50aWFsbHkgYXZvaWQgYmVpbmcgc3RhbGUpLiBUaGF0J3MgZmluZSwNCj4gPiA+
ID4gPiBidXQgdGhhdCBtYXkgbm90IGJlIGEgZ3JlYXQgc29sdXRpb24gYmVjYXVzZSB3ZSdyZSBz
dGlsbCBwbGF5aW5nIGNhdGNoDQo+ID4gPiA+ID4gdXAgYW5kIHRoZSBtaXNzZWQgaXNvYyBhbHJl
YWR5IGhhcHBlbmVkLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gWW91IG1heSB0cnkgdG8gZG8gdGhl
IGZvbGxvd2luZ3MgdG8gbWl0aWdhdGUgdGhpcyBpc3N1ZToNCj4gPiA+ID4gPiAxKSBNYWtlIHN1
cmUgVVZDIHRvIG9ubHkgcXVldWluZyByYXRlIGlzIGNvbnN0YW50LiBQZXJoYXBzIHF1ZXVlIGR1
bW15DQo+ID4gPiA+ID4gICAgcmVxdWVzdHMgaW4gYmV0d2VlbiB0aW1lIGdhcHMgaWYgbmVlZCBi
ZT8NCj4gPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGlzIGV4dHJlbWVseSBoZWxwZnVsLCB0aGFuayB5
b3UhIEkgaGF2ZSBhIHNvbWV3aGF0IGJhc2ljDQo+ID4gPiA+IHF1ZXN0aW9uOiBGb3IgYW4gaXNv
YyByZXF1ZXN0LCBpcyBpdHMgImZyZXNobmVzcyIgZGV0ZXJtaW5lZCBmcm9tIHRoZQ0KPiA+ID4g
PiB0aW1lIGF0IHdoaWNoIHVzYl9lcF9xdWV1ZSBpcyBjYWxsZWQsIG9yIGZyb20gdGhlIHRpbWUg
YXQgd2hpY2ggdGhlDQo+ID4gPiA+IHByZXZpb3VzIHJlcXVlc3Qgd2FzIHRyYW5zZmVycmVkIHRv
IHRoZSBob3N0PyBJZiB0aGUgImZyZXNobmVzcyIgaXMNCj4gPiA+ID4gZGV0ZXJtaW5lZCBmcm9t
IHRoZSB0aW1lICd1c2JfZXBfcmVxdWVzdCcgd2FzIGNhbGxlZCwgSSB3b25kZXIgaWYgdGhlDQo+
ID4gPiA+ICJ1bmRlcnJ1biIgaXMgYXJ0aWZpY2lhbCBiZWNhdXNlIFVWQyBHYWRnZXQgZHJpdmVy
IHB1bXBzIGFsbCBmcmVlDQo+ID4gPiA+IHVzYl9yZXF1ZXN0cyBhdCBvbmNlLCBhbmQgdGhlbiB3
YWl0cyBhcm91bmQgZG9pbmcgbm90aGluZyB3aGlsZSB0aGUNCj4gPiA+ID4gdXNiX3JlcXVlc3Rz
IGdldCBzdGFsZSBpbiB0aGUgY29udHJvbGxlcidzIHF1ZXVlLiBJbiB0aGlzIGNhc2UsIGp1c3QN
Cj4gPiA+ID4gc2xvd2luZyB0aGUgZW5jb2RlIGxvb3AgdG8gd2FpdCBhIGxpdHRsZSBiZWZvcmUg
cXVldWluZyBtb3JlIHJlcXVlc3RzDQo+ID4gPiA+IHNob3VsZCBkbyBlZmZlY3RpdmVseSB3aGF0
IHlvdSBzdWdnZXN0IGFib3ZlPw0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IEhlcmUncyBhIHNpbXBs
aWZpZWQgdmVyc2lvbiBvZiBob3cgaXQgd29ya3M6DQo+ID4gPiAoTm90ZSB0aGF0IEknbGwgYmUg
dGFsa2luZy91c2luZyB1c2IgcmVxdWVzdCBhcyBpZiBpdCdzIFRSQnMgYW5kIGFsc28NCj4gPiA+
IGlnbm9yZSBTRy4gSSB3aWxsIGFsc28gb25seSBmb2N1cyBhYm91dCB0aGUgY3VycmVudCBoYW5k
bGluZyBvZiB0aGUNCj4gPiA+IGdhZGdldCBkcml2ZXIgYW5kIGR3YzMgZHJpdmVyLikNCj4gPiAN
Cj4gPiBJIGFwcHJlY2lhdGUgeW91IHRha2luZyB0aGUgdGltZSB0byBleHBsYWluIHRoaXMuIFRo
aXMgaXMgdmVyeQ0KPiA+IGVubGlnaHRlbmluZywgdGhhbmsgeW91IQ0KPiA+IA0KPiA+ID4NCj4g
PiA+IFRoZSBjb250cm9sbGVyIHRyYWNrcyB0aGUgY3VycmVudCB1ZnJhbWUuIEZvciBpc29jIGVu
ZHBvaW50LCB3aGVuIHlvdQ0KPiA+ID4gY2FsbCB1c2JfZXBfcXVldWUoKSwgdGhlIGNvbnRyb2xs
ZXIgZG9lc24ndCBjb25zdW1lIHRoZSByZXF1ZXN0IHJpZ2h0DQo+ID4gPiBhd2F5LiBUaGUgcmVx
dWVzdCBpcyBzY2hlZHVsZWQgZm9yIGEgc3BlY2lmaWMgaW50ZXJ2YWwuIEZvciBVVkMsIGFuDQo+
ID4gPiBpbnRlcnZhbCBpcyBhIHNpbmdsZSB1ZnJhbWUgKDEyNXVzKS4gQXMgdGhlIGN1cnJlbnQg
dWZyYW1lIGtlZXBzDQo+ID4gPiBpbmNyZW1lbnRpbmcsIGVhY2ggcmVxdWVzdCBvbiBhIHF1ZXVl
IGlzIGNvbnN1bWVkLiBJZiB0aGVyZSdzIG5vIHJlcXVlc3QNCj4gPiA+IGF2YWlsYWJsZSBmb3Ig
dGhlIGN1cnJlbnQgdWZyYW1lLCB0aGUgbmV4dCBxdWV1ZWQgcmVxdWVzdCBpcyBjb25zaWRlcmVk
DQo+ID4gPiBzdGFsZSBvciBleHBpcmVkLiBUaGlzIGNhc2UgaXMgY29uc2lkZXJlZCB1bmRlcnJ1
bi4NCj4gPiA+DQo+ID4gPiAiZnJlc2huZXNzIiBtZWFucyB0aGUgcmVxdWVzdCBpcyBzY2hlZHVs
ZWQgZm9yIGEgZnV0dXJlIHVmcmFtZS4gInN0YWxlIg0KPiA+ID4gbWVhbnMgdGhlIHJlcXVlc3Qg
aXMgcXVldWVkIGZvciBhIHBhc3QgdWZyYW1lLiBJc29jIGRhdGEgaXMgdGltZQ0KPiA+ID4gc2Vu
c2l0aXZlLiBTbyBpZiB0aGUgZGF0YSBpc24ndCBnb25lIG91dCBhdCBhIHNwZWNpZmljIHRpbWUs
IHRoZW4gaXQncw0KPiA+ID4gZHJvcHBlZC4NCj4gPiA+DQo+ID4gPiBUaGUgcHJvYmxlbSB3aXRo
IG1hbnkgZ2FkZ2V0IGRyaXZlcnMgdGhhdCB1c2UgaXNvYyBlbmRwb2ludCBpcyB0aGF0IHRoZXkN
Cj4gPiA+IG9ubHkgcXVldWUgbW9yZSByZXF1ZXN0cyB3aGVuIHRoZXkgZ2V0IG5vdGlmaWVkIHRo
YXQgdGhlIHByZXZpb3VzIHNldCBvZg0KPiA+ID4gcmVxdWVzdHMgYXJlIGNvbXBsZXRlZC4gVGhp
cyBjcmVhdGVzIHRpbWUgZ2FwcyB3aGljaCBjYW4gc3RhcnZlIHRoZQ0KPiA+ID4gY29udHJvbGxl
ciBvZiBtb3JlIHJlcXVlc3RzLg0KPiA+ID4NCj4gPiA+IFdlIGhhdmUgc29tZSBiYXNpYyBtZWNo
YW5pc20gaW4gZHdjMyB0byByZXNjaGVkdWxlIG5ldyByZXF1ZXN0cyB3aGVuDQo+ID4gPiB0aGVy
ZSdzIG1pc3NlZCBpc29jIGFuZCB0aGUgcXVldWUgaXMgZW1wdHkgZm9yIFVWQy4gSG93ZXZlciB0
aGF0J3Mgbm90DQo+ID4gPiBlbm91Z2guIFRoZSB0aW1lIHRoZSBjb250cm9sbGVyIGNvbnN1bWVz
IHRoZSByZXF1ZXN0IGFuZCB0aGUgdGltZSB0aGUNCj4gPiA+IGRyaXZlciBoYW5kbGVzIHRoZSBp
bnRlcnJ1cHQgaXMgZGlmZmVyZW50LiBUaGUgZHJpdmVyIG1heSBub3Qga25vdyB0aGF0DQo+ID4g
PiBxdWV1ZSBpcyBlbXB0eSB1bnRpbCBpdCdzIGFscmVhZHkgdG9vIGxhdGUuIFRoZSBnYWRnZXQg
ZHJpdmVyIGp1c3QgbmVlZHMNCj4gPiA+IHRvIG1ha2Ugc3VyZSB0byBrZWVwIHRoZSByZXF1ZXN0
IHF1ZXVlIHRvIGF0IGxlYXN0IFggYW1vdW50IG9mIHJlcXVlc3RzLg0KPiA+ID4gTm90ZSB0aGF0
IDEyNXVzIGlzIHJlbGF0aXZlbHkgZmFzdC4NCj4gPiANCj4gPiBJIHNlZSwgYW5kIEkgdGhpbmsg
SSB1bmRlcnN0YW5kIEdyZWcncyBwcmV2aW91cyBjb21tZW50IGJldHRlciBhcw0KPiA+IHdlbGw6
IFRoZSBVVkMgZHJpdmVyIGlzbid0IGZhbGxpbmcgYmVoaW5kIG9uIHRoZSB2aWRlbyBzdHJlYW0s
IGl0IGlzDQo+ID4gZmFsbGluZyBiZWhpbmQgdGhlIHVzYiBjb250cm9sbGVyJ3MgbW9ub3Rvbmlj
IGlzb2Mgc3RyZWFtLg0KPiA+IA0KPiA+IEZyb20gd2hhdCBJIGNhbiBzZWUsIHRoaXMgbGVhdmVz
IHVzIGluIGFuIGludGVyZXN0aW5nIHBsYWNlOiBVVkMNCj4gPiBhbGxvd3MgdGhlIGhvc3QgdG8g
Y29uZmlndXJlIHRoZSBjYW1lcmEncyBvdXRwdXQgcmVzb2x1dGlvbiBhbmQgZnBzLA0KPiA+IHdo
aWNoIGVmZmVjdGl2ZWx5IGNvbnRyb2xzIGhvdyBmYXN0IHRoZSBjYW1lcmEgaXMgZ2VuZXJhdGlu
ZyBkYXRhLg0KPiA+IFRoaXMgaXMgYXQgb2RkcyB3aXRoIHRoZSBVVkMgZ2FkZ2V0IGRyaXZlciwg
d2hpY2ggY3VycmVudGx5IHBhY2tzIGVhY2gNCj4gPiB2aWRlbyBmcmFtZSBpbnRvIGFzIGZldyB1
c2JfcmVxdWVzdHMgYXMgcG9zc2libGUgKHVzaW5nIHRoZSBmdWxsDQo+IA0KPiBIbS4uLiBJIHdv
dWxkIHNwcmVhZCB0aGUgZGF0YSB0byBtb3JlIHJlcXVlc3RzIGFuZCBub3QgcHV0IGFsbCB0aGUg
ZWdncw0KPiBpbiBvbmUgYmFza2V0LiBJdCBzaG91bGRuJ3QgYmUgYW4gaXNzdWUgd2l0aCBkd2Mz
IGNvbnRyb2xsZXIsIGJ1dCBzb21lDQo+IGhvc3RzIGFyZW4ndCB0aGUgZ3JlYXRlc3Qgd2hlbiBo
YW5kbGluZyBpc29jIGF0IGhpZ2ggdHJhbnNmZXIgcmF0ZS4NCj4gDQo+ID4gYXZhaWxhYmxlIHNp
emUgaW4gdXNiX3JlcXVlc3RzKS4gRWZmZWN0aXZlbHksIHRoZSBVVkMgZ2FkZ2V0IGRyaXZlcg0K
PiA+IGF0dGVtcHRzIHRvIHVzZSB0aGUgImZ1bGwiIGJhbmR3aWR0aCBvZiBpc29jIHRyYW5zZmVy
cyBldmVuIHdoZW4gdGhlDQo+ID4gY2FtZXJhIGlzbid0IGdlbmVyYXRpbmcgZGF0YSBmYXN0IGVu
b3VnaC4gRm9yIGV4YW1wbGUsIGluIG15DQo+ID4gb2JzZXJ2YXRpb25zOiAxIHZpZGVvIGZyYW1l
IGlzIH4yMmtCLiBBdCAzMGZwcywgdGhpcyByZXByZXNlbnRzIDEvMzANCj4gPiBvZiB0aGUgYW1v
dW50IG9mIGRhdGEgdGhlIGNhbWVyYSB3b3VsZCBnZW5lcmF0ZSBpbiBhIHNlY29uZC4gVGhpcyAy
MmtCDQo+ID4gaXMgc3BsaXQgaW50byA4IHVzYl9yZXF1ZXN0cyB3aGljaCBpcyBhYm91dCAxLzEw
MDAgdGhlIG51bWJlciBvZg0KPiA+IHJlcXVlc3RzIFVWQyBkcml2ZXIgbmVlZHMgdG8gZ2VuZXJh
dGUgcGVyIHNlY29uZCB0byBwcmV2ZW50IGlzb2MNCj4gPiBmYWlsdXJlcyAoYXNzdW1pbmcgMTI1
dXMgbW9ub3RvbmljIHVmcmFtZXMpLiBBc3N1bWluZyBzb21lIGZ1ZGdlDQo+ID4gZmFjdG9yIGZy
b20gdGhlIHNpbXBsaWZpY2F0aW9ucyBpbiB5b3VyIGV4cGxhbmF0aW9uIGdpdmVzIHRoZSB1dmMN
Cj4gPiBkcml2ZXIgc29tZSBleHRyYSBsZWV3YXkgd2l0aCByZXF1ZXN0IHF1ZXVpbmcsIHdlJ3Jl
IHN0aWxsIHJvdWdobHkgdHdvDQo+ID4gb3JkZXIgb2YgbWFnbml0dWRlcyBvdXQgb2Ygc3luYy4g
RXZlbiB3aXRoIHBlcmZlY3QgJ2NvbXBsZXRlJw0KPiA+IGNhbGxiYWNrcyBhbmQgdmlkZW8gZnJh
bWUgZW5jb2RpbmdzLCBhbiB1bmRlcnJ1biBzZWVtcyBpbmV2aXRhYmxlLg0KPiA+IERhdGEgaXMg
YmVpbmcgZ2VuZXJhdGVkIGF0IGEgZmFyIHNsb3dlciByYXRlIHRoYW4gaXQgaXMgYmVpbmcNCj4g
PiB0cmFuc2ZlcnJlZC4gRG9lcyB0aGlzIHJlYXNvbmluZyBzZWVtIHZhbGlkPw0KPiA+IA0KPiA+
IEp1c3QgYXMgYSB0ZXN0IEknbGwgdHJ5IHVwZGF0aW5nIHRoZSBVVkMgZHJpdmVyIHRvIGNvbnN1
bWUgMjY2DQo+ID4gdXNiX3JlcXVlc3RzIHBlciB2aWRlbyBmcmFtZSAofjEvMzAgb2YgODAwMCks
IHdoaWNoIHNob3VsZCBiZSBlbm91Z2gNCj4gPiB0byBrZWVwIHRoZSB1c2IgY29udHJvbGxlciBx
dWV1ZSBvY2N1cGllZCBmb3IgfjEvMzBzLiBJZGVhbGx5LCBieSB0aGUNCj4gPiB0aW1lIHRoZSBj
b250cm9sbGVyIHF1ZXVlIGlzIGVtcHR5LCB0aGUgY2FtZXJhIHdvdWxkIGhhdmUgcHJvZHVjZWQg
YQ0KPiANCj4gWW91IG1lYW4gcXVldWUgMjY2IHJlcXVlc3RzIGF0IG9uY2U/IFRoaXMgbWF5IHdv
cmsuIFRoZXJlIHNob3VsZCBiZSBhDQo+IGxhcmdlIGVub3VnaCB0aW1lIGdhcCBzbyB0aGF0IHRo
ZSBkd2MzIGRyaXZlciBjYW4gcHJvcGVybHkgZGV0ZWN0IGFuDQo+IGVtcHR5IHF1ZXVlIHRvIGJl
IGFibGUgdG8gcmVzY2hlZHVsZSBuZXcgcmVxdWVzdHMgZm9yIHRoZSBuZXh0IHZpZGVvDQo+IGZy
YW1lLg0KDQpUaGF0J3MgYSBsb3Qgb2YgcmVxdWVzdHMgdG8gYWxsb2NhdGUuIENhbid0IHlvdSBq
dXN0IG1ha2Ugc3VyZSB0byBub3RpZnkNCnRoZSBnYWRnZXQgZHJpdmVyIG1vcmUgb2Z0ZW4gdG8g
cmVxdWV1ZSByZXF1ZXN0cyBhbmQgZG9uJ3Qgc2V0DQpub19pbnRlcnJ1cHQgYXMgb2Z0ZW4/DQoN
Cj4gDQo+ID4gbmV3IGZyYW1lLiBUaGlzIGRvZXNuJ3Qgc29sdmUgdGhlIGlzc3VlIHdpdGggbGF0
ZW5jaWVzIGFyb3VuZCBjYWxsYmFjaw0KPiA+IGFuZCBhbiBpc29jIGZhaWx1cmUgbWlnaHQgc3Rp
bGwgaGFwcGVuLCBob3BlZnVsbHkgdGhlIGZhaWx1cmUNCj4gPiBmcmVxdWVuY3kgaXMgcmVkdWNl
ZCBiZWNhdXNlIFVWQyBxdWV1ZXMgZW5vdWdoIHJlcXVlc3RzIHBlciB2aWRlbw0KPiA+IGZyYW1l
IHRvIG5vdCBzdGFydmUgdGhlIGNvbnRyb2xsZXIncyBxdWV1ZSB3aGlsZSB3YWl0aW5nIG9uIGEg
bmV3DQo+ID4gZnJhbWUgYW5kIHRoZSBvbmx5IHdheSB0aGV5IGdvIG91dCBvZiBzeW5jIGlzIGZy
b20gJ2NvbXBsZXRlJyBjYWxsYmFjaw0KPiA+IHRpbWluZ3MuIEkgYW0gYXNzdW1pbmcgdGhpcyBo
YXMgYmVlbiB0cmllZCBiZWZvcmUsIGJ1dCBteSBMS01MIHNlYXJjaA0KPiA+IHNraWxscyBhcmUg
ZmFpbGluZyBhbmQgSSBjYW4ndCBmaW5kIG11Y2ggb24gaXQuDQo+ID4gDQo+ID4gPg0KDQpCUiwN
ClRoaW5oDQo=
