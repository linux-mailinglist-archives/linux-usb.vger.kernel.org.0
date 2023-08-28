Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC87278ADFB
	for <lists+linux-usb@lfdr.de>; Mon, 28 Aug 2023 12:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjH1KyX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 06:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbjH1KyF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 06:54:05 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899A7CE1
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 03:53:45 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37S8SrDY030540;
        Mon, 28 Aug 2023 03:53:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=euW5yjngeNDOXx5QiqQeSZNntwmsxq3VZIcYdPF9VcM=;
 b=Utxa7NiNAAm6OFT9t/0+KBGluCQJ9Y70YMOJE1gHF8w225x2mDAKCABCcB2ZlHiWC3a3
 e5SVRlad7uA8Hp2ASFYc238V7TId0YW5d/4l7SKSNQEjBkHhtGVmNi7/G+5HWid3By1C
 SFKa2a2FA1ndBd4dbxNcTmddlSy+QNWk1p5UGbD4w5xADKOHk4yUkufm3HCXEgNb5rI9
 2dJa4mWgzZeiXM0RaYKrK6qRl6BeLDQxbx+UIj56Q17L3RaznfsT4RwEbV3yaA5YFu0R
 +yekD+8KtDls2jBPo0x6v4v3KOtGoCwCCEmeMy7dIIy4o6bnHUKnApxsCmOghSBdG3/L Lw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3sqgauedys-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 03:53:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1693219983; bh=euW5yjngeNDOXx5QiqQeSZNntwmsxq3VZIcYdPF9VcM=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=P7zby1xlC/93b2mZuTijUWHtxKFPTWBkeryfkaol121TC8e9AYj4Oty5pk7WH6N5/
         /dEPs1HoNUfT2QOkBejLOGCTMIzGU+oIURBM4736zK824B3mwP5d+jVC6YFJ3xHXmd
         2N6J3aGnJl8OgvQvPDHVj1zCmsoDHvqa9Z4MvaCjCIww+nnYgbdzWIhtwD0yjNFRHc
         3clUVNKHpsBrTDgVpxbQxiQ+CeqLPovq2eUsw97MnyGRjACtCjRlA19zaqhT6y8Vos
         cPIZua+V+mRH2pUliwImXTvElwQEBsUJ+YvI0yA7CyjBRrdhGo5TJsYumm1GhcJJ2f
         QV8ITqS0qhZAQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C60D240121;
        Mon, 28 Aug 2023 10:53:03 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 28855A0068;
        Mon, 28 Aug 2023 10:53:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=PZDxYiVC;
        dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A665A40358;
        Mon, 28 Aug 2023 10:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLtqD7VIhclokGWsoEfC19L308xAleICl5dRBypbni+fhLFPbVfRpzDQJHQIydXFlC8sAXVUAsly3Tp9vVY+9Dg4S21itk4iYldRe32rnFN4TUfCrQGeUR0yJclmHHTDltFew5m+AtWJFhCyNW/zFjYfBY4nIbdIEaFyGPrUOwsjticeylvAqfYMUuYNCKB+nZLBZav6eLAdQhZqP1xT0tGEKnBY+gxP8oYvRhv2nampGWpcvOUknxNaA9Kz3+QOybEpITyuGH1kultOfa0qQgUxaMsUZLwpGoU96YJIfWzrGMyacR63ouBnRhi1tWbQaFCHSh7yckeYmiOY1qXI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euW5yjngeNDOXx5QiqQeSZNntwmsxq3VZIcYdPF9VcM=;
 b=IFK3dmEsouUWQjsfozY7WAA5pTpzGPqJ7GiNsujiFCrII+fWj5DKe0e9hji9zny9HLjuYgul7Zb9rxK4uA6akmgxJTchVU4Mp4qQlTiJRFs9e5ChS2BeYX7bN8BgM/4i071ek8pJahaxltwsIAquaoun+iOPfvAumRGbtPnZAeL4HJtKgOjpYFLu8JXIeS2YsfAMUpN/ErwKmoLunDzv/3bHmFFoQKmICc72KFL4/T5Du7D5LHUFSZWXjXhJgl7RfV6V32+wPFRHgWdYfqI/sxDmJ7y5mU6yvlrxj96I5up0rMt5RASr4ak3Uqv90sao2G9ByapV+bSvhh+oEGs/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euW5yjngeNDOXx5QiqQeSZNntwmsxq3VZIcYdPF9VcM=;
 b=PZDxYiVCQPpzsl24GfdAoYD2IxKLnSbkkVwWaUZ05hK77HYhRdbWG4aHWq91FKr7qenCF7nTlweaA4Ojg/8J+8OqJGh5u1Qn06Q3vjKeukI2c0O43Y08lXEeojCHNAYTj6Rxlw96jjbyMWyjiHzh+37iVYLcws8eGE7kYYIQUOk=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by CH2PR12MB4054.namprd12.prod.outlook.com (2603:10b6:610:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 10:52:58 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::1375:cc5f:7170:285]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::1375:cc5f:7170:285%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 10:52:57 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: dwc2: hande irq on dead controller correctly
Thread-Topic: [PATCH] USB: dwc2: hande irq on dead controller correctly
Thread-Index: AQHZ1OtNlV6vw+UEqUu1MmRYatRZ3q//kcMA
Date:   Mon, 28 Aug 2023 10:52:57 +0000
Message-ID: <af261002-dcec-cd80-ef5f-4acf8b87f565@synopsys.com>
References: <20230822112455.18957-1-oneukum@suse.com>
In-Reply-To: <20230822112455.18957-1-oneukum@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|CH2PR12MB4054:EE_
x-ms-office365-filtering-correlation-id: 962e6346-4a9a-4e70-56f8-08dba7b4f0a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BqW4fe6ut4JugHHGE4BatWYwAjFP23hR0UIYRHXfrrOsn0CyeDX2eCSWGrgTeAblTxaD3+7Z4RvDnBjeOTGrjD4KDNstrgqWZ4wQbC5rikIUt4b55YfOJ8/m1Vt1RfHnxW6DPP+9Bzd2Shqn3Vu7FOug2UsdQC2w9xRcUcIC2gp+tD3o29Q4nQHjSKs0pj9QkKKQgS16vVezsAKgOZgphjvPbRuVhE3fNMfmXtplejyAyLzL/mTJd60qd/R267OUJX7s9nJtYgcwMsxFc6CvWeTxUdr8Pd9hO6+HFp6tU+JoysoxSm/NRAotSohTJ5Z3Jtx+kAZ8IfWF7cQqROkaLO6JP2g4BN4B8FVpYBLsUOGERjaiWW9zjScs76WCJeESO1OqT/WxVF8gDK1LcijaEnIBafiOe02rOdKAGdPCYyWJVOOhRgbvknMoVIAZmDeHf9SwFK+7/BRR8eZoz0O2zv0CL3XetVvsZ4RooXWd6qHN7pqID7EduxcYQ3iMygIQv9TazAMuWW7lo3Q65w+6dbXn2MclVBaIa1rV/z1/Ag3mBFN+tUGqMVdCBp6WT72TluKAd8ouNcqM8S9u8jxBslMVVVraBFiEqdI/yMBitk34LAlC2jumYNxmPI+wjwJjIBKBdAf2TAuFDoRGOXAVqNoyAd+BxN8mZocpniehtJc2sZqP8QMeL01JAW6HjOYO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39850400004)(186009)(1800799009)(451199024)(41300700001)(122000001)(38100700002)(86362001)(31696002)(83380400001)(478600001)(38070700005)(71200400001)(2616005)(26005)(6512007)(53546011)(6486002)(6506007)(76116006)(66946007)(36756003)(66476007)(110136005)(91956017)(2906002)(64756008)(66446008)(66556008)(316002)(5660300002)(8676002)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0JRajlqOHhPbnNZV0V1Z1pZYllPb0RncjYwaktOejJvUWJOUndlME1kL1F4?=
 =?utf-8?B?UW83ckJEMk4rRVRsUDIrOXBkeE5KMVVVbTlhQXYvM1BJZUpteE1Yd1d1OHNH?=
 =?utf-8?B?d3djOEhIOTZmRXlEbXE1V25zSk1rejdRWFh4SVNRdnpveVdPcUhweFlxNUFO?=
 =?utf-8?B?UVdaQ3pRc21hV2FoM1krcDFGejF4THZwcUd5b1AyTnUxbFg2ZUkzYlIvYzAy?=
 =?utf-8?B?d3NWK2lvcmtBNmh6VkFwOVZEZ2NBYm5ZaE9tbE1SMllqalpRaEs5S1N3NW13?=
 =?utf-8?B?a0RwTHFNcHBGZlhERkQwZlJPWERHWXd4VmppUWtnRjlDcVdWdkVXMFdKZm9U?=
 =?utf-8?B?SWRNWWxpSGpnMXJGcXVPV012c1VSbmlBQzRGT1p5bDF3aVBqVEVycmVod2cw?=
 =?utf-8?B?d29PWjJXekJGcE9aaDFrcDFxenR6NGx1VkVhcHBybFZZVmp1VFpKb1g5NldV?=
 =?utf-8?B?d0Y2eUNCT0wzajh2Zm9UUEx2b3dLcUM0V0JuL1B6VmVDTjJSdGE2S0EvNnAx?=
 =?utf-8?B?aEEzZFpYTVVaVUlEYVdBeVF6REtFR2ZZWHBYVzdvTEF4dDFTcEhFRHM0a2w1?=
 =?utf-8?B?MjFmNmNKZlUzWnp4NHYrVWpiZVc5N2x4SGFvRkJPVU5uckh0K1pSdGVHWDdn?=
 =?utf-8?B?cnhvcm5oYnJmaC9EYVBEUXp2WWp5b1hiTHI3N3pRbGpoZFRuR09DbTM0Y3hD?=
 =?utf-8?B?ak5ybGQ3K1ZVeGZLbnNGNUYwM2pRdXlneHR3MVdycjU5cnhadXBNc2xLLzlP?=
 =?utf-8?B?NTUvbmdIanpPYzhvbXkzV0RWazJ1Mm5tMExLckdvNjdZZXh1NWlXOE1JYSs2?=
 =?utf-8?B?SnhXL2U3MThxbHVWQ0lUeHAwRXpRS0wwU2dZanB5Y1JBTmpiamJQbUZrZmNE?=
 =?utf-8?B?a3RVcDBjN0tyd0xyZXQ0bFZYazlYRGUvV2ZsL1I5RjhHd1NWVzR4SlJldjFN?=
 =?utf-8?B?RHEydlY2UndqWjVUV1dmMklHSjlXQitYVEl1a3habHFweUp3Q1FYd01wRFVK?=
 =?utf-8?B?TmFPL3NzSlpoTTBWQ1FjaE50ZG0ybTh2R3ZudEVnTWpHTWpuNSsyei9KSEQ5?=
 =?utf-8?B?SnlveVBDOVlGOU1KS3hVN0RvZW5wbkJFSzBHTzFjUXNOL2d5QmZhMjQrbGd0?=
 =?utf-8?B?NCt2Tjl4UWVJdVFzOUQ2YWdRd3o1MXEvbWNZT2JydDhWWW5EVllkTFUzeVND?=
 =?utf-8?B?L0RXbUJYdzd1bjIrbkhINUlQVmlGbytzWWE2RlBGNUhoYitUNU5Vcm5obGpr?=
 =?utf-8?B?NDlNaW1ZVUdzN2J0SmRoQTJDTnJGRS9SUkN2UlU2a3pZVzBWNWJNU2ltMzNJ?=
 =?utf-8?B?RStQeVlJT1YwWUlkdWRMNWpBN1NUWnFGYi9KTTJLNG42RUNtNE9NbVZsYThL?=
 =?utf-8?B?dVpkeVFReFFQbXA3NEdCTUM5elFEVEtmUWcvWkdKTWc2b3hKazVSL1dja0Jx?=
 =?utf-8?B?WVl0YVloNGpYQUM4UjhlTjlxZE53NkVWa1IzOWNyR0V2WHpyUExUK0FxSmtY?=
 =?utf-8?B?UXFoZXFIZURxNzRxRE8rUG9Ua0FOUnpKN0czKzhxZHF5Mjg1a0JYUnY2VXNw?=
 =?utf-8?B?Yzl6S05iUytab0h4SHhheGI2clFKVnQwMVhNemZCUkdSV3hhZE1zVTJyNXNx?=
 =?utf-8?B?ZmVPTWFVWFppUkZ4MHVCTTdueWpURTJuOS9PMjdEb2lEQkpFbkw4WWN4a29q?=
 =?utf-8?B?OFFLTU80M2R0eS8zVndsMDBSNU8xbTYwSkRCUXJab0ZwbHd1dHhYYTBKMzJM?=
 =?utf-8?B?OE50ME12OURhdklrT1ZIQkloZzM1QTV2aEdNcHRVVStQVlc4Wmw5NXdKeDkx?=
 =?utf-8?B?ZnhFTVExaWZDU0pPZ3ZLMXlDdlBvYUFJS0hvNUI0OC9BUk5NTkpzTkZuOVY0?=
 =?utf-8?B?dmNVWktvTjNxaEdiWEJBemIwRjlMdm5lbC9JbUZjdGVwZGVwV0FlNzNmbmxa?=
 =?utf-8?B?RjY2cndvNkhLOUdYWjVBa3BDU1NCNUMvMGdvYTJYSlIwMVcrQ0tneHZjY0R0?=
 =?utf-8?B?K0JWVXpVdmtqcEp2ZWw0QU1jdWlmK0dZem5qdkJaTVpmSk5sT1pnNVZkLzdp?=
 =?utf-8?B?em8wR09TSVJ6NitsdkszVnBnaXFDUDNLSVZWWU15WUs3R2hoT1lZVUxXVVY5?=
 =?utf-8?Q?omYhPRIwz1sExg37WrSL95uHP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D6AF5589175EA4AB7C1DCD3550CB0AC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kPLqSJ6NueuUO2jeZPJ4+hda72d7FIE3vT3gFJtLY8+PwZX+/0ue1iL+MIG9DVqufUbOCVYlePnoEagBbhGv9XBWircFvRP/hSJ7TpZgHQfKWwOJNysK3J1o0HibzS9rz5PEYU3RFv92AGFYCHL1Ucrh1Op1DFAHMDXEW7bzng99dcrTyPh7ajZOGYCMKxU2UyO2s57EWFoEVWRpMxdA26sOqPAdppJhaLApWWskLN3MLgt3NL2hTvtRRRbYwfw0w8McQEoBCFCdhJ0rME7Vs7gH4Im13fbEDe5mk/ZTKELxs7AtfzFdp9gyW/TWUbbxBgmqod8UFTThclLPYI4j5NmUOHRWHhBm8hp87gk4Cq2ez9Nj9jCaEgKFdRAK4dQE84a8ExWD7TZS18Vcdl0DMkMujWXKZXRREfZBoE4iYSVyDBI5gOEScvudQUm6po4IFCQVXIblq/l8d/omXDpPNbISsUo3VqyL5VP66f2c3zn88rxuIZKbD4xZXisnbm0n4/I3uO+XcBAOrfMU5PgwcNpd+uvIG+WVw998V4X1vu0jQ3DIDXLa8N4KDx50aeWOFUfPcG9PDkohEY4byACfyqmttNxxBTbWy1Q7gwaHh4ktVyPkB7Lu2+qbox1ll3ZrVcM6/jtr+D8e8BboGZVJ3gI6ibh4J9WXPBiIUmlj8BvgpS7G9zbtjKHtuj/zN8WOdlaAyD1ycj1v+/4McUK2glj3vrX97Pk27wPnVLcr0dgxtmiDJfqmaYVZ5zF1U8hG6h8hQu8DtZ2NOyamPxvFi+O+uEmyXOljpcpByvi768L0fgNnjRVMyQIJg3UzyviZIIWD9xsGgqquPyPOsUMyMmNBwOoVSx3QWsQiM/+z6Qctn8JRDdTFI9+/tMWmea7O
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962e6346-4a9a-4e70-56f8-08dba7b4f0a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 10:52:57.6562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dGLijL1TlitCv7R+eL1AAkSU5r2/bDFTSoraFEY3+nx6wE6aMGNCvdiwB6pOoEo2vHp44HM/DaGRySsSvO5RRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4054
X-Proofpoint-ORIG-GUID: plYloI_vq6FPan8N-d-fWRWF-9ztt1Xp
X-Proofpoint-GUID: plYloI_vq6FPan8N-d-fWRWF-9ztt1Xp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_08,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 mlxlogscore=714 suspectscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308280098
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT2xpdmVyLA0KDQpPbiA4LzIyLzIzIDE1OjI0LCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0KPiBJ
ZiB0aGUgY29udHJvbGxlciBpcyBkZWFkLCB0aGUgaG9uZXN0IGFuc3dlciB0byB0aGUNCj4gcXVl
c3Rpb24gd2hldGhlciBpdCBoYXMgY2F1c2VkIGFuIGlycSBpczogdW5rbm93bg0KPiBBcyB0aGUg
cHVycG9zZSBvZiB0aGUgaXJxIHJldHVybiBpcyB0byB0cmlnZ2VyIHN3aXRjaGluZw0KPiBvZmYg
YW4gSVJRLCB0aGUgY29ycmVjdCByZXNwb25zZSBpZiB5b3UgY2Fubm90DQo+IGRldGVybWluZSBp
ZiB5b3VyIGRldmljZSBoYXMgY2F1c2VkIHRoZSBpbnRlcnJ1cHQgaXMNCj4gSVJRX0hBTkRMRUQN
Cj4gDQoNCklmIGNvcmUgaXMgZGVhZCB0aGVuIGl0IGNhbiBub3QgYXNzZXJ0IGludGVycnVwdCwg
aXQncyBtb3JlIHBvc3NpYmxlIA0KdGhhdCBpdCdzIHNwdXJpb3VzIGludGVycnVwdCBvciBpbnRl
cnJ1cHQgZnJvbSBvdGhlciBkZXZpY2UgKElSUSBpcyANCnNoYXJlZCkgYW5kIG5vdGhpbmcgc2hv
dWxkIGJlIGhhbmRsZWQuIEluIHRoaXMgY2FzZSByZXBseSBieSBJUlFfSEFORExFRCANCmlzIGlu
Y29ycmVjdCBiZWNhdXNlIG5vdGhpbmcgaXMgaGFuZGxlZC4NCg0KVGhhbmtzLA0KTWluYXMNCg0K
PiBTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPg0KPiAtLS0N
Cj4gICBkcml2ZXJzL3VzYi9kd2MyL2hjZF9pbnRyLmMgfCA0ICsrKy0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5jIGIvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5j
DQo+IGluZGV4IGM5NzQwY2FhNTk3NC4uMDE0NGNhODM1MGMzIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MyL2hjZF9pbnRyLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50
ci5jDQo+IEBAIC0yMjAzLDExICsyMjAzLDEzIEBAIHN0YXRpYyB2b2lkIGR3YzJfaGNfaW50cihz
dHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQo+ICAgaXJxcmV0dXJuX3QgZHdjMl9oYW5kbGVfaGNk
X2ludHIoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0KPiAgIHsNCj4gICAJdTMyIGdpbnRzdHMs
IGRiZ19naW50c3RzOw0KPiAtCWlycXJldHVybl90IHJldHZhbCA9IElSUV9OT05FOw0KPiArCWly
cXJldHVybl90IHJldHZhbCA9IElSUV9IQU5ETEVEOw0KPiAgIA0KPiAgIAlpZiAoIWR3YzJfaXNf
Y29udHJvbGxlcl9hbGl2ZShoc290ZykpIHsNCj4gICAJCWRldl93YXJuKGhzb3RnLT5kZXYsICJD
b250cm9sbGVyIGlzIGRlYWRcbiIpOw0KPiAgIAkJcmV0dXJuIHJldHZhbDsNCj4gKwl9IGVsc2Ug
ew0KPiArCQlyZXR2YWwgPSBJUlFfTk9ORTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlzcGluX2xvY2so
Jmhzb3RnLT5sb2NrKTs=
