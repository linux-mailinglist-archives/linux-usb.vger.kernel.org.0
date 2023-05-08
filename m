Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603BC6FBB0D
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 00:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbjEHW2T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 18:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbjEHW2S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 18:28:18 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D76A7ABC
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 15:28:12 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348JnZI0025463;
        Mon, 8 May 2023 15:28:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=V0jxnQwUHxL6EwU+Kob9e3Tdlx8TGcOYzFbL6KGvajw=;
 b=NDQ07car8FtK7y4x4nWfGio4tNCGMdq8U/1O4D8gsyFEn4BhOULicO8kBnI6HL8pGRj1
 VJUZ1rElYO24koJGXfR8tdCQxZko/Tje+P9QT9efSkycp9ZSxb3bldQ5B5umvA2TpQXv
 ciyrWWFRP9v9euHJ29EQ5WRAaCiXX0YXx7u0AKcJBocXf5KOd46/epn1YaRn0mINnc+I
 +4MdrA0yj7qoPuuJyLWWmbjZU+RFaz9d78ysc5ekKooibyKbIip5/wTzk7kieSM4Vgh8
 w9DqLD7807LpQRlOlblCr+9XQleOuDjegQZag+R99UzhUuUlevH5+QqBmU5S+DNptuVv Zw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf7700qas-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 May 2023 15:28:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683584876; bh=V0jxnQwUHxL6EwU+Kob9e3Tdlx8TGcOYzFbL6KGvajw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=OwHlX/P9mVQbXJ4VtLqmnHseSCFY1SPStkjykS3/IJEySq3iitbR/+KQP5tyTpX6Q
         YfJGrX3OPejO8LaNjVfrqynyyeUZdE6psx9prcKNxyp420m9lWT5K/KyE2VFyLqQEg
         AtupXVCgJTw5reFy1pj4cTjsOY9eT+2vEallpGZERyJaWFQRm26KzlxDU+fyLgWtFh
         gcFMiFTVsTxZO9MD0pXKhReFeU18lcVm29au9MA2opwKojlmySAHc1jNr2Qhq5w/ap
         jvsWHbQpLEz0oVf58NRyylWwl0sp+7J+8kc5esbLwzcV2CxqqtZMIXC7uDECvrnc33
         LYHREFU0r03jA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A4C29404D1;
        Mon,  8 May 2023 22:27:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id B6B91A006E;
        Mon,  8 May 2023 22:27:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aOYOn9Ex;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id F0CAA40759;
        Mon,  8 May 2023 22:27:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8uznRLbIpRVy3V9R7HIz8WD96LFTTrGEqF4vqxjqkdInpELutfKu7w9tHJdMdysMl8Aae5ItSXbIWv4jp+Tq3ie8gHEpoR3J9UMtcBZ3dp8dMHp6fwtXjsmjhPCAgbjEj1vpCtQw7UzSlwKgRGf1ry0pxilIwvNUSc5bI6riZhuzvzWsCw3hCw2GvrqvexiilL7lgfskQLby64r+ucV7HuhdwiobuagBOBUvuxhjnTpLe8PMoMdw1PuONUtMGLTGVg5B3T2d3mer0R+JZabBzMkcvOPxQr+WzLGjkQYpie0hVWKQSTDO/3sKJAqfPOCrNezC7FAVE0TAn/7872hXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0jxnQwUHxL6EwU+Kob9e3Tdlx8TGcOYzFbL6KGvajw=;
 b=gCH3uXAqTlWh4WZUVT5iRbn33/j+TQHLW1/kSWv0vBzmO7u8hVyf6KMrVhVEXMbNWytOcfZ4v/6iYXocHo1gR5HiYRr0dkaOJJz8EtQqLwX/j1Zuvb3NhpMHWMHSMt2pN3tLrPfGNQSH7Es17qeu1TWLK/C5d0UEI8ChO1dRA/FzWGI1dGkKmjM/l4OB3nKFVB2IN5B9fbXWuar2tbLIiSq60ZXQb8iBl61i3aWW+O16rJKYa520iPerUyjwaKy9VCjYqVnQiv0j5sslZQXcRIXAek0w8yOe2EbN8B+39uJMWsovz4HCKNe3PX+jYpS74jwQi9ruxkN1Bdscv9saqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0jxnQwUHxL6EwU+Kob9e3Tdlx8TGcOYzFbL6KGvajw=;
 b=aOYOn9Exb/yN99cV/M9+7f2QDUFKYUJsR4jSHJKyIHgTO2Jyu7tsQu+JFgGZ+37B2cQK/DiAIJJvvtgUMKGBFvRNjB9h+hVv11Qhb/D5gB4jFBjs57g9eUVC6VAZn/NkX0fWBQTSDi2HE749ZphwoiwaWOQDT3Z1a2Bqcgi0Dic=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CY8PR12MB8244.namprd12.prod.outlook.com (2603:10b6:930:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 22:27:52 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 22:27:52 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     James Ettle <james@ettle.org.uk>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ASM3242 SuperSpeed+ speed reporting
Thread-Topic: ASM3242 SuperSpeed+ speed reporting
Thread-Index: AQHZZZKmifUGUHjCtEqea20b7vzoc68aR7EAgDOHVgCAA153gA==
Date:   Mon, 8 May 2023 22:27:52 +0000
Message-ID: <20230508222749.qwozgeymzsbhnef3@synopsys.com>
References: <cbf6dfc7-7d0f-8b85-2f1e-de7d0129e742@ettle.org.uk>
 <20230404000718.4aeboi4gs6orcete@synopsys.com>
 <4ce7c155-30da-25cb-9eb3-b46622f4a827@ettle.org.uk>
In-Reply-To: <4ce7c155-30da-25cb-9eb3-b46622f4a827@ettle.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CY8PR12MB8244:EE_
x-ms-office365-filtering-correlation-id: b0092bee-78b4-48ed-c838-08db50137657
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FGMSqKoYb2hj/jj4SnirE1MNMITaUUzL701n20xc+TcH/Y0NuPlhMglIUFNOvwEZYC1qR8yNAMbO8QQhpwaTq5Pkt2ZrL0n9zAHSabI/tBlwkfkY9THpCLy0k7fxwiLEHYS9y4DiTp3KtHZwxthAuEVG2uYGluxEnjCmn6pKClPIzQdW4+TUiXk7l6H62pwN0h3rTUpbKGQTMfPZHDVEbIrOds+Fn+rTWWsULCzcN7dabxCDx9VWmtCeAT2HBVUxaQkGk7KMxw6euJLdDbb6QfgUcllcDJtwtVbrh3o3aW8oo6N8byGFKc2JAe5B8qjC0hcriheEeI/OGd/rN52cNPC0aXdGUqYdjkENBKqztDZbrLPie/jojEZwn8DcSiAlniD03tHYR1kGqLw0aJ7jKGZ6hfYqDEoKtjDqS/8F+Of70HAjSd7AJP8Kj/TMe5sgwpb3Byt6YfuWBjqhOVWW3ATBDz/BytKnNQxYDBx97ZKdFpZS2AFltmFjdh4QISLoNunGDIWHX2CvjdOW1qQDbwMkYjSQqKR1J4Parw5sLBeSmxrxm/CfcLTDNBqt+3yLVToyhAj1wutFIEr4KhLk08lH6E5tQlF++P0eG33KEd4a5uN/UCajEQId7oqD+Vz5XaMzbiDjGDtd7h3ZRdBPKg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199021)(2906002)(54906003)(478600001)(41300700001)(8676002)(8936002)(316002)(71200400001)(66946007)(5660300002)(66556008)(64756008)(66476007)(66446008)(6916009)(4326008)(76116006)(6486002)(966005)(6512007)(53546011)(1076003)(26005)(6506007)(186003)(36756003)(2616005)(83380400001)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmRWN3FYdDMwZng2VnIvRm8wbzNxSjFmWnlCYkI4WUU0VDhDNWpuZ3VSb3lz?=
 =?utf-8?B?NU4rUjVpaklGTW5DQU5reHlBOERqZWVoVDZteEtRYXNUZW5FNmYyWHZ2czNh?=
 =?utf-8?B?dEVoTWlOYUhnbVVZZFVnN1I4Y0FJQStLOWRrVFdXTjZqTlFFeXczeXpxdEoy?=
 =?utf-8?B?SlJRSVdEaFYxTnFkZnR3dHVpSWc1NU5JNEJVeUlLOENXMlFkOVVVQ25xS1pM?=
 =?utf-8?B?Yzl3dHNNQlNIdGF5UzFZclVOMTJibTVRQW85VUtkSXZmY0w4aFJFQVZYQUdC?=
 =?utf-8?B?SG1VUnVIQnNTaTZMdlRRUmkraFV3aTdsMTVSaVowUU1MWWpKbVc5WTY0anBV?=
 =?utf-8?B?d2s4NnZmZVZMMFJkdjNJdDZHMjgyQUtib2ZkT0pVbWF2eHVWcS9BUFJNVmdL?=
 =?utf-8?B?TUR3VWhhd21DY0QrQkJ2ejVSV3ZSdFEwSXM5M2ViUWlRcWlPUUFXbzBrVGJi?=
 =?utf-8?B?c0FFalRZQ3QrbExqdUwxUW02UWZJbGdmbHpYaHEvS3o3YWVJejRDTEM4WGJ1?=
 =?utf-8?B?Y2hpRElrMEJNdnVaSG5KVGRHVFFBajltcitGNE50dWo3czRUcllyZ0F5ZEVU?=
 =?utf-8?B?ZlVncis5VXRPNzEwNEZweU5uSTB3aVhOQThMUnEzbVR2R2VpNWZqVWpnaXZE?=
 =?utf-8?B?MlZpODIwSi9XNlZYK0xNNXQ3ZFJJVGNralRVcnB0T21Ud29TWjRWZnVuMDRM?=
 =?utf-8?B?NXQrMWlzemFnL21HTi9VYWtDenV1TVVabVNydDdkWEtHY21FODR3R0tmd3N2?=
 =?utf-8?B?Zy9BRXZ2SEREVmhqVWpyakZ0SXowZXNSa0hRVjFZZVZQSjRrQkJhQTgvYkcy?=
 =?utf-8?B?WVhZUHJkbUtVUWdMVjFhL1lEL2NvVktjL28wanhlS2syeG1yNS9YYkxZMTI4?=
 =?utf-8?B?Vzh2MlhLMkF6ekJQZjV2eDZBYWs2QURjQkZWbHdKRXZBanRJUXc4YkhBdndJ?=
 =?utf-8?B?SmcrK2l6UHQ2ZU40SnRhazZmUVNFbmgva01YRTF6d1F6UzRUc0VBTW4zdWU4?=
 =?utf-8?B?Q21oRkNNUldZSXBpbjJQUVllMUVQYkl2Vmg4VlRvWWIzaDJGUzQvN3lVVXFs?=
 =?utf-8?B?WnNRaG93eFQrTjFtQjhQMndiNkduM0JHREdsL3BxYkZZK1hKTzZvMndhMDFF?=
 =?utf-8?B?L2FJSDk4bXN6T2Y4R2xKZnZHWHdsVFRrVythTmtsdkJzajdySjJhT0J5RnRI?=
 =?utf-8?B?alRSVWFhNVJBQzFOSnRBNkdJcG5LOFBLbHJvbUJ4Y0ZoMXh3U3FGTWlIY2Vk?=
 =?utf-8?B?N0tFT0ppSXVMZ2t1TG9pTFprZG5DeU9BUzBQQzVYajUrcnNVTTFOM01wTWUy?=
 =?utf-8?B?aGc2ZU1MakxhRFltVFNrWkREK0V5SjNLcFJBZjQxTmtHeERlcm9lMXZTUk9O?=
 =?utf-8?B?cTdkUGtrY01HdndRMkV2aHhzSHc5ODducjlmVUFJRk9XdE5yNEhrbVFMamdZ?=
 =?utf-8?B?RlJ2N2dadHlhbW1YWlI0ZHRlWmRWc0RJaFBSRHpKK3RoM3ZJL0pHVFFUQ0Qv?=
 =?utf-8?B?bXpOOUJsU0JHVHdoUjZTd3lMUy91VGRsRDFnRE9ySkJYUGNaYzhDUzdnVnA2?=
 =?utf-8?B?UTlwRCtQTGpQRlVZK1BORTZ0clRYNjRBT3Z0L0hzcSsrUUFaM3FzdGxYa3RD?=
 =?utf-8?B?WS9yd2ZWcXQ2MnE4bERNS1VEeFV4SWQ4cnVxSFIvS1ZpUnd6M3VZVTBqdEpQ?=
 =?utf-8?B?elh5SnlrZjhpMm9CbXZ6aU5NL1NIeVJTOElySm1xTGlXNlA1NERQT1VSVjNF?=
 =?utf-8?B?aExLMFlNZ0trdXpxa1R5dUdsV2hPMldNUkt0VjY3NHQwSncvZlFXZng0eGdm?=
 =?utf-8?B?NFpjdXFRM29aOUZUcDFxd09tdFNkYk12UklselNNTFFzNDkwUjJpQitLWUZn?=
 =?utf-8?B?Z3FKRG1La2ZpSFYvaTd6dlZMbjNUZkJoODJTMGdQSVhVSmhqSHpJcUZMZEVy?=
 =?utf-8?B?RHFkalVlVXpSdUFISTA2cnhnU2JhSGsyT2x4MjdFTENzZmkxSjZJUjNIc2lP?=
 =?utf-8?B?cEx5ZEJqMWMyQ1dUWGNBU1pjWWtSSVRvZDJaVGFLVng1MzZQSDZ4S1Vaazdi?=
 =?utf-8?B?YXo5aSs5cWFxRzkvYS9ObWVnSjc3a085OGdCaE1UeTJjQXQwem1BajQ5UVk2?=
 =?utf-8?Q?tA2NSleS02g85JwVHD+4nJ9Hl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70487FD38AB1C844B733DF18ECA9E7B2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: UsBDPdI+U0jKqPiZa0EvslNhdRTzwkKpisWc1qxm9cPEju0+3eO6t5us4LMa+rHHZdl8KxsQgR/zFP1Ux822Xed+VKhscxmLtrbIPW64oqXnCDNVkzp0VAQpG+V3RRwMasSENL5UIfe9EnrU10SzNmmD9smXclOx1FEvLGFePPeMVlQgS+fB7zThZ7n4RNwaNCGlWaygBGP5HcETAQOIRW97+h0nEIHnK1df7vWMy8sVNYhoRgaUq+zSMobhDmYWtZHSB+TJ5xugT16/Wvz1CoMt311cErB2Ump21FxG8m5oJXlPT0AvvpquRcPVdzV3uwYT6L49fB0qdGayG3PZB7RXB5dCtdn38crI0mu5ninJVm6dZmwWm+N13FViVGwSk4xXunbUCC3XQJsjZQOq7sLlxJIOl+FJ0IZ/fYIoHmkf6aPVutUhvdwniIzv3yzJzRbiTOC78A3NPt3pZAOFt8k/6dlxkSwx4kJj7FqWefxpgWiIEcd38MVdRWJDxEEqmmFDwkM0HPRg+7XRis4ejCnUJWKuK4iy9+rF18M4818KJTUJc9sI1BI4ozeMu/69EJVesjGeQ1FQGKEUeeC8HYhPXnDlAedIItELFbBR6aw9ly0OWXeIgx7RIHUsdGcjFHs7gfxuM+YvZqUAIoAR8/wNogRHGK6xp+cmd56dMcjtX2cshmfmkD+w+Mo2LKchVuTQOr4A8ev08hXwFQ13W0pRD5uhFIHsuGYFXtr6NygEBbKrax9bASCzkR18MA9hWuHhmsnOM7qamDzqAytfuuNCMb0Nw58FG5Geb4nxfMiM20Xll/ZDtnmM2L6x4BjgxntbkwncPhOwFhysLTOnoQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0092bee-78b4-48ed-c838-08db50137657
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 22:27:52.2909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25iHLjBO9yR7myn6YL9IL/ltZxsZ0/P441Hgtnwda/gQ8tMo7Almj51MBLlaM+MVgUjQpCS1UxAdJdWVG2TCQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8244
X-Proofpoint-GUID: Nq8HZyMpHt4144XAEe-QeEGH5vCDbOTt
X-Proofpoint-ORIG-GUID: Nq8HZyMpHt4144XAEe-QeEGH5vCDbOTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=962 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305080149
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gU2F0LCBNYXkgMDYsIDIwMjMsIEphbWVzIEV0dGxlIHdyb3RlOg0KPiBIZWxsbywNCj4gDQo+
IE9uIDA0LzA0LzIwMjMgMDE6MDcsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBIaSwNCj4gPiAN
Cj4gPiBPbiBTdW4sIEFwciAwMiwgMjAyMywgSmFtZXMgRXR0bGUgd3JvdGU6DQo+ID4gPiBIZWxs
bywNCj4gPiA+IA0KPiA+ID4gSSBoYXZlIGEgMjBHYnBzIFVTQi1DIHBvcnQgb24gYSBwbHVnLWlu
IGNhcmQgdGhhdCB1c2VzIGFuIEFzbWVkaWEgQVNNMzI0Mg0KPiA+ID4gY29udHJvbGxlci4gV2hl
biBJIGF0dGFjaCBkZXZpY2VzIGNhcGFibGUgb2YgMTBHYnBzIG9yIDIwR2JwcywgbHN1c2IgLXQN
Cj4gPiA+IHJlcG9ydHMgdGhleSBhcmUgY29ubmVjdGVkIGF0IDVHYnBzLiBNeSB0ZXN0IGRldmlj
ZXMgYXJlOg0KPiA+ID4gDQo+ID4gPiAqIDEwR2JwcyBVU0IgaHViDQo+ID4gPiAqIFJUTDkyMTBC
IGJhc2VkIE5WTUUgZW5jbG9zdXJlLCAxMEdicHMNCj4gPiA+ICogQVNNMjM2WCBiYXNlZCBOVk1F
IGVuY2xvc3VyZSwgMjBHYnBzDQo+ID4gPiANCj4gPiA+IE5vdyB3aGVuIEkgZG8gdHJhbnNmZXIg
dGVzdHMgb24gdGhlIE5WTUUgZW5jbG9zdXJlcyBJIGdldCBzcGVlZHMgdG9vIGhpZ2gNCj4gPiA+
IGZvciA1R2Jwcy4gSW4gZmFjdCBldmVyeXRoaW5nIGlzIGNvbnNpc3RlbnQgd2l0aCB0aGVtIGNv
bm5lY3RpbmcgYXQgdGhlaXINCj4gPiA+IGJlc3QgcG9zc2libGUgU1NQIHNwZWVkcy4gU28gaXQg
bG9va3MgbGlrZSBqdXN0IHRoZSBzcGVlZCByZXBvcnRpbmcgaXMNCj4gPiA+IGluY29ycmVjdC4N
Cj4gPiA+IA0KPiA+ID4gSXQgc2VlbXMgdGhpcyBwcm9ibGVtIGhhcyBiZWVuIGVuY291bnRlcmVk
IGJlZm9yZSBpbiB0aGUgZm9sbG93aW5nIHRocmVhZCwgYQ0KPiA+ID4gYml0IG92ZXIgYSB5ZWFy
IGFnbzoNCj4gPiA+IA0KPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9DQUtSYTFVNnJ1a0JCd1d4MHZOMndxaUhNYlVIOXpXc2MteTF3
a25PQ3ZodWVxV3NUN3dAbWFpbC5nbWFpbC5jb20vX187ISFBNEYyUjlHX3BnIWJlQWVJVW5vaHBr
QUVzOTJpUEJoZzl4RkYzd3lfbmVDTThBYktPa0N1bzRRbzh3Nlh2RUQxSWNTdGk3ejVBUXBNQm1O
WG9qZHl3YTdOVW9yTnlyayQNCj4gPiA+IA0KPiA+ID4gaW4gd2hpY2ggVGhpbmggTmd1eWVuIHBv
c3RlZCB0aGUgZm9sbG93aW5nIHBhdGNoOg0KPiA+ID4gDQo+ID4gPiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzY5MDhhYTY5LTQ2OWItOGY5
Mi04ZTE5LTYwNjg1ZjUyNGY5Y0BzeW5vcHN5cy5jb20vX187ISFBNEYyUjlHX3BnIWJlQWVJVW5v
aHBrQUVzOTJpUEJoZzl4RkYzd3lfbmVDTThBYktPa0N1bzRRbzh3Nlh2RUQxSWNTdGk3ejVBUXBN
Qm1OWG9qZHl3YTdOVC1WazdDaiQNCj4gPiA+IA0KPiA+ID4gSSd2ZSBhcHBsaWVkIHRoaXMgdG8g
Ni4yLjkgYW5kIG5vdyB0aGUgc3BlZWQgYXJlIGNvcnJlY3RseSByZXBvcnRlZCBpbg0KPiA+ID4g
bHN1c2IuIENhbiBJIHBvbGl0ZWx5IGFnaXRhdGUgZm9yIGdldHRpbmcgdGhpcyBwYXRjaCByZXZp
dmVkIGFuZCBwdXNoZWQNCj4gPiA+IHVwc3RyZWFtPw0KPiA+ID4gDQo+ID4gDQo+ID4gSXQgd2Fz
IGp1c3QgYSB0ZXN0aW5nIHBhdGNoIHRvIHZlcmlmeSBpZiB0aGUgd29ya2Fyb3VuZCB3b3Jrcy4g
SXQncyBub3QNCj4gPiBrZXJuZWwgcmVhZHkuIEEgcHJvcGVyIHBhdGNoIHJlcXVpcmVzIGEgbmV3
IHhoY2kgcXVpcmsgbWF0Y2hpbmcgdGFyZ2V0ZWQNCj4gPiBBc21lZGlhIGhvc3QuIElmIHNvbWVv
bmUgd2FudHMgdG8gdGFrZSB0aGlzIGRpZmYgc3VnZ2VzdGlvbiBhbmQgcmVzcGluDQo+ID4gaXQg
Zm9yIGEgcHJvcGVyIHBhdGNoICh3aXRoIHByb3BlciB0ZXN0aW5nKSwgSSBjYW4gaGVscCByZXZp
ZXcgaXQuDQo+IA0KPiBVbmRlcnN0b29kLiBVbmZvcnR1bmF0ZWx5IGl0J3MgYmV5b25kIG15IGFi
aWxpdHkgdG8gbWFrZSBzdWNoIGEgcGF0Y2gNCj4gbXlzZWxmLiBTbyB0aGlzIGRvZXNuJ3QgZ2V0
IGxvc3QsIHNob3VsZCBJIG9wZW4gYSBidWcgaW4gS2VybmVsIEJ1Z3ppbGxhLCBvcg0KPiBpcyBp
dCB0cmFja2VkIGVsc2V3aGVyZT8NCj4gDQoNClN1cmUuIEkgdGhpbmsgaXQncyBhIGdvb2QgaWRl
YSB0byB0cmFjayB0aGlzIHNvbWV3aGVyZS4NCg0KVGhhbmtzLA0KVGhpbmg=
