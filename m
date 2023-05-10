Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2BA6FE650
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 23:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235757AbjEJV3f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 17:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjEJV3e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 17:29:34 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD45D2722
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 14:29:32 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34AKKO0B016248;
        Wed, 10 May 2023 14:29:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=+RItOUm8QuLuiNhT2tVh923O+kJ1YVOev4seRjNGL7s=;
 b=nCqY+t6HUZ1ugNrP6N6CzN/ogM+XS3uSmHtL7qjE28tmCVCMhWmV/OuqH4J/NaIW5uub
 Qcg/opdqukK51UuA+i6gksCjbWLWzGQjsC6BOgYDIwO1boACSDPNWX9OueVhWfapNwIu
 MsdI0rUCiCU2oXuyYqbz6U2samScDqd9h69COxymb0zpsLCKOUVOaRQDMI9Q0KGiQHHV
 obzlmmo29E8DSWcJCrkzpWtyywvWIgozzCjBZDkuaQgQEfPdV6AegFUu4fGUsMD4PFPo
 yuUMPTPmebFcyl5zQQqxx09FHJlQff0+5CePfUMm4yFMC9J4FcsFGT1MvLPResz/E9EO fQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf772b6tc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 14:29:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683754169; bh=+RItOUm8QuLuiNhT2tVh923O+kJ1YVOev4seRjNGL7s=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bAITzW3rWvaP4nJ2w/Smk+jdrzxsbfkBVHHDq6uv89Q1r4LHoYM01QoAHOAn6lPQ2
         lZbrGhnlQQs8cIywS7Q6nUMTK/Lz9sWn75R696fIs2zjqe31K2ygxfGtHwyemkTM+9
         R2i1boN9WkDBC3O1GtvTcxBE6tZv8wCvuWaPoma9TMj037u7rLtRE0M1JMQFkWL665
         iqdFK2CFAFvRNcFpdKCfNVnK5FXiSmCwcuWZp6rVhY1+59cPbWjEW+6nSHchTRKDI/
         iyGNSANQ7ki34IDvcs118FeTrB5wm6FYWTZhqho4mDUSmR1GRyNtjgLBcOqTrWbUQR
         /S6vR9lG2cBCQ==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 831BA4045D;
        Wed, 10 May 2023 21:29:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 18E5DA006F;
        Wed, 10 May 2023 21:29:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=CytofAI0;
        dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6DE9340520;
        Wed, 10 May 2023 21:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B62nyUkJqNBuU82hhjElrJpXegtIHkHYA3eMhSuB3uNJB3NMLGHmc3+/KR1PV+WJXEu/QYfUFkW7QoHF+XEOstb7bHQ3hh2uX/w6xafPegWHgjdHaoqC/0vrPmQ1TAeau3owwwPhS5gGZ+0uKhMjrtW9Xdn1IKyBWAT7nBjLsyGjHV5kD6ZR4Ru09DI53bNjFckmel3GXjyoE6ZZFMldobyaTvCy4CD7qziut6XPdrtZ8UjKyZUrYFKjp59g2FeOS8TzNzUPP/ujhYT0fdGREzBkvgg9/6hM4SM8v78Ov4obFZhKwJxU3cViBCvLf8woRRSN2gIEdDsy8geOndwn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RItOUm8QuLuiNhT2tVh923O+kJ1YVOev4seRjNGL7s=;
 b=IBonoYKqd0MY2MDtXcBfseBdJOE8y0EKgcYFVBlt4+w5lQ00qitI5wVdETisf2d/m3Gae6YVV1pBrrloln+Gdh8zkAxQXeF+vrkKl5Cdwr0X6MtRd0LG/A8QgINTzIXRBFBKdfmjsW5nfm1EhdvKlFiwSkM01WHhtvK854mSmHq/z/VGSw3jjWYowrgYpmENq3qdePQYQcGXx45K/GlhDPV1ZAi8jAMLmdc1Ams2A2tlJNX6JHiYtzs8A7ODEWUclf8Xi0l+r1SaI7YSxcT1DtMhtFBgOj6g/N4v+ib05LThl0pNV0DKBPZhZznYka47Q20LksOeCDaZNg973RqeFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RItOUm8QuLuiNhT2tVh923O+kJ1YVOev4seRjNGL7s=;
 b=CytofAI0iwrBWTc+1Hc3TkpqAxMgpQCzm5dx8fYzNMWPuXYcHZBHXKjV2kF6bp4xjb8jtiWVvqVRgGsMreQQn2gPdgD3MXljkn6nzc1hRBg2GKMXwg8CLisZfi3lh6KoIV3OxST4WJyjGZ9Yz0SsaNVZAB7hCGYPEndisP6ZZec=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 21:29:25 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::d13e:1438:9692:eba6%7]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 21:29:25 +0000
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
Thread-Index: AQHZg2pub4txYYMDE02M/COcGpMSMq9UBfeA
Date:   Wed, 10 May 2023 21:29:25 +0000
Message-ID: <20230510212845.ymxudl4r3f54erkq@synopsys.com>
References: <e465c69c-3a9d-cbdb-d44e-96b99cfa1a92@quicinc.com>
In-Reply-To: <e465c69c-3a9d-cbdb-d44e-96b99cfa1a92@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|SJ0PR12MB7036:EE_
x-ms-office365-filtering-correlation-id: aaa6d05a-ea11-4c63-2917-08db519da0b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: scT70Fgqm2PAiEBypFyxXiY7u9H6HwEPPqXF0V9umb1UIiigXKvA4qqyBSmYd6WLjpJ+wBj9Xf4GBtYRGWSB5IcgFYCYv392+CpBtEjOIYhuEkTaElxs4Qo08UBJSivvrIqo0r9qkw0Jq0qBZR9n2N0U6ZteD36Mi1PEfa2Jyn+6Vxl5AloQTvwU3LI2tUXI2dTqUjCzYBMsmKQJLURjXeVbZIKS2ds70WpyJCbCtHF4Sq+rruAFdDyvGcO8cBXNeFDINIqvuDTfY3ifORv8IaSqDX7WXTM1gRFtzO75VakwFZ9XZk28vhf54yZpl7HglkUmUJOBoL7N4N3usnha23lCAGp3pMKP8fRKIzDUUB+3/c1ki4FEs1Dpbg4dY7D9wpVThF4h9JPhc/la7ZUxOucc2PhYG0cI6NmEDut45CeGTr7LwjaIy1BCdEpQDLzBbWDRoJBvCGPa8w2x1kku0YYkLX+XfiJYWpMoZ4ZEJG3fhFkpNjXRTK6jz+z2ibbIPn+8W+Kpe3fGVPkIcTeuKPSoOECzKfMC8CydXWSMKo8zw/soVAgyAaoKQbKnVrNJj/Zis6DspF03gGcDAH3PB29KVzrNJBXmbla95nsEMIrM2Ir4094p9nsix8ZTd8m5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(2616005)(6506007)(86362001)(83380400001)(478600001)(8936002)(41300700001)(36756003)(5660300002)(316002)(8676002)(2906002)(4326008)(6916009)(64756008)(91956017)(66476007)(76116006)(66946007)(54906003)(66446008)(66556008)(6512007)(71200400001)(1076003)(6486002)(38070700005)(26005)(186003)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkU3ZFU5ZHVLa1NTekF2VExxMk5TYUE5b2JLSEg0dlRKQStUNytqNEU3ajg5?=
 =?utf-8?B?WGxiWSsrYThqNXhqM1pJWHIrZzJQbnlXVkVOV0Q3OGlSTlN0N285aVN2bHVh?=
 =?utf-8?B?bXE2QjJVUk1ZcDNweTdwT2VRQno2QjBQNTVEdEJHUWV3V2FLajhialROZE9y?=
 =?utf-8?B?OGI0dUhHSHJZNmZLUDczckFxa0FXeFVLbGpqRGxjMm1xa0s4d1JsVWNYdThp?=
 =?utf-8?B?dEdzNENydW9icis0cEM2RTBSSzRTQTY5SHFYK05wUm9vMmViTG5wbU9mcXp6?=
 =?utf-8?B?elhsQzBXMUZtTEdYV0R1bmNSdE81RTlGU1hvZEkwbEVGWnZDaG4rU2hSc1M0?=
 =?utf-8?B?ZzVKLzNnRm5WckdTV1M2YmxrUzl5dUd2QWNYRXY5UiszYkFFNkVXWlRWYUJW?=
 =?utf-8?B?N1U3MUZzSU1zY0RmOGZkcUxFZG5lekVneDZBazI5cXJKdUk0MElqSU5yK2p0?=
 =?utf-8?B?YTlKNGNoTlhxWStTM1pLejZQdXZjcklwRzhJUjVOaytkOFZFRXRSV0lNdHY3?=
 =?utf-8?B?enNVWHBxV080VHRveXNhT040UkdidHA0bDlPRmZ3bSt3RFFpaUJ1dXZpeDFV?=
 =?utf-8?B?aTU4dndvQVRGSWNNZk9vSUxNVXRjZHRVc0x5RmxvS2V6L2hqNUNqMldGVmtM?=
 =?utf-8?B?R1ZoMXQzZFM5bjN2a1BXS2s1TTB0QzIwTEJmQzZZNFJISDdyQ29DUUpRWXl2?=
 =?utf-8?B?dDZzODRSV0dqVXE5L1pJQW9DdnZtVE9wZ05WOWdNYkJmcVl3WDlySTJSOHF0?=
 =?utf-8?B?cER2R2k3LzZ0bFZndDA0Y08wWGVwWXlVTXRrMGpWa3krMHlxNnMwSmdLV0dh?=
 =?utf-8?B?TXdtdHFxenlXUm9BeUZaaWdnT3FoRXB2NzlxR3JPK1RkeGZNM3Y0SVZjMm1r?=
 =?utf-8?B?SFBWejczMTNYcTJDejBINVZhS2oyOGYvQUZiV2FEbVlBa1ZicUZXVmZ3SGxy?=
 =?utf-8?B?SFFZMnl5c1pyUG40ZWpYMUkzV1NCMEJQbGcvV2dqTEtrZFY3SnlWd3pxRVYy?=
 =?utf-8?B?VWpZdnVYNE94azZzTWFFZWJLV1czVWJsTHRDL0FHL1ZIdlJ3c0RYUUdMbUZu?=
 =?utf-8?B?S3Q5K24rOGZCZlQ5TkYrdVZUSU1YcThrRTVBMnJlMmlOWEFaeUpteUV5TldB?=
 =?utf-8?B?RldQTGExemwyZGZDR1djME8reFFzQ2YwMUlDelB0c0hBVm94eDI2SmRBU2o1?=
 =?utf-8?B?Szh3OXY1VkRTejF3Sk15ejZabUlJbDdSNmMvcS9saWVTRkhCN010TjVGbHB1?=
 =?utf-8?B?RmlobktpbTBCVkR4MjRMZkdZZHN2NFUxL3YyZGNreE8yMXVSdmpoeUF2QWdr?=
 =?utf-8?B?V1l0b3ZZQm5YaERXS0hQUktqUWtFYzJUZm1RajhERldFano1LzVQUVk3YmxT?=
 =?utf-8?B?dkhuRUthcXArTzduNHl5bXdXWkx0cVM5SnEvajYvdnU0MUllVmUxckZhMzFu?=
 =?utf-8?B?YkR0UmRucUhrSlgzM215ckhNbVdMdHhrd0p4Q1lXeHZ4S3VzQXZXZDFmK2ZY?=
 =?utf-8?B?a28ycGloaU5IZHlsbEFDcWFVQ0gyckgxaExTbUEwWFpCTWRJR3h6WW0yeWIv?=
 =?utf-8?B?c3p5aUprQmFKcGp0UUQwTkRNd2ZLY0syc1pjYVZyYVUwd1dUMUJ0aVd0QUVF?=
 =?utf-8?B?SlJ2L2RlZGoxaCtySmZ5VFdFUHMwY2pEREpmYmFmNTEzbzVwWmFzczlRNFNt?=
 =?utf-8?B?ZFN0eWNGWXZKMVF3V01lL2twZy9Iak9vNEtHOTJuSXNyeS9aOVZXN0FiUWRS?=
 =?utf-8?B?TkVyS0I4b21DRlQwajhFdStieGo1eEJKSk1TQ05RWXJYVW1DVmFRZ2RTY2cw?=
 =?utf-8?B?UDlKU3VUYXV4SVFCemN5MXRPeDN0TTVXVmt4bXdETXkzWUo5RzZFaXB6QWFx?=
 =?utf-8?B?UVpaMzF4eDZGZVUxN0lDVmFkN2tmcHRkSW1zeExuR05FaE9UNVlvTUNEM1RS?=
 =?utf-8?B?SzFKT1krbUc3SUVtTE9pN3pKSjRUVHhaQVIrWWwzUDZPdFBOS1JRelJpb0px?=
 =?utf-8?B?MnowRnZNd3NXcWo4V1hEMmJYUmxWY2NSUHZJbGN4SG9SWGJMcW01VXk1ZTV0?=
 =?utf-8?B?bmkzcWtYbWpTemJpNE83R28yUjllR1RKWERJVUE3RjRIbnJPRmxXd0hIRHpT?=
 =?utf-8?Q?FOQNf5fVm/CexdNa6fkKYzaRt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F96D491CC1214C42A8E4B3C239A5469A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: aUdIAoMLeDl0snylwFziK6xomk761SqmtFFEmEr3EkMWIlMeUEVtyuwPbz3dWixhqFiarkt5whiZy27TMh7b5cEliVu/ZZNlev2jySFmGkKFkxD9UjokHNa9rUicuuhsOoXZBNOaX0MrixmwB+rMxWBqCsbcLxE7I/e99P1tXPY07bx8kBrVoTPTphuPxc/v/rMgfhSTnprdi+FuKOyaLg5sKRXQOXVyQsDoj9/CJd5GVXjOSOo5tk2c+wAde5AUmH8dhj7FRgbizu36eYSxvXfg1vBg/1/YLGXVDmLThiN8kajV5+/ugKIW4VgBfE33sGqQOaoWXJomYRBnJzMpLfbSMUF3E55R6djE5T13XwKSOI+WPlgR+uL/4SmrslL9qkogW+ZIaozirAk9AHHSi3PcBLyw5iZJ7aA2H420Nde6jMYtqfvAi8MFf7VQlIiy6tKBxb83GSQHtCFCi67rsvWCK79Sif41fQw1V6LUhEpotYVV5wLClgy0+a3LaM72CJW6iroctfeK5Pyea2AjKpAY5A5p9SpZU0FCo6tx+KNtKZIs29w+pO5mdWzNT/vRk2GPy4ZakiHy852Oe3Hqg63DeqZlB5mpzxXERDjvD43CRxXuy0HFf6p2odiaeUr/oBXtdQd9Fl5p75s42FRP6EwPd0IDUInwA4RmDFXdai5pWKSAKXMIe9ohq1ebcIBPg3iwfcWUpjJx4xketCJYDsf6uyJd2j/cek83zovKY7I+ydt7H810Vzjs8c+FWv+RMMjLOYrn7TUfTcUWCMHW1+yjY+XPR8MXQ/GusyIO4TDgeK88Oe0wIX0qWmmZ0d/9hqc3Oc14Gj8ZJArA66M6Tx6sMWVqJ5N16co7ikPSBQK/+Jn99JrRwS15n9NtKicbe2YvVIyE5frJyj/B62I3GA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa6d05a-ea11-4c63-2917-08db519da0b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2023 21:29:25.0643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUqrEoZ0eLC4g7R01kPDZy/gnWhiBPVcEZWFWzY/UneVm6igggA95ovwfrOc5EXNDei0PV7jxqnnnzPOmUpNlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036
X-Proofpoint-GUID: UoLSc82fd63k93DZGS7RPHuq9IfYnU9z
X-Proofpoint-ORIG-GUID: UoLSc82fd63k93DZGS7RPHuq9IfYnU9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=977 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100176
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIFdlZCwgTWF5IDEwLCAyMDIzLCBLcmlzaG5hIEt1cmFwYXRpIFBTU05WIHdyb3Rl
Og0KPiBIaSBUZWFtLA0KPiANCj4gIElmIHdlIHNldCBtYXhpbXVtIHNwZWVkIHRvICJzdXBlci1z
cGVlZCIgZm9yIGEgU1NQIGNhcGFibGUgY29udHJvbGxlciwgSQ0KPiBzZWUgZGV2aWNlIG1vZGUg
d29ya2luZyBpbiBTUyBidXQgaG9zdCBtb2RlIHN0aWxsIHdvcmtzIGluIFNTUC4gRnJvbSB0aGUN
Cj4geWFtbCBkb2N1bWVudGF0aW9uIG9mIG1heC1zcGVlZCwgSSBzZWUgdGhlIGZvbGxvd2luZzoN
Cj4gDQo+IMKgbWF4aW11bS1zcGVlZDoNCj4gwqAgwqBkZXNjcmlwdGlvbjoNCj4gwqAgwqAgwqBU
ZWxscyBVU0IgY29udHJvbGxlcnMgd2Ugd2FudCB0byB3b3JrIHVwIHRvIGEgY2VydGFpbiBzcGVl
ZC4gSW5jYXNlDQo+IHRoaXMgaXNuJ3QgcGFzc2VkIHZpYSBEVCwgVVNCIGNvbnRyb2xsZXJzIHNo
b3VsZCBkZWZhdWx0IHRvIHRoZWlyIG1heGltdW0gSFcNCj4gY2FwYWJpbGl0eS4NCj4gDQo+IFNo
b3VsZG4ndCB0aGlzIG1heGltdW0gc3BlZWQgZ2V0IGxpbWl0ZWQgdG8gZ2VuMSBldmVuIGZvciBo
b3N0IG1vZGUgPw0KDQpUaGUgZGVzY3JpcHRpb24gaXMgYW1iaWd1b3VzIGhlcmUuIEhvd2V2ZXIs
IHdlIG9ubHkgZXZlciB1c2UgdGhpcw0KcHJvcGVydHkgdG8gbGltaXQgdGhlIHNwZWVkIGZvciBk
ZXZpY2UgbW9kZSAoZnJvbSB3aGF0IEkgc2VlIGluIHRoZQ0Kb3RoZXIgZHJpdmVycyBvZiB0aGUg
a2VybmVsKS4gU2hvdWxkIHdlIGV2ZXIgbmVlZCB0byBsaW1pdCB0aGlzIGZvciBob3N0DQptb2Rl
LCBJTUhPLCB3ZSBzaG91bGQgaW50cm9kdWNlIGEgbmV3IHByb3BlcnR5IGZvciB0aGF0IGFuZCBj
bGFyaWZ5IHRoaXMNCnByb3BlcnR5Lg0KDQo+IA0KPiBJZiBzbywgY2FuIHdlIHNldCBMTFVDVEwg
Rm9yY2VfR2VuMSBiaXQgaWYgKENvbnRyb2xsZXIgaXMgR2VuMiAgJiYgbWF4X3NwZWVkDQo+ID0g
U3VwZXJTcGVlZCkgc29tZXdoZXJlIGFmdGVyIEdDVEwgY29yZSBzb2Z0IHJlc2V0IGlzIGRvbmUg
aW4gc2V0X21vZGUgPw0KDQpCVFcsIHRoYXQncyBmb3IgZHdjX3VzYjMxLiBGb3IgZHdjX3VzYjMy
LCB3ZSB1c2UgYSBkaWZmZXJlbnQgcmVnaXN0ZXIgdG8NCmxpbWl0IGRpZmZlcmVudCBlU1Mgc3Bl
ZWRzIGFuZCBsYW5lY291bnQuDQoNClRvIGxpbWl0IHRvIGhpZ2hzcGVlZCBmb3IgeGhjaSwgd2Ug
Y2FuIGRpc2FibGUgdXNiMyBwb3J0cyAoY2xlYXIgdGhlDQpQT1JUU0MuUFApLiBJIGRvbid0IHRo
aW5rIHdlIGNhbiBmb3JjZSBsaW1pdCB0byBmdWxsIG9yIGxvdyBzcGVlZCBmb3INCmR3YzMgaG9z
dCBtb2RlLg0KDQpCUiwNClRoaW5oDQoNCj4gDQo+IFRoZSByZWFzb24gYmVpbmcsIHRoZXJlIHdl
cmUgc29tZSBjb21wbGlhbmNlIGlzc3VlcyBzZWVuIHdpdGggU1NQIG9uIHNvbWUgb2YNCj4gb3Vy
IHRhcmdldHMgYW5kIHdlIHdhbnRlZCB0byBkcm9wIGRvd24gdG8gR2VuLTEgaW4gb3VyIHRhcmdl
dHMsIGJ1dCBsaW1pdGluZw0KPiBtYXhpbXVtLXNwZWVkIGlzIGFmZmVjdGluZyBvbmx5IGRldmlj
ZSBtb2RlLg0KPiANCj4gUmVnYXJkcywNCj4gS3Jpc2huYSwNCg==
