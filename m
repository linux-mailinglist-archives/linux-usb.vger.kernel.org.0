Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBD5699BF1
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 19:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjBPSLz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 13:11:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjBPSLy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 13:11:54 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C38505F2
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 10:11:52 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GFiPIa016916;
        Thu, 16 Feb 2023 10:11:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=KEXkCPaUqMsmQ7MJ0VScr8LqYiWp7fIOZcr2uu/w64Q=;
 b=syrgBL3L6zwUFHP9+1VKZFFUobpH8BGGmOQCe+Bey8n3Ld3MOUS8oNQel6BIOe+M8sJB
 WdYx2uGs531Bif2REb20UH8jYtwD6EaLigdAJcKdfrvE8AuTmzt8RxIpnKGQuqWBapU8
 Np5mlQN6HpfkIPFMMTKU0WmcNQym6PgWLH9l2iGci/0mFC/d/IS4C3p3BYM7tLxR7Ye/
 0Ykmfow5ziFpDBoAYxP5eaxzijoN1JXcan9HyCnnN32Vl+Vrzzt3uNbWXNcAh6kAFE9v
 STzljqe/d2fW6Ac5MXcD7gNhQbBvZUHS0XShxGo4kXWcnqwMZv6nihTATqRswGqfHwjb Jg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3npawuncma-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Feb 2023 10:11:41 -0800
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2275D400AF;
        Thu, 16 Feb 2023 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1676571101; bh=KEXkCPaUqMsmQ7MJ0VScr8LqYiWp7fIOZcr2uu/w64Q=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=T9bx4/oRypjj2VZzfpC2PQQlsXH3tY1pRE9w0JKYZXTGXK/HPnsYEgIOM/vsr95Wl
         SI5fcWTSI60Nvx51VptJsgfshcHJsb+ca3kgOa0HM+gtCWeac1H2fQzC1CJFo1yFJN
         q2FzUNXblnkDis3biv7Uev6eJIwLgrnQu4s+V3W0KdCfJNvge0tdLEKH5AyjbScMII
         aKwNAx9aR54s9L3EvsCnhrxGQ2pYKCG6g6Zcb5cweeo5fJwq82RIs/J6G5+HHfXBCS
         2WwjoBJyhcmDXZkzg/e05A57iyyNrLp+3uupCZhrU3HQqpoiFmyshOpYLQ4a4ZAsjK
         dHAPOa521rcvQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7D84FA0072;
        Thu, 16 Feb 2023 18:11:40 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C11E0A0562;
        Thu, 16 Feb 2023 18:11:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0zCipmnkfgcPVZpvx8iOxlZ6m7IHCC1928Zm4rZzEN0Nov0MweK7hr9+n+lOH+IpNKFSY5fcNyIgwu/J+T3ydCxYWwEnRQN6HoAnrsXtcFczo9vZpmzy08+V/fYsPUiCRFQnLcRqELqIur002bIdcsBUwx4iaPhYxj3BGfbkBoc776v14VSRet3zVI5AoB42MW9cHzNZDdhgTLNrpCk0s2V4UgdE39Xqm2fvgCO7oneuHFOTu3htpjRp0UH709s2YLmtk3QqprTmP7baD6AZiwSoXbnZlS+dJDAZpgUwZCrCaMZBHbsHHsZzVySuweoe7DBQyoCGQcxaURZ6GPOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEXkCPaUqMsmQ7MJ0VScr8LqYiWp7fIOZcr2uu/w64Q=;
 b=Jr26T5V+NG8yEn4u5L9pIlXcUf500VsG6fGwGMg41vgzktfUphUi5BN3ziXEdSvo44gkfWaAuPL1jnFZOhG3xYxc9mvLlDQ2k0bPrR+Noq0A5rEK7jzvXOhEuazJdXMj3DZTVTmtQSP5suV8BG494m2Dy+1hR5SWYROC6b/vil1gRPpF1xa13IKTvw81TWb83ts/TwVU7wGemNAqaIPZuOZpjOQU+iw7Vxrtx2bmRK4yjGekYn1ebPzOn2QaaU2gx14gohXoV39dA3lIwLKf8MCM3s7CosjmWWWvy8PDArQTP/b9NBrWQUgpqc7wJNwUKwPGSG8G0pijg3X1Fa9Yrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEXkCPaUqMsmQ7MJ0VScr8LqYiWp7fIOZcr2uu/w64Q=;
 b=ud9Dm7vud2vx/9jzp0RA7y7TgPcgRDI3Zi/czvtVjIpHDE6uPDTnPSanWeD+AVb7DbDNGvxMF9+EjR1m4iEIHOjpBzA3YmSZh/SZCqShLDkDq0V7YmA4GqKEuKy95aYEaMgAxSkLcVR3Q7PAChSRm+BsBoT7se4znVcR7Pahn9U=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB6421.namprd12.prod.outlook.com (2603:10b6:8:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 18:11:37 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6086.021; Thu, 16 Feb 2023
 18:11:36 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Roger Quadros <rogerq@kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
Thread-Topic: dwc3: gadget suspend/resume vs system suspend/resume
Thread-Index: AQHZQSGIQpZyBgHR1ESwyvCYdmUCwq7QJboAgAAeOwCAAA9MgIAASymAgACj5gCAAJ+fAA==
Date:   Thu, 16 Feb 2023 18:11:36 +0000
Message-ID: <20230216181132.k2jate2uwqadpqfh@synopsys.com>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
 <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
 <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
 <Y+0jZScRX80mF8tS@rowland.harvard.edu>
 <20230215225337.wuzhpmikiqz5htqk@synopsys.com>
 <3b6f29e9-cc6b-d834-7c7e-7ae47b9fc44e@kernel.org>
In-Reply-To: <3b6f29e9-cc6b-d834-7c7e-7ae47b9fc44e@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB6421:EE_
x-ms-office365-filtering-correlation-id: 62ea8472-09d8-4e8f-92a1-08db10493e66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: obCPv4hDTjbg+ys2EEf81byUQWCX7LOLNhixoSBKLUnAwFfkMHSUPg5ME4lh24293mR4niVjSdxvTugF0cq7Gquqt6vOBMfuJ6JPznQhElzUAd1qPvLN/4SM0XfuefJy+46Rn1ZB9TGSzAniFS+yb/k/QH4QDNw5o0yh639oJIpBqXmOL21kfUrOImPQxkr5yzWPe8Qohjp4yXCNiDly2pDgPhb5Z9C1KDqZCzXUUONus9U+Ay9D09sVWdhniZaeAG1wTpVzk18/f1XHnPnacfiXY+4P1gefMKRMss7IBfdm9ARfLinKqluyzyQs2JUh7t7M56d3ol0WCht41mAnai1buRIWtcL5LaDCMkP49n+ErcfdTAy83FBnK0Zrk9W0KTXi3vVUuA6ThF8OkoL9BP87VlKm9YbZinQQdc2Fjj5Wl1yBrlzOFsJYJV2t4SYqyq5hun7onJyDSqdvYKVYfnLtIU1HogLYsMDhTuINFQuxpyItbSjehQVMEfTZRbT7KOCSIwavi8ipyw7eza3eqcPvc///NDSeHb7KUJgvtKbW5YEKYs/G6qHS3N8Sduu6nw3ifxGwut86MzitjqvlVkFnvWS0Bwz+dN7shyY/c/Vgnju9dpRB0i5UOTDEDqqmZ0nxzVOOBpp4QHxNHOxl1+dQVxMXOKhFP1ua53DnsMvf27u2AXoPsHn41nlYzp6Kusip/FXR79xlxGAaKnC3/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199018)(36756003)(86362001)(6916009)(2906002)(2616005)(54906003)(478600001)(6486002)(1076003)(6512007)(83380400001)(26005)(53546011)(71200400001)(186003)(8936002)(316002)(6506007)(38070700005)(4326008)(5660300002)(15650500001)(64756008)(38100700002)(66476007)(76116006)(66446008)(41300700001)(66556008)(8676002)(122000001)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVFtN2tybjBIVTMwSUkxSVc3ZWpPa3NEVTIrWUIyOW11elMrMS83ZElpbi9a?=
 =?utf-8?B?OFhHU01NeEFoSnZJZnRtSnJzdU5JUzU5dHhsWkJOKzVpTzdYWnBPWTBFY1po?=
 =?utf-8?B?cnJldVJxcXMrZHlYczI4d2k0VUJ0bVRUMWNueXM4bmk1ZTZSVi9UY1V5K0JV?=
 =?utf-8?B?b0pzUnovNG85bGh1NVRlS21OeE9rSDIrbW1nUUFFK04zb1RHMEsxQUQ0bXNs?=
 =?utf-8?B?LzR6VlhhVlVSRXFTa2RWcVpVSHNUTHExSFNEcExCcUc2RitLL3VjSGZsMGh5?=
 =?utf-8?B?UW9VbkZ1bHdhaWJRd3ptdVVOOTdkaUtXZHdLODR5d09JenJQaWpmeXErWmMx?=
 =?utf-8?B?b2Q5K1JaOHhxbGwwTEkzVDNZQ2xKc1ZpK21zaFNRUWwzSTllNm5rNy9QZUk4?=
 =?utf-8?B?aGJxRThVYlJHN3doejBrVGplanlyNTY1Z0pWdVBXZkM5N0VXSzEzOG14ZXBZ?=
 =?utf-8?B?cjBGQ0JvSURZUXoyUGRKMFJvbFd4YTAwSUJPZHQ0cnU5WVk4Zm00VGFWekJi?=
 =?utf-8?B?Y3pNbDhxMHE0NEV5R0RZaHFoeWtBTEdqbmdGSzNkaHByS3ZBTm5nc1pSOWgy?=
 =?utf-8?B?T1dEYUJGUTRvVEZYaW9sQTRxMEFXbTV4ZTN5eVYzK0k0QWxMZmk5aW1MYmVZ?=
 =?utf-8?B?OVBjRmVIdEZsbS9iMWs2NnpsNTNISG12WnFLM2s0SUtlOHp1RkN0TTB4Wnhq?=
 =?utf-8?B?VzdEV21FODJYM1RuYVAyMGhYYVdMcGNNb21telhNakNKM3RhSTlIcGpkd0Nz?=
 =?utf-8?B?cno0NThrNkcwK0RBSUtxeFcrcDVkNXhPNEk1T25STGwxeGswaXQ3MmMvZ2Rx?=
 =?utf-8?B?bWtQU0lndTRyd0xjQXA3VlZBRkdPT3ZnOU5EelRYeGYrK04zM2RxOFRzZEJk?=
 =?utf-8?B?Z25LR1ZMcnhVQWZzVkdzM2FQTFdUUXo3ejlRZDBEeFQ4L2VFR2JlOWloNVM1?=
 =?utf-8?B?ZHcrV0dzV3ZiOG1NSkVuZFJ4MEI5WnBKZml5ZkczRk1ZVE1HdFhDTlhCbWZO?=
 =?utf-8?B?RytRQnh6d0xiYS8yelh1Sk9uZjArMVVrbjFvSXRkci93MTlYeVRwN2dTWlNm?=
 =?utf-8?B?WklRSUI2ZW5vYXRWUUhTdkx2bUs2SEFrWnU0VDhZMmQzZkMxbGF5TDh5UnBz?=
 =?utf-8?B?VTJVTC9ydlNXb0JRZ25Hd3o3YzRFTVZFRU1jN2VOalZSNG4wTkpzMDEwRXBB?=
 =?utf-8?B?M2hZb09Bb1FqemtMYlBvclV5a3NBRUxERmt3YzJ1ZDE3L0JYRmVJa2RyTjRQ?=
 =?utf-8?B?RmJobFlOTFI3V0VZSVIyTEZBMy94ckVrREM4VnlSaWFrSzNDZlRkL0poL0Z0?=
 =?utf-8?B?RHQ4RnZ3d3UyR2xoVjkrY3o0R0kyb1dmc1F1UnF4eUZFQzZHWjhTb3lLOUkz?=
 =?utf-8?B?MDZ5ZlVTemhSNzRGaVJOWUU2T3lkYWhBaEJOVm1MekxYUWkvVXFySU43V21w?=
 =?utf-8?B?Rk5rQ1l1KzRNN1dBeTZDUXdoWURnVWlmRzNGYWNuTmYzWVlsbXVqdWtnQ0NU?=
 =?utf-8?B?ZDl2SHBtNk5PbVVwUmh0YTdVUXpscWVwS00zUThVM1Exa0F3MGQvZ0lGcEY2?=
 =?utf-8?B?OG1ZdlhRZFFIUFI4VU01ckl6TWlSNnZyQ25ia1NUOThRYldDNGFoY3BXNnh0?=
 =?utf-8?B?ZFpMMjVtWjNGRk4rTXdhMlVsN041ZE4xZEl6bTcrUEtTckFKY3UvK21JcHc2?=
 =?utf-8?B?WlFRVW51bW01WGFHeXdBQkEwYlRmbTZaVnUrRHJoVFl3UjcxaFI5SVdndnNH?=
 =?utf-8?B?NGxZVE9tUkE5amJiaXVLUUVQK2xhSlZEU1pHUGZCR2VNcDkwQkRSQ1NYRDRj?=
 =?utf-8?B?TldhZjQxaDA3L29KR09TZ3cvalZMQW5MYkxMODg5M2s0S3MzMmNuTGJMVGYy?=
 =?utf-8?B?cEx6Ty9jR3lwYnAxbEp0eCtJblV4VmVobDZxK29EQm5OdmNoeTczbU9yeTJK?=
 =?utf-8?B?dTZGVnZ6c1B1dmRpcHFtOFJqcmxlWjR3NU9pVWs3Tlp6dXp6YmxkdUFmMVUw?=
 =?utf-8?B?YndjMEY4eEpEdDFWVVgxZVI0RWIveGxRcmtoSVFINUFkYUJtRFB3cHVpM3c4?=
 =?utf-8?B?V3hLQ0ZDV3pQaWlLQkpmb01XV1ZUZ2RFVEpkY0ZQS0QwZ2ZjWjJPZVdKQ0c4?=
 =?utf-8?Q?PV+okbLtXZa6gNzkTu0p3p+5n?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A1FEC0D805AAD4BAA77683A3DD420B2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: U9UstjkwT+snmvXLNPZx2lg05Cg+gDbyJozJ0LqMvHrTrDjgS0co4usahcsG5/Yy3twDl/ofIjZhOyPy3t2KpPXfek3Wk3ci+RRL0bUvosE40Ia5U4iUxUDSegTgzZldqvauuyfr5G6JvfZGclCKQeNHxN6BT8rfbKmhF8SZpqV5K9u1zLYQcQALuj7DSt9pQeEz4E9kTO6BksGkA9qJMK/KBBA/SROcYCOdOyunk2Ekq/x2cDqY0LLgsEOWdVV8CDjG1oICQLJVnEvMFxxEauXzRX7K8MQ84xKJdin5DF5hzN4ZdiHgC2K7buI0EMWepiEptoMQYz7NBRCW7Gt3JOkbdg5YR5C7V3cgB+uAmX+IWY97LyY9rgLaDfFZQJ3FHyGEyMtUDWurG1FxpeiHSZ6LFvzLujeO51IrNzzZlmzQba/0gEa1jTGs3Z5v0ZPJZrTaQSW+ua1AWnfX1UNeoGaDlQyOrp2pQd+xK/bOAfnGgU5zhfCNWFeX3DCuXa+TpoMHjRLbdVhYbdxY1gQjdPvZz4IM0+sAFIuSLg80zXYtwWv81xcC0vJNCRgaZuuY9FStr/QZ16oYYN1mM/6Xy7kJ0cHUwt8FTULtRLJesSB7IqeSCHIsCWAGYrlRG/Krp3DmzVCm8woEV2J0ehzLDYUeoFQ9LpyyQnO6nmspQrfdBK7xDL2j2X8a5eypaP/avHfvb80yjFHIMY451Msb9UziHqt+t1PVfSO/geBuEQtbFp5IkeMsdqD68fmEGQ8lw4UfkTlipHA44IxUeZ8Kx1fUDnOKEr7C/VPomwoKvx8EqTqhRpN79SdKRKgz9FqyF6Gsx5ULy+ZtMFIhVYTp5U17vPl9yrynykIGqXmWPmKzos/12Ds/4OdjPDn/q3KE
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ea8472-09d8-4e8f-92a1-08db10493e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 18:11:36.7998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vFW/0TlcZkjXGDI7DAD2J/CYjR8xguLz/7kz5QWF+7j3it5+s34ert/47tWjdg/AbWXoOXJgLeudIlmWfnRyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6421
X-Proofpoint-ORIG-GUID: tPT3HHcAiRHJUu-5ygsHFElcmGm8zZTy
X-Proofpoint-GUID: tPT3HHcAiRHJUu-5ygsHFElcmGm8zZTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_14,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 mlxlogscore=653 clxscore=1011 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160156
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBGZWIgMTYsIDIwMjMsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6DQo+IA0KPiANCj4gT24g
MTYvMDIvMjAyMyAwMDo1MywgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFdlZCwgRmViIDE1
LCAyMDIzLCBBbGFuIFN0ZXJuIHdyb3RlOg0KPiA+PiBPbiBXZWQsIEZlYiAxNSwgMjAyMyBhdCAw
NzoyOTo1MlBNICswMjAwLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0KPiA+Pj4gSSB3YXMgbW9yZSBp
bnRlcmVzdGVkIGluIHRoaXMgY2FzZSB3aGVyZSBVU0IgaXMgc3VzcGVuZGVkIGFuZCB0aGVuIHN5
c3RlbSBzdXNwZW5kcy4NCj4gPj4+IFdha2luZyB1cCB0aGUgc3lzdGVtIG9uIFVTQiBhY3Rpdml0
eSAod2hpbGUgc3VzcGVuZGVkKSBpcyB0YWtlbiBjYXJlIG9mIGJ5IGhhcmR3YXJlLg0KPiA+Pj4g
QnV0IEknbSBub3Qgc3VyZSBpZiBnYWRnZXQgZHJpdmVyIHdpbGwgYmUgdXAgaW4gdGltZSB0byBy
ZXNwb25kIHRvIHRoZSByZXF1ZXN0DQo+ID4+PiByZWFzb25hYmx5IHF1aWNrbHkuIEl0IHdvdWxk
IHRha2UgYSBjb3VwbGUgb2Ygc2Vjb25kcyBhbmQgaXMgbm90IGhhcmQgdGltZSBib3VuZC4NCj4g
Pj4+IElzIHRoaXMgdGltZSBtYW5kYXRlZCBieSB0aGUgVVNCIFNwZWMgb3IgaXMgaXQgaG9zdCBp
bXBsZW1lbnRhdGlvbiBzcGVjaWZpYz8NCj4gPj4NCj4gPj4gVGhlIFVTQiBzcGVjIGRvZXNuJ3Qg
c2F5IHZlcnkgbXVjaCBhYm91dCBpdC4gIE9uZSBwYXJ0IG9mIHRoZSBVU0IgMi4wIA0KPiA+PiBz
cGVjIHNlZW1zIHJlbGV2YW50OyBpdCBzYXlzOg0KPiA+Pg0KPiA+PiAJOS4yLjYuMiBSZXNldC9S
ZXN1bWUgUmVjb3ZlcnkgVGltZQ0KPiA+Pg0KPiA+PiAJQWZ0ZXIgYSBwb3J0IGlzIHJlc2V0IG9y
IHJlc3VtZWQsIHRoZSBVU0IgU3lzdGVtIFNvZnR3YXJlIGlzIA0KPiA+PiAJZXhwZWN0ZWQgdG8g
cHJvdmlkZSBhIOKAnHJlY292ZXJ54oCdIGludGVydmFsIG9mIDEwIG1zIGJlZm9yZSB0aGUgDQo+
ID4+IAlkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBvcnQgaXMgZXhwZWN0ZWQgdG8gcmVzcG9uZCB0
byBkYXRhIA0KPiA+PiAJdHJhbnNmZXJzLiBUaGUgZGV2aWNlIG1heSBpZ25vcmUgYW55IGRhdGEg
dHJhbnNmZXJzIGR1cmluZyB0aGUgDQo+ID4+IAlyZWNvdmVyeSBpbnRlcnZhbC4NCj4gPj4NCj4g
Pj4gCUFmdGVyIHRoZSBlbmQgb2YgdGhlIHJlY292ZXJ5IGludGVydmFsIChtZWFzdXJlZCBmcm9t
IHRoZSBlbmQgDQo+ID4+IAlvZiB0aGUgcmVzZXQgb3IgdGhlIGVuZCBvZiB0aGUgRU9QIGF0IHRo
ZSBlbmQgb2YgdGhlIHJlc3VtZSANCj4gPj4gCXNpZ25hbGluZyksIHRoZSBkZXZpY2UgbXVzdCBh
Y2NlcHQgZGF0YSB0cmFuc2ZlcnMgYXQgYW55IHRpbWUuDQo+ID4+DQo+ID4+IEFjY2VwdGluZyBh
IGRhdGEgdHJhbnNmZXIgZG9lc24ndCBuZWNlc3NhcmlseSBtZWFuIGNvbXBsZXRpbmcgaXQsIA0K
PiA+PiB0aG91Z2guICBUaGUgTGludXggVVNCIGNvcmUgZG9lcyBzZW5kIGEgcmVxdWVzdCB0byBh
IGRldmljZSAxMCBtcyANCj4gPj4gYWZ0ZXIgcmVzdW1pbmcgaXQsIGJ1dCB0aGUgdGltZW91dCBw
ZXJpb2Qgb24gdGhpcyByZXF1ZXN0IGlzIDUgc2Vjb25kcy4gIA0KPiA+PiBUaGlzIGdpdmVzIHlv
dSBzb21lIGxlZXdheS4NCj4gPj4NCj4gPiANCj4gPiBGb3IgbW9zdCBzdGFuZGFyZCBjb250cm9s
IHJlcXVlc3RzLCB0aGUgc3BlYyBpbmRpY2F0ZXMgdGhhdCB0aGUgZGV2aWNlDQo+ID4gbXVzdCBy
ZXNwb25kIHdpdGhpbiA1MDBtcy4gQnV0IHRoYXQncyBub3QgdGhlIGNhc2UgZm9yIHNvbWUgcmVh
bCBkZXZpY2VzDQo+IA0KPiBJIGNvdWxkIG5vdCBmaW5kIGFueSByZWZlcmVuY2UgdG8gNTAwbXMg
dGltZSBsaW1pdCBmb3Igc3VzcGVuZC9yZXN1bWUgY2FzZS4NCj4gVGhlIG9ubHkgbWVudGlvbiBv
ZiA1MDBtcyBpbiBVU0IyLjAgc3BlYyBpczoNCj4gDQo+IAk5LjIuNi40IFN0YW5kYXJkIERldmlj
ZSBSZXF1ZXN0cw0KPiAJLi4uDQo+IAlGb3Igc3RhbmRhcmQgZGV2aWNlIHJlcXVlc3RzIHRoYXQg
cmVxdWlyZSBkYXRhIHN0YWdlIHRyYW5zZmVyDQo+IAl0byB0aGUgaG9zdCwgdGhlIGRldmljZSBt
dXN0IGJlIGFibGUgdG8gcmV0dXJuIHRoZSBmaXJzdCBkYXRhDQo+IAlwYWNrZXQgdG8gdGhlIGhv
c3Qgd2l0aGluIDUwMCBtcyBvZiByZWNlaXB0IG9mIHRoZSByZXF1ZXN0Lg0KPiAJRm9yIHN1YnNl
cXVlbnQgZGF0YSBwYWNrZXRzLCBpZiBhbnksIHRoZSBkZXZpY2UgbXVzdCBiZSBhYmxlIHRvDQo+
IAlyZXR1cm4gdGhlbSB3aXRoaW4gNTAwIG1zIG9mIHN1Y2Nlc3NmdWwgY29tcGxldGlvbiBvZiB0
aGUNCj4gCXRyYW5zbWlzc2lvbiBvZiB0aGUgcHJldmlvdXMgcGFja2V0LiBUaGUgZGV2aWNlIG11
c3QgdGhlbiBiZQ0KPiAJYWJsZSB0byBzdWNjZXNzZnVsbHkgY29tcGxldGUgdGhlIHN0YXR1cyBz
dGFnZSB3aXRoaW4gNTAgbXMgYWZ0ZXINCj4gCXJldHVybmluZyB0aGUgbGFzdCBkYXRhIHBhY2tl
dC4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBhcHBsaWVzIHRvIHN1c3BlbmQvcmVzdW1lLg0K
DQpBcmUgeW91IHJlZmVycmluZyB0byB0aGUgaGFuZHNoYWtlIHRpbWVvdXQgd2hlbiB0aGUgaG9z
dCB0cmllcyB0bw0KaW5pdGlhdGUgcmVzdW1lIGF0IHRoZSBsaW5rIGxheWVyPyBJdCdzIHJlbGF0
aXZlbHkgc2hvcnQgY29tcGFyZSB0byB0aGUNCnNvZnR3YXJlIHRpbWVvdXQgYW5kIHdpbGwgdmFy
eSBkZXBlbmRpbmcgb24gaG93IG1hbnkgaHViIHRpZXJzIGluIHRoZQ0KdG9wb2xvZ3kuIEFsc28s
IHRoYXQncyBoYW5kbGVkIGJ5IHRoZSBob3N0IGFuZCBkZXZpY2UgY29udHJvbGxlci4gV2UNCnNo
b3VsZCBjYXJlIG1vcmUgYWJvdXQgdGhlIHNvZnR3YXJlIHRpbWVvdXQgYWZ0ZXIgcmVzdW1lIGNv
bXBsZXRlZC4gVGhlDQo1MDBtcyBoZXJlIGFwcGxpZXMgaWYgdGhlIGRldmljZSBjb3VsZG4ndCBy
ZXN1bWUgZmFzdCBlbm91Z2ggZm9yIHRoZQ0KZHJpdmVyIHRvIHByZXBhcmUgYSB0cmFuc2ZlciBy
ZXNwb25zZSB0byB0aGUgaG9zdC4NCg0KPiANCj4gPiBzbyB3ZSBoYXZlIGEgNSBzZWNvbmQgdGlt
ZW91dCBpbiBMaW51eC4gRm9yIG90aGVyIHJlcXVlc3RzLCBpdCdzIHVwIHRvDQo+ID4gdGhlIGNs
YXNzIGRyaXZlcnMuIEZvciBtb3N0IGRyaXZlcnMgb24gTGludXgsIGl0J3MgdHlwaWNhbGx5IDUg
c2Vjb25kcw0KPiA+IGFsc28uDQo+IA0KPiBTbyBpdCBsb29rcyBkb2FibGUgd2l0aCBMaW51eCBo
b3N0LiBJJ2xsIGhhdmUgdG8gY2hlY2sgaG93IG90aGVyDQo+IFVTQiBob3N0cyBiZWhhdmUuDQo+
IA0KPiA+IA0KPiA+IElNTywgdGhlIHN5c3RlbSBzdXNwZW5kIG9uIHRoZSBnYWRnZXQgc2lkZSBz
aG91bGQgdGFrZSBwcmVjZWRlbmNlLiBUaGF0DQo+ID4gaXMsIGl0IHNob3VsZG4ndCBkZXBlbmQg
b24gd2hldGhlciB0aGUgdXNiIGdhZGdldCBpcyBpbiBzdXNwZW5kIG9yIG5vdA0KPiA+IHRvIGdv
IHRocm91Z2ggc3lzdGVtIHN1c3BlbmQuIEZvciB0aGF0IHRvIGhhcHBlbiwgdGhlIGdhZGdldCBt
dXN0DQo+ID4gaW5pdGlhdGUgc29mdC1kaXNjb25uZWN0LiBPdGhlcndpc2UgSSBjYW4gc2VlIHdl
IG1heSBydW4gaW50bw0KPiA+IGNvbXBsaWNhdGlvbnMgZnJvbSB0aGUgZGVsYXkgZnJvbSB0aGUg
c3lzdGVtIHN1c3BlbmQuIEZvciBleGFtcGxlLCB3aGF0DQo+ID4gaWYgdGhlIGhvc3QgaW5pdGlh
dGVzIHJlc3VtZSByaWdodCBhZnRlciBzdXNwZW5kIHdoaWxlIHRoZSBnYWRnZXQgc2lkZQ0KPiA+
IGlzIHN0aWxsIHN1c3BlbmRpbmc/DQo+IA0KPiBJbiB0aGlzIGNhc2UsIHN5c3RlbSB3aWxsIGdv
IGFsbCB0aGUgd2F5IHRvIHN1c3BlbmQgYW5kIHRoZW4gd2FrZSB1cC4NCj4gSXQgd2lsbCB0YWtl
IGEgZmV3IHNlY29uZHMgbW9yZSB0byByZXNwb25kIHRoYW4gaWYgc3lzdGVtIHdhcyBhbHJlYWR5
IHN1c3BlbmRlZC4NCg0KWWVzLCBteSBjb25jZXJuIGlzIHRoZSBzdXNwZW5kL3Jlc3VtZSBpcyBt
ZWFzdXJlZCBpbiBzZWNvbmRzLg0KDQo+IA0KPiA+IFdoYXQgaWYgdGhlcmUgYXJlIG90aGVyIGdh
ZGdldHMgb24gdGhlIHNldHVwIHRoYXQNCj4gPiB3YW50IG9yIG5vdCB3YW50IHRvIGdvIHRvIHN1
c3BlbmQgYWxzbz8gSG93IGNhbiB0aGUgc3lzdGVtIGRlY2lkZSB3aGVuDQo+ID4gaXQgY2FuIGdv
IGludG8gc3VzcGVuZCB0aGVuPw0KPiANCj4gSSB0aGluayB0aGlzIGlzIGEgcG9saWN5IGRlY2lz
aW9uIGFuZCB3ZSBjYW5ub3QgZm9yY2Ugb25lIHdheSBvciB0aGUgb3RoZXINCj4gaW4gdGhlIGtl
cm5lbCBidXQgYWxsb3cgdXNlciBzcGFjZSB0byBkZWNpZGUgd2hhdCBtdXN0IGJlIGRvbmUuDQo+
IEl0IHdvdWxkIHJlYWxseSBkZXBlbmQgb24gd2hhdCB0aGUgZW5kIGFwcGxpY2F0aW9uIG5lZWRz
Lg0KPiANCj4gU28sIGRvZXMgYSBnYWRnZXQgc3BlY2lmaWMgdXNlciBzZXR0YWJsZSBmbGFnIHNl
ZW0gcmVhc29uYWJsZSB0byBkZWNpZGUNCj4gaWYgZ2FkZ2V0IGRyaXZlciBzaG91bGQ6DQo+IGEp
IGRpc2Nvbm5lY3Qgb24gc3lzdGVtIHN1c3BlbmQgcmVnYXJkbGVzcyBvZiBVU0Igc3RhdGUgKGN1
cnJlbnQgYmVoYXZpb3IpDQo+IGIpIHByZXZlbnQgYSBzeXN0ZW0gc3VzcGVuZCBpZiBnYWRnZXQg
aXMgbm90IGluIFVTQiBzdXNwZW5kLiBBbGxvdyBvdGhlcndpc2UuDQo+IA0KPiBPciBhbnkgYmV0
dGVyIGlkZWFzPw0KPiANCg0KV2hhdCdzIHRoZSB1c2UgY2FzZSBoZXJlPyBBcmUgeW91IHRyeWlu
ZyB0byBkcml2ZSB0aGUgZ2FkZ2V0IHN5c3RlbQ0Kc3VzcGVuZCB2aWEgdGhlIGhvc3Q/IFRoYXQg
aXMsIGlmIHRoZSBob3N0IHJlc3VtZXMsIHRoZSBzeXN0ZW0gb24gdGhlDQpnYWRnZXQgc2lkZSB3
b3VsZCByZXN1bWUgYWxzbz8gSWYgdGhhdCdzIHRoZSBjYXNlLCB0aGVuIHBlcmhhcHMgdGhhdCBj
YW4NCmJlIHRyaWdnZXJlZCBpbiB0aGUgZ2FkZ2V0IGRyaXZlciBzdXNwZW5kIGluc3RlYWQ/DQoN
Ck90aGVyd2lzZSwgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byBsZXQgdGhlIHVzZXIgY29udHJvbCB3
aGVuIGhlL3NoZSB3YW50cw0KdG8gcmVzdW1lIGlmIHRoZSB1c2VyIGlzIHRoZSBvbmUgdGhhdCB0
cmlnZ2VycyB0aGUgc3lzdGVtIHN1c3BlbmQuIE9uDQpyZXN1bWUsIHRoZSBjb25uZWN0aW9uIGNh
biBiZSByZWVzdGFibGlzaGVkLg0KDQpUaGFua3MsDQpUaGluaA0K
