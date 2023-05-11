Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93DB66FE9A7
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 03:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjEKBuS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 21:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjEKBuP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 21:50:15 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741207DB9
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 18:50:04 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34ANxdW0015427;
        Wed, 10 May 2023 18:50:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=kPTfAAUD68j8u34CMsO0rvsknqpbNHs42wiX8R9pJcI=;
 b=jBEKkWYamHTO3/oNZ0cImBP6AkbvxHYcoGRhHcpaf6YElD9C/4PH323PXn1MD0FObY5N
 hV1eXxB1gX4yfWtf9J+7U9+kYBrPFc7urasddLkaKtpgBOvI7d5tLLcPLOhkSrPZRuvv
 NryYNc3iUlZ16nx8pw7EYVSaXGgm4esY22tSfrTJ/st/DFzc+HvQDFqEH1O7Q1wGmI2P
 J+4O8s4to7vqhLz6LAxam8Mf4vtMvY392dDmqOSfLQuRzibsMQIiRlAQyg/T5eKU/j8k
 VnS1eE/9fdCIB2Op11Uvcy6WqkuPC9AsKzd6cv/bZnFWZ5kfQCjjatWDQ5P0aG5q1iDn xw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf770ce8m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 18:50:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683769801; bh=kPTfAAUD68j8u34CMsO0rvsknqpbNHs42wiX8R9pJcI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=B0SgFUbFicdhozUQ4Za3wTajNW+tw0goEc/Zc2hrK61IzwlWbG/rmNtdRADNFuGQr
         IqJb2Odee1Ihmbigv5i7/UmIFX4TJHT76NQwB4MXBQBd15yxV7IvC46XfvTbqjNovB
         rhh/trqltRefxta1V8Ad1SuYh/KmXzSW3be2R8jvtQ+HI0f7AOpSkQHNablWAgllHu
         t9LEFrd4xQOT3I8KdRHbJxe3uvWIk7VQ1N67RAc4BEkomEUCulEnZd5fjNFpvvvSzm
         ZaEDQAPVBOdL449ajPw3VeezJmdtlWu3HojyZAf/bH0CojidLGPk1DULIPid8mXaU5
         IUJzdzv/QeZqg==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E29040524;
        Thu, 11 May 2023 01:50:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D3775A008C;
        Thu, 11 May 2023 01:50:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TUf3dq2s;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 57A8440703;
        Thu, 11 May 2023 01:50:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mny8RD7l0fh90JDmt5trJW8XyDPHO9TVeAjLqPWH1k6fQlrjGocIdkQTz9guRpM5jfQFjFBbfAPsWLHvCxCnMi8tfTDDoC0Jtbl9B9z6SJtCaEMQC9M9szJbmce6QuvvzH21iJDarUOJj+LgKV2gtkOufWBDllFjH7+nQpTb5bI0fC610IJugPpf8MZS4uMVlhtOEZtm5ixpXFbGRl1iNaOf08frwSNNm/7sIp6Omil4vdfW5LZS89glIQ5kyhlqBv3gCpqGR7Hlz+xxnNMckm/0r+jdK6gjfwQvtqf79qQ6UVHyur05WRQ36pR+H8E/RL6ZH4z7QVEiL+TaEnE8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPTfAAUD68j8u34CMsO0rvsknqpbNHs42wiX8R9pJcI=;
 b=nzqjy/mp/ozkgg4yI20EWoJrf5a1IgnlXULRtA+ixdMM5LAxOmIrR1hQ+KP2C4rwarXk58X0BUVysDQP/flns7vUqBw0dO9lZnPJd2ko+J33T01ObD5A0bfqGYW15bvei+2Slr1HIbd4es1pGdfUba2d68Ymfv804re/Uog7RhAmywns/eqsY+BIXrYOQkeKiKKm1J01ZPeTOgBZlxSOO90FidEdDVB888iM9deic+OmvzDAkqsaAw2SOqvrA0qcmRDsuPkj04+RCzq9v2/H+LanEnZRZMgSfgP+Vjto6SlB5NIBzEjXhjV5nnL4yEHODmKpBOheQ7K/j9pu2oEn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPTfAAUD68j8u34CMsO0rvsknqpbNHs42wiX8R9pJcI=;
 b=TUf3dq2sJj6AC/h6v8yD33aTrTrSKGfmlqlb/gEcT8kfGRU+j8TDpdOtW1hEx47jcO2WjPfEqr6tbtAv9MZ6sK4y3wNaWVeqWBv/AaV2iYDHv9A7DY1nx0Lb4kJdtStcyvj6+k08xi8MGu1nCl82S0FICfYOXvfJs2ni+JVXwJU=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by BN9PR12MB5305.namprd12.prod.outlook.com (2603:10b6:408:102::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 01:49:58 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 01:49:58 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Setting LLUCTL force gen1 bit if max speed is SS for Gen2
 controller
Thread-Topic: Setting LLUCTL force gen1 bit if max speed is SS for Gen2
 controller
Thread-Index: AQHZg2pub4txYYMDE02M/COcGpMSMq9UBfeAgABDIACAAAWigA==
Date:   Thu, 11 May 2023 01:49:57 +0000
Message-ID: <20230511014909.s6hdfidc5vdalhga@synopsys.com>
References: <e465c69c-3a9d-cbdb-d44e-96b99cfa1a92@quicinc.com>
 <20230510212845.ymxudl4r3f54erkq@synopsys.com>
 <55aeb1ac-a90a-8b2e-7de2-114bfcf7dcb9@quicinc.com>
In-Reply-To: <55aeb1ac-a90a-8b2e-7de2-114bfcf7dcb9@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|BN9PR12MB5305:EE_
x-ms-office365-filtering-correlation-id: 808034b4-5812-47f0-c978-08db51c2063c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2VETm0VKOuPeNhQu2T3avIF2FpWaG07uyAMBMpxNZVisDqnUTko7FYb8j2n4mRhONz+vc9zcY1IOtnJUkle7pnpR+qB6TokiOfDknydDQ9gq+qdkNmzlihhA89eXvVobxrk+tTXK3+Erkq10p7WJkzN8Bh9IizSJbgmOHbocmAM0/08s6iTysUkRhZyi5TMzOpvKU9dUIqdm9jz3vedWDwBTyc4ZQCTn5DDcERkrLc8szqH28Kxeef+ZEAvUQsLuh8dTaP5VtZdMoNfmhLtR52W52KpU+FK/2vrxfsXH86fbcSpp0q/IU2NmS6C79zVzq7yyTtL3o1NfxmwZEVWIPvo6d9ujv3f5CjGgiXlgOVHfOoRvzqjWzJbdSAdU7FvGhtSs573e7sF489Lf6adlRUHVncosqMlNS99LTBECuFiDD1kQ3fY4TD12K6Q1ifRecm9MJwCGryY72lNg2jyqKJrTppYHXc+eSr/YSv5ve0HEDaJcxfvD36bAQzCdjpbwBcaEBxcLFP2h7UwQXDRNTG4y7PNdRpM833hbYzq9YFPsWPWgCe/knXQ+cqIFF8pzQgSl7kwhqcvYhr4xSaY3LgHKYFEdZwkLYmqeUb2nnZ2FlKu1mT+EkhG2FSwy0MKr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(366004)(39860400002)(136003)(376002)(451199021)(83380400001)(54906003)(8676002)(8936002)(316002)(2616005)(53546011)(38070700005)(2906002)(66446008)(6486002)(64756008)(6916009)(5660300002)(71200400001)(66556008)(66476007)(478600001)(86362001)(66946007)(4326008)(76116006)(122000001)(6506007)(6512007)(38100700002)(26005)(41300700001)(36756003)(1076003)(91956017)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ly9IUWRNM055M04xeHowQjZMeGFidyt4cElEa0R1dGVUcGkramF1ZVNuWHNT?=
 =?utf-8?B?ZFZ2a2ZuV2tWQ3Z1ODQ4eG0rcHNPSXR6N1gySGlwV25LbXRIZGpTbjdzTGJp?=
 =?utf-8?B?MDA2alg1NjBDRXgrcUluS0ozTXFiVWF0a2ptVldUQkIyemVQKzVQYkxwV2dn?=
 =?utf-8?B?NkpRWkVWNmRzTEdoRktudHVERjZyanloYlF6SlIvTklOd1VkNnNDVUhib09F?=
 =?utf-8?B?Rk1UZG9BK3plTlM2clFEVWNIMzdLT2E1VExLY08wenB1a0RsOEIxNGJiQlda?=
 =?utf-8?B?UHZnOUttNDc5dVVrWmZreml1WmRFMmZ6bXRaa29DMk1STVkrQ3hEMmMxOTUv?=
 =?utf-8?B?YW9ieUs1bURncTMvSFk0Q014WU4zM0IvV05zNWw3T25qWms2bjZ6aW8yVGJz?=
 =?utf-8?B?RkU3TWlHU3l0SzhTRnRTclVuRVZWR3FNeG95WHU3aFhYb0FTb2c1WWlHeXJ4?=
 =?utf-8?B?eXNYS2JMeHNqZXRSclgrQU5LckpSMUpINHBPTm5lVWd6REhsUmgyUnZlZFJQ?=
 =?utf-8?B?c0VhNXY5b014cnRweldMdmVNY1ZsaWZjV0U2WjJBRUFpMXVhM0NxZHlpYlNV?=
 =?utf-8?B?WnFCaDBkWWhldEU1SXBOTG1WTWVEQklwM21iQUcvc2VRWVV6OUtyYXRSNGUw?=
 =?utf-8?B?T3JZZHFkQzhxMGE5WW5WeUI4bDY3bnd3anYxQ3lGaXl3RFVzSzJjcG5TN3dU?=
 =?utf-8?B?eGo2NnU0OTdXWjJUY00vUW8wYmo0cDRJbmQ3bWl2eWRLTldac0VhRHc1eUxv?=
 =?utf-8?B?OUJ4L3JwYW1wZThXMlFHL1VnK056MXd5QUo2T2VlMm5NWW1wOTZ3ZzdFTGwv?=
 =?utf-8?B?YTlSOHdCdnp6ei9vRmdNK2F6aGRldHlJSThiamRaNWdDcVZpVmI4M3B2L3dN?=
 =?utf-8?B?VmlSb3NVSEl2K2l4djdUYkREcWlzKzJ5YkQ4ZStmVUVqTU4vYUtnSEpVbjg2?=
 =?utf-8?B?enZsK1oxYnVNUWlndWRKZVpXdVROMlZxbEJza2tsRjRSb0NabWJuQW5QOEJl?=
 =?utf-8?B?UUl5ekYzT0dMc3hGSkllMUVoSitqdlR3ODhocHZTMndtZmdYOFp2VzNvd3Vy?=
 =?utf-8?B?eDhxdi92OGFFY2JPNmdveE1HVmtKV3RCNnhROHl3bzZuOTVoNGk2engzUjB5?=
 =?utf-8?B?dWNUY211Q2JaSldYNHQrNUtaNTBLUEN5R1BRS0RFRFVleC9jWEZaa2tEZUUy?=
 =?utf-8?B?QkE1RXRMWERPS1grcm9UdFVBRXJ5ZTRkVFZOd1hicDBOU280Q0VnRG5BbGJX?=
 =?utf-8?B?ckhMMVU0amRSZ1B1OHZ2YTZhVzV5RGt6cklySHNxdnNVZ3pqejZmT0pQeEZN?=
 =?utf-8?B?WWhTNzFVWkFZYlFqVSsvbW1Ja2FyRXBmZlVMckI0YnVZMXVhd0pwK21ERStW?=
 =?utf-8?B?Y2pUSHNUdFI4SFpuYWxCYzduUGlacCtaMHFYbSttU1RRRndaRUdaTExFL1VQ?=
 =?utf-8?B?aG1IWVZaMnl1cTVqOWZFbSs3SjlKSG5tQ0xySFcycU1wUGo1TzkwMSt5SXNo?=
 =?utf-8?B?S3ZOWG5GSzdLSStYT25XL0s1OXlxbEZSZlZUQ3l4Ny9ReHVBRmVBS0c5cE9x?=
 =?utf-8?B?c1RTS0tlUXQycEdXQ2szQzAwRXYwRVpUUzhkZ0Z5ME5DTXMxY2thQSs1V3dr?=
 =?utf-8?B?bXVUdWtUbmJhMjYrM1pma2d0MGRpaVRRZEpxQjNENzVEM21NcWdvWEdZR3k3?=
 =?utf-8?B?RVFmOENyc1BsWFF6QzBORFdDYk90LzdGMXdEUzhTSE9uOGdFNDFEU1NGR2RP?=
 =?utf-8?B?SDR0ZEZaelgwZTc3V0JYRGMraFViWXlmdXFCY0J1MTVCWVF5VnZGQ1RkOWJO?=
 =?utf-8?B?dE1wZzhsc2tGM3FDY1Z1dk5kdmhGUmRiSDlLTTllbXB5a2l4d2pBMmM3eWI2?=
 =?utf-8?B?OUN6Z0lCTWxqT2l6TnIzTGRneTI2cVN1REdvNENCbHMySS92UGN1emZ5a200?=
 =?utf-8?B?KzVsMVgyR3ZpeTJ3bHpWZHRabmp0YlM2V1VXemRIQmRMc3duTDNCd0RJdURx?=
 =?utf-8?B?MW45bzBoMXltaVA4bUFRSGhXNnpuU05jNFh6TkRtakgrTjkzZzI3aUlLUUtq?=
 =?utf-8?B?ZU9Id2FXSlBRNkdqU1M4TmNzdXBEc1BZMDJiUkdwNjE0aXEzQ1NNZGFjNjJa?=
 =?utf-8?Q?aa/bItw1SO3ZMoguEFTeb8B32?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E9736FC5B5A184297B0A83D3A341C38@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: us5P0xMFjq/wvZlt/HmCOakNaqciBhXaWT4eAggJaOgzKhdpLo2TiyDsi4KYEgIlAgNabJwGMIgrbncu3lr6ocu9HCd1ABKhp6g9dQTCohVZTn/gMJpFKp6fMNXp1AaCOTmdE5DX1LjC4oM2zr4ZSypGz5XdohYHPRfGq7NtW16igB3qOHkb2HzyN19OXFgK2gDmr5BPxqu3hdtgAj86RsYqHV+dgcz9H+/RSziQYguwC/r7ckjfoSReZPefqaSn/+GExywwY66TlYLZ8aq0+2A7BZzGG8Kmmfx3j1SHUhhF1ksmqnRquBO52kBupMbbL2Gq07YLe8K+hCepzSYZj3TRg9ToFAbu5IJhE3MrxyRrexDTxug4jEaQhC0e3cDZTnZ272RPAass1puu99eElZ+lO+ohw15pU0lk2BPBBEogLwG30NN1Do7kl84Rx6rW+CNzwQIeJ5Oi16mKyXnDVS6QnmNNTKSLe9Er7dUK4nUJIYlIZ2upkjRflIxoSK+dY98O9nWO6cp7xgBWNXuiQLnw6MSu5Z//pjEJ0pJBN9LEMiqiIRl1qkgW40luH0m3v9nxx9sz1w9DxIQAUvQM4apqEDWZ5X/53UPCRZSBVKhomdsBqpjXGzJACQHmNqABRogLuqDIARl+IpryUItUrtB+lOmNbM13d1zO0qnAP/BWwzbx3/c29d4IuVXEtYkWXRsYmzHsLG6iqB3nN+taTKMR2Hj9uzdg4fTJS1CxaiTS71xjBpkmq35F64JA8cibKowMAvoIUITU9vyzNsVl+7QTllba0/V6V5YmF/HG2rTx1k6hNgwqWrfO0LdxOoM/F53JDeLeBOXKxFovyN1qQ/qv+cqImD+NiYCVXeN0PgERJPOuxUTzbLPRAxQ6AsYKrJPvcjB7JDwEjEg4Tq1KtQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808034b4-5812-47f0-c978-08db51c2063c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 01:49:57.2930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poCUPbO/15Mpij8wTW9XZ0igk1EIxgT1apnnVH2f5dr0/+He2cMC/aT5bt/K4Euu6xzUUJKj/Bi5RRkXZrlwcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5305
X-Proofpoint-GUID: bybe0Jw0o0nZKVOBNyFCxSFzdhEsp8p5
X-Proofpoint-ORIG-GUID: bybe0Jw0o0nZKVOBNyFCxSFzdhEsp8p5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110015
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXkgMTEsIDIwMjMsIEtyaXNobmEgS3VyYXBhdGkgUFNTTlYgd3JvdGU6DQo+IA0K
PiANCj4gT24gNS8xMS8yMDIzIDI6NTkgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBIaSwN
Cj4gPiANCj4gPiBPbiBXZWQsIE1heSAxMCwgMjAyMywgS3Jpc2huYSBLdXJhcGF0aSBQU1NOViB3
cm90ZToNCj4gPiA+IEhpIFRlYW0sDQo+ID4gPiANCj4gPiA+ICAgSWYgd2Ugc2V0IG1heGltdW0g
c3BlZWQgdG8gInN1cGVyLXNwZWVkIiBmb3IgYSBTU1AgY2FwYWJsZSBjb250cm9sbGVyLCBJDQo+
ID4gPiBzZWUgZGV2aWNlIG1vZGUgd29ya2luZyBpbiBTUyBidXQgaG9zdCBtb2RlIHN0aWxsIHdv
cmtzIGluIFNTUC4gRnJvbSB0aGUNCj4gPiA+IHlhbWwgZG9jdW1lbnRhdGlvbiBvZiBtYXgtc3Bl
ZWQsIEkgc2VlIHRoZSBmb2xsb3dpbmc6DQo+ID4gPiANCj4gPiA+ICDCoG1heGltdW0tc3BlZWQ6
DQo+ID4gPiAgwqAgwqBkZXNjcmlwdGlvbjoNCj4gPiA+ICDCoCDCoCDCoFRlbGxzIFVTQiBjb250
cm9sbGVycyB3ZSB3YW50IHRvIHdvcmsgdXAgdG8gYSBjZXJ0YWluIHNwZWVkLiBJbmNhc2UNCj4g
PiA+IHRoaXMgaXNuJ3QgcGFzc2VkIHZpYSBEVCwgVVNCIGNvbnRyb2xsZXJzIHNob3VsZCBkZWZh
dWx0IHRvIHRoZWlyIG1heGltdW0gSFcNCj4gPiA+IGNhcGFiaWxpdHkuDQo+ID4gPiANCj4gPiA+
IFNob3VsZG4ndCB0aGlzIG1heGltdW0gc3BlZWQgZ2V0IGxpbWl0ZWQgdG8gZ2VuMSBldmVuIGZv
ciBob3N0IG1vZGUgPw0KPiA+IA0KPiA+IFRoZSBkZXNjcmlwdGlvbiBpcyBhbWJpZ3VvdXMgaGVy
ZS4gSG93ZXZlciwgd2Ugb25seSBldmVyIHVzZSB0aGlzDQo+ID4gcHJvcGVydHkgdG8gbGltaXQg
dGhlIHNwZWVkIGZvciBkZXZpY2UgbW9kZSAoZnJvbSB3aGF0IEkgc2VlIGluIHRoZQ0KPiA+IG90
aGVyIGRyaXZlcnMgb2YgdGhlIGtlcm5lbCkuIFNob3VsZCB3ZSBldmVyIG5lZWQgdG8gbGltaXQg
dGhpcyBmb3IgaG9zdA0KPiA+IG1vZGUsIElNSE8sIHdlIHNob3VsZCBpbnRyb2R1Y2UgYSBuZXcg
cHJvcGVydHkgZm9yIHRoYXQgYW5kIGNsYXJpZnkgdGhpcw0KPiA+IHByb3BlcnR5Lg0KPiA+IA0K
PiBIaSBUaGluaCwNCj4gDQo+ICAgU29ycnkgZm9yIG5vdCBiZWluZyBjbGVhci4gVGhlIGZvbGxv
d2luZyBpcyB0aGUgdmVyc2lvbiBhbmQgSUQgb2YgU004NTUwDQo+IGNvbnRyb2xsZXI6ICh1c2Iz
MSBjb250cm9sbGVyKQ0KPiANCj4gVkVSX05VTTogMHgzMTM5MzAyQQ0KPiBWRVJfVFlQRTogMHg2
NzYxMkEyQQ0KPiBVU0IzX1BSSV9VU0IzMV9JUF9OQU1FICgweEE2MEMxMjApID0gMHgzMzMxMzEz
MA0KPiANCj4gV2UgbmVlZCB0byBmb3JjZSB0aGlzIHRvIGdlbi0xIHRvIGZhbGxiYWNrIHRvIFNT
IGV2ZW4gZm9yIGhvc3QgbW9kZSB0b28gYXMNCj4gY3VzdG9tZXJzIGFyZSBmYWNpbmcgY29tcGxp
YW5jZSBpc3N1ZXMgb24gU1NQLg0KPiANCg0KSSBtZWFudCB0aGUgZG9jdW1lbnRhdGlvbiBmb3Ig
bWF4aW11bS1zcGVlZCBwcm9wZXJ0eSBpc24ndCBjbGVhciBmb3INCmNhc2VzIHN1Y2ggYXMgRFJE
IHVzYiBjb250cm9sbGVyIHdoZXJlIHRoZSBjb250cm9sbGVyIGNhbiBvcGVyYXRlIGluDQpkaWZm
ZXJlbnQgbW9kZXMuIFlvdXIgZGVzY3JpcHRpb24gaXMgcHJldHR5IGNsZWFyLg0KDQo+ID4gPiAN
Cj4gPiA+IElmIHNvLCBjYW4gd2Ugc2V0IExMVUNUTCBGb3JjZV9HZW4xIGJpdCBpZiAoQ29udHJv
bGxlciBpcyBHZW4yICAmJiBtYXhfc3BlZWQNCj4gPiA+ID0gU3VwZXJTcGVlZCkgc29tZXdoZXJl
IGFmdGVyIEdDVEwgY29yZSBzb2Z0IHJlc2V0IGlzIGRvbmUgaW4gc2V0X21vZGUgPw0KPiA+IA0K
PiA+IEJUVywgdGhhdCdzIGZvciBkd2NfdXNiMzEuIEZvciBkd2NfdXNiMzIsIHdlIHVzZSBhIGRp
ZmZlcmVudCByZWdpc3RlciB0bw0KPiA+IGxpbWl0IGRpZmZlcmVudCBlU1Mgc3BlZWRzIGFuZCBs
YW5lY291bnQuDQo+ID4gDQo+ID4gVG8gbGltaXQgdG8gaGlnaHNwZWVkIGZvciB4aGNpLCB3ZSBj
YW4gZGlzYWJsZSB1c2IzIHBvcnRzIChjbGVhciB0aGUNCj4gPiBQT1JUU0MuUFApLiBJIGRvbid0
IHRoaW5rIHdlIGNhbiBmb3JjZSBsaW1pdCB0byBmdWxsIG9yIGxvdyBzcGVlZCBmb3INCj4gPiBk
d2MzIGhvc3QgbW9kZS4NCj4gPiANCj4gDQo+IEZyb20geW91ciBleHBsYW5hdGlvbiwgY2FuIEkg
c2VuZCBhIHBhdGNoIGZvciB3aXRoIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAxLiBVcGRhdGUgZGVz
Y3JpcHRpb24gZm9yIG1heCBzcGVlZA0KPiAyLiBBZGQgZm9yY2VfZ2VuMSBwcm9wZXJ0eSBhbmQg
aWYgaXQgaXMgc2V0LCBjaGVjayB0aGUgdmVyc2lvbiAodXNiMzEpIGFuZA0KPiBzZXQgTExVQ1RM
LkZvcmNlX0dlbjEgYml0Lg0KPiANCj4gTGF0ZXIgaWYgc29tZW9uZSB3YW50cyB0byBhZGQgY29k
ZSBmb3IgdXNiMzIgYXMgd2VsbCwgdGhleSBjYW4gcmV1c2UgdGhlDQo+IHNhbWUgcHJvcGVydHkg
YW5kIGV4dGVuZCB0aGUgY29kZSBmb3IgdGhlIHNhbWUuDQo+IA0KPiBMZXQgbWUga25vdyBpZiB0
aGlzIHdvdWxkIGJlIGFjY2VwdGFibGUuDQo+IA0KDQpJJ20gdGhpbmtpbmcgdG8gaW50cm9kdWNl
IGEgZ2VuZXJpYyAiaG9zdC1tYXhpbXVtLXNwZWVkIiBwcm9wZXJ0eQ0KaW5zdGVhZCBvZiBhICJm
b3JjZV9nZW4xIiB0aGF0J3Mgc3BlY2lmaWMgdG8gZHdjMyBjb250cm9sbGVyIG9ubHkuDQoNClNv
IHRoYXQgd2UgY2FuIHVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgIm1heGltdW0tc3BlZWQi
IGFzIGZvbGxvdzoNCg0KKiBUaGUgIm1heGltdW0tc3BlZWQiIGFwcGxpZXMgdG8gYm90aCBob3N0
IGFuZCBkZXZpY2UgbW9kZXMuIElmDQogICJob3N0LW1heGltdW0tc3BlZWQiIGlzIHNwZWNpZmll
ZCwgdGhlbiB0aGUgaG9zdCBtYXkgaGF2ZSBhIGRpZmZlcmVudA0KICBjb25zdHJhaW50Lg0KDQpP
cg0KDQoqIFRoZSAibWF4aW11bS1zcGVlZCIgb25seSBhcHBsaWVzIGZvciBkZXZpY2UgbW9kZS4g
VGhlDQogICJob3N0LW1heGltdW0tc3BlZWQiIGlzIGZvciBob3N0IG1vZGUuDQoNClRoYW5rcywN
ClRoaW5o
