Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A2970767C
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjEQXgQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEQXgO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:36:14 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F033A8D
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:36:14 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HJctem002798;
        Wed, 17 May 2023 16:36:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=gfubCcr1AtuEi1fpRulPsEaU+y1jg23IF4YvGZFcjKA=;
 b=LQEs+Z+paqDO1GfI3rB4Bf2q8c1NnP7DPJBC7t3s01WuBPY04TSsl7K+ydscGsUSTyht
 LRsbSVwNpWeLnAlEthlstAJRn1P4z6YtqgP0g9fDt93ZQSRdSlYCscmRxtqDiguQXVmW
 8YFs/YKUnj/HM+5Gs9xhK31g330gNLgI153Pa+Ne7BNtUC85sfarP+wB2B1rso5eeH3m
 lRqh46m9s8Q6/tJNGJz5I8Wcfa5jSI2E55yKs0HfuotZ63w5qCgp4LDcgWXxK7cUBvBL
 gK1AcJer4Tm7dCPKUm8ZuIj0meOvhGPBM5GjgantPxPNm8b1pWw3vI+M8eRrfDjoXW3t jQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qj9jm5hyf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 16:36:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684366567; bh=gfubCcr1AtuEi1fpRulPsEaU+y1jg23IF4YvGZFcjKA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ajidnAwiwFZa1lwzN+r0FUzrXnxzgWl3yySKjTKk2WCejRl+nQUBvHBCmkjJpWvT0
         2BV/NlkDv+blcl9LtBEwFGliGbOvzjpA89+WA47huvSWJj1IxZlodt+5kTEzTI1V6g
         FqeU314JwN+QIUD9sHjqJROllldncwMgo97m7VUex4pSM88GAnSW55YMDiDULLoaUY
         JKSZtUMj6hsu8hCt9UMyjqnkfzDjC6zk3hjubYyIU5j8mDhybmb3RxQ5JT7gSMM2sB
         38nN/kCSmVN1qHYoqgv4/nYMAP4umJmCOU0/SVtw+aA3kjIsUL9Sbqt9gU6SblJ1ky
         6WYjOHtlydM1g==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 258EE404D0;
        Wed, 17 May 2023 23:36:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E18F4A005C;
        Wed, 17 May 2023 23:36:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DX0wVPlH;
        dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1A3D34045D;
        Wed, 17 May 2023 23:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc5mS4MzG8shsa90XFppW9dR38+pH4w8bDWD/HQN/3t1Jp6Jrfhw81UwzvrkqpnFKM9JMtwfmHvPMCW+bAfepBiKYxB6DL/tSXAXS2sJyTpyNCEoChGyR6MDtgeEobECScxtu7X1g6in9j+JOJ9FWRA8I3OoybgblfkSUgg7YnJRiEBmWoYpcr0RlgonOkHK/8wlQccpcdF6z/fGnaTFeC6uy2JiFFVvYmCcyUgqXi7p02VhoLW95BopCLlfhZylpuLwCdFDTZiVjEM9t5kg28l0At8fP2b0PUjwpHQn9NheQYjx8mo2Yr+tuAy2WAuzQkHwi51UlAbQCoyKIvwOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfubCcr1AtuEi1fpRulPsEaU+y1jg23IF4YvGZFcjKA=;
 b=J4qnxnvJPZHE3iCHSDjjGj/Ex/Xy6JwZ0zhJnoH7R9thDznRU+J8gKIxlTZcoGwXUTJ21nLt6GRqsTFvOhyEZ+a6mXyn29GBtp0hgODLK4RwBBxJkayZFKDfTlZf55SP17EV6qykEL49e6+qi72lDzLgG3C76iFmhLyRrIebjaFCcAPnJ5pWKvzdJxhpHSkE5UGzWHrnrsLKLNmFZSh3K4LkTeC+xpmoBiFeJDBa2QqB8DCZJhMA70Hsig7clL6h4qNdynaRU34PS6ncHxiIVUYev6MdVzE3cd36wafiR9A4iQHZ/46XCrS0K3iXumq5iHDaiBVcyZ5POoSQcphjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfubCcr1AtuEi1fpRulPsEaU+y1jg23IF4YvGZFcjKA=;
 b=DX0wVPlHwCgzOdSMzSm2fFeQegwW3cErJtm6ZlxvbhnDCGV4WwFylMBuzLCxXZQtDOVWLxtCxBbi7dwkL7jBsbNyHT0kDOu5IxJL9lbiHaLgVsHPX5bfrwQ0fstSaoW7fPL0H1dqiNW5kXsFSPzBkdV3NIQ+mLDBEKwfVVxMJTY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 23:36:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%5]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 23:36:00 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAAlnSgIAX7D2AgADufoCAA9vnAIAACRuAgAEw7gCAAEO1AIAAAgaAgAmL7QCAAAFrAIADFDAA
Date:   Wed, 17 May 2023 23:36:00 +0000
Message-ID: <20230517233556.ksd2tu2ab7wpqhcl@synopsys.com>
References: <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com>
 <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
 <20230509002143.7x5zo6bohvn5dyb2@synopsys.com>
 <CAMHf4WLzx3Bj-TR1ZrqsW1tfY+WUtgTt8TVObOFnkNcx2Pc9kw@mail.gmail.com>
 <20230509223526.5e6oqqri3mhwc34l@synopsys.com>
 <20230509224241.vvylagjkqbwo4hbk@synopsys.com>
 <c68249a8-4e22-abd9-5c7c-7e8b7f383898@google.com>
 <CAMHf4WLxxWM+DQz6=CEff34WcfX3s1cQoSKkv1qgJvJSMYmDQg@mail.gmail.com>
In-Reply-To: <CAMHf4WLxxWM+DQz6=CEff34WcfX3s1cQoSKkv1qgJvJSMYmDQg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB5747:EE_
x-ms-office365-filtering-correlation-id: 9a0f0ff9-2513-4c50-539e-08db572f78f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GBg8yMCUsVuma3yYRL4iA1f3ToB5WNjtRcoPBlNJwjXr1nd6a/jOXGnTOBJyk59WbauKB8J5rIwUXe5YCdPoH27aqCh4xDa5QCbkJJlgz2hUqQRIyHX9UwZAmHcPvh+sKW5v+DVebcKhB7dnfXzr438GbgxZ+ZUqelthHH7+Dv11ojI326eC1Vj4KhEN8QzxON+D/rdwwcnqCCPpJwDq9y21xRrF55vcBMiBlz7/AbDxqfoIo8/i8h0iFnqk5lyNvt7M7YJocb2ZJNuPii2cN/vl6qoCEKkRcke5IjfQ90EaqHiKg0iWTDaRJbvaJXeM2RmJ2d0za3N8x+7GOYs27ucqn1TgIl4M33doRlDv/2PZpaJswnufoihJTylzCr8mzZjzVBtGIcujjyzVoe3KSaD8LTyHMntedfNVocHdy1aeBCf8D+PszogYMNUya8H1tc748UVURCXj/LR5cdLVSUJYraSYvSmNoBLHCoRZ4FsDxbxfbWihum4d4hEhqdy0/R+YurU3yZSnWziH0/k8h106AGevVtXD2J94k8DhH+iOq02WLDwMnTiah+iJbbia2ceAnqjC7Q56p3BgsqqLDlmGjxa8Egrj7nUjm206idk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(8936002)(64756008)(8676002)(5660300002)(66556008)(86362001)(83380400001)(2616005)(6512007)(6506007)(1076003)(53546011)(966005)(186003)(122000001)(38100700002)(38070700005)(26005)(54906003)(71200400001)(478600001)(110136005)(6486002)(66446008)(316002)(66946007)(41300700001)(66476007)(76116006)(36756003)(4326008)(4744005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2phbmdNQVBocGxqSVU3RHdCSTdGeW5uNFVldTJsc25ocFplUW0rTDJGL1JU?=
 =?utf-8?B?U01KMmVyd1NwR0lJWDhZcnJUNVJkaCs4N2RCNlN1TnRGcytrQWV3SmdwS1Y0?=
 =?utf-8?B?cUN4bW13cjhxenVLd1I4QlpnOTFuRGtqcVo1TjRweitueHZZWERYL1RVcXJ1?=
 =?utf-8?B?REtIN0JTenljVlZCVnNNNEVTQzBWbE12eEZPOFFFL01NamczOWwva3BSd01Y?=
 =?utf-8?B?REtyWnAwQlFGcWwxUDQrcUFLSHZxaFp1QjNkMWlxQTlST1BvSUJGZHY2bGlS?=
 =?utf-8?B?dEJaUGpRa1dLaVQ3Rko1aG1CYzZJL0g0ZzRaVk1oM2pRUDhjM24xV2hFSHJt?=
 =?utf-8?B?QXhXZWJ5QTk1V3pNbHZHamJ0aGN0Y0ZId1VnOXZUR1JQTTd1aHNia1RCajdn?=
 =?utf-8?B?TWkrQW4zOTB6eWtlZUl1aEhXU3Y0aGJpY0hjUXdBbjhRNjJvY1FXTGlBSEpG?=
 =?utf-8?B?cXo4Ym5vbEpJSG5Oajl1eVpIMW93eGx2MHJYT2M5SVpBYVFuczh3dU1ETnVG?=
 =?utf-8?B?RmxCUWdHTzBtNllBUmpMekJ2NkljRGw2OEozdWl4OHd4Q0xJYUNjalRETzhS?=
 =?utf-8?B?eUxCYzNUN3grQStXU1JOeHIyb0MweERKYUh3QTl2bWo2SUM3dUNMOEFFRmxW?=
 =?utf-8?B?amJRMStUTWVXYjRGYnFJTnhNdE5yVFAzT2tSL1MxdGNyS1JXSWJ6K1VIcWM5?=
 =?utf-8?B?NDN6blZOMElsZHNIdjRwbmtQV29raTRtdXNqdWRkZ3BjT3o3bit2VUZQbjdu?=
 =?utf-8?B?ZTlzaVplaTRESjFiWjYyb1ROanJwSEFTbVhHNlpPcXpiWnhudzhSMUtyNlly?=
 =?utf-8?B?aHpxS2dqSk4vVVVPSkhSZTcwYlpoTVNsWWxFeVF6MWVXcEhqZHN6WExFY0E1?=
 =?utf-8?B?WTV0dmlTUkhwWld5QXo0TEVPUG5hd1FFeWlUcm9GYVB5OGtGQUc5TkZZQU5h?=
 =?utf-8?B?cm1GNWxQYXJBQlBWSW0vWWFjQ1BqRXpZMFlkYi9lZElFRWZSUHA2MHExYUZG?=
 =?utf-8?B?dDN2MjUybXdjQm43REJycW00M0JaQXBBVTFrR01zcVh0em1iQ0NWcE9UKy9M?=
 =?utf-8?B?eC9BRExYWktqZCtXR2c5Y3dTSXg4Q1dMWWlBRVJQd0gyMCtiUDViSXJ0N2pq?=
 =?utf-8?B?OFRWM2p4dmV0dWdZQzBkQjNqTWlRandOZ1VUclFsSEZ5R3JwOUUwbk1Ga25U?=
 =?utf-8?B?eFI0UFJucXpPMC9POGtuL3ZWdTNMWTI1MlU4enVXMzdHVkRTK1RjbXFwcXY3?=
 =?utf-8?B?TzMrZjVqempWYjRuOHhCTEtwaFYrdjJrZ0tPR2NWZVRqZmtyTGFzbWMvS3pz?=
 =?utf-8?B?ZzJNSkdRQWlOMXFTbUxYallwTWFUbkpIdkttSVNML0ovcVNVNEc4eEt0blNE?=
 =?utf-8?B?WUJucEg3OUFmU05UTUYrbkxCUWk3Z2xvc1FoUDZEbVRYRnl1S3J5MHg4NUlm?=
 =?utf-8?B?c2RDclFqSHc5eWxtWldoTEFxb3ZBQk56ZXl1YVYvYjRDc1QyMGovdjdNM3Ix?=
 =?utf-8?B?bTNNUUh4M29CUEFwSGovbVRFb1FreWM1RVZ0Z2pIQmt4Z1RnUTZmZjlCZEVp?=
 =?utf-8?B?RzdzT29DYzBkc3I5NWFzTjFONDJPZWF4K0JraU5naGhmQ213Y0lhMkdLYjBZ?=
 =?utf-8?B?cXV6cUJXQWFTZWhjb0FTSzVJZENNT0pSK3pDYVM5YzZVUEx4OUdxdmU0MnVY?=
 =?utf-8?B?bUtDcjdNRmFmY3gxMS9kK2laUXhkOXNZaTNHUzlXazYxaUtqL294N1FyM0M2?=
 =?utf-8?B?RVE0bnJ1V3VGd2VLTlF6SkhMZ3pQdldpcHVLdWVNeXYrUjFsTG1LV3k0Mkp2?=
 =?utf-8?B?UDBpenpMZHlMbFErRmpEb01xSzV2eFRZV3hTOXpnTEJoVmZWUXgvcUwvalZp?=
 =?utf-8?B?a0hxZVBwRTlKTXRpRVhPL3BRd1NvYlJSc0FReWZ6RTlzUUQva1g2ODVnbzA2?=
 =?utf-8?B?MjZoQlpxTHhoUHZpcTZDeWEzTTlZQXRSNTBqZUovMzR3cXZEcndBMzNOSG1L?=
 =?utf-8?B?SHFxL1pHbENDcThZZlVNdmU4TE81ekk1VlpNcGs0U0dsNlFsdjZteW1vN2RV?=
 =?utf-8?B?ZmVvbE9FdVNkS2MrN1RtcGh4OFhNdHhneHJGTVdpR2Nza21COHJ5ZUVFY3Ry?=
 =?utf-8?Q?ueiNicrD8kMbVwmiRQ1BWQ5H2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CED7F535B61F241861C81B3F89158AA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Z1JXMTdMZS9TL21ITGh4WHd5cEhPcGdialN1NW82V0VaZ0kvZGJCbXRtZDlR?=
 =?utf-8?B?M2x3UGFsd2lzbXNONXZqQ214STJ4NDVMZDcyS0VnZEtlUzdtTGhDY2tVWVBa?=
 =?utf-8?B?dkFhVkhxMC80N3V1cWptR0hiRGpMWWtpdXpmL29jbEZNS0xOMkEvQmNKZVZE?=
 =?utf-8?B?TGNONGZsYlMrNzUvL2swM2xlei9HYVpzc3laNjloL1MrSjVoQ1lqWmJzZ2JJ?=
 =?utf-8?B?aG5jYjFNUzkweEZHTlh6OCt0NmNtUndlaU9KVVFIOXRZTmdTMGcyME8veUVO?=
 =?utf-8?B?cDhzYk83ZzhpUE1oSFNQaFcxeVZ3OVp2UkJ3UUQ0N2FOb09FcVNYNW9PUWlr?=
 =?utf-8?B?SWxXRlo1SUg5cGV6d202VEFGZWVWUXBaeTNqT0JjYlN3ZVBKanlRbktCSytF?=
 =?utf-8?B?WEIyaXIzYlVabERyOHc2b2hGL2gvT0hoTmYvVU02YUl2amVjZEc2SzI3RXI1?=
 =?utf-8?B?MmNJYndUK3RiZzBtTlduQko1Vm9HKytvblp1eS9uZ0xlZm9lYjl3Ri82VEha?=
 =?utf-8?B?TzN0cnBUaUk5ektibjhxMGpTbGMwZWtESlRHeklwNTFzWUxJc1RDQ1RlT2p1?=
 =?utf-8?B?b2w5dGpFeWQ2bDMvSU40RTZ4NFRHSy9uV2pna1o2L1hKcGgxUnNleE8wNURu?=
 =?utf-8?B?N2tpRXNZcWhxQ0ZLY2RMU2pBaStMZHdjYkFjZnJaTWI3UjZ4YjZMM0NxcVlt?=
 =?utf-8?B?bEp4VHF5Q1M1eTJzZDl5YkRjMW1mM0tRc21GUGlsRWVVeEFZQkdiaCtGS1lY?=
 =?utf-8?B?Zit5SXlUaWE1anRQeHdNUmFRaUZWdkVSOGNNTlhyVDJyS1BGaFlOK0tZZVFp?=
 =?utf-8?B?WERHU3AzTk5nbDVhbCt6VndqSXcxcXZwbVdoWFdZbDBzSThkQ0NkZUJSSFNS?=
 =?utf-8?B?RjVwUHNVZmdQcUJqbHNjVGIyL2xkcm1NN1lzUm9Dc2JWWE0yRlFZdFc1R1JD?=
 =?utf-8?B?OXZUZ1gwQzZadkNYeDJQZnBNZGI0Y2hJRGZrQnF5Z09HUmc2dHFvbXp4eDJE?=
 =?utf-8?B?MHRTWjlndnZ4VTJyL0ZRWld0UVIycGlRblI1dFVvaHpQaFpSMHdBa2pwQWJC?=
 =?utf-8?B?VnMxN3RBSGhOY0orRzhzc3ZYQ041akhXa1BXMWljczdJVTdDRjVGZ1VvSVIr?=
 =?utf-8?B?emtidG5kWDBIY3FacThHZ1EwM3JOajlnRlRWSlhObU4rb2ZaRVdhaG00RGJR?=
 =?utf-8?B?Sjh5ZDhBZjNtL2tOWVY4UjI0NzRBdTFaYloybnpEbkgxL0JjdlJXRTR4djRZ?=
 =?utf-8?B?VWxJL2x4MWUwYjdCQkhTRU51cXF6LzZRWVhVanI3cUJSYTlWazY4UUZ3VHM4?=
 =?utf-8?Q?qzKzLouJhdQFk=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0f0ff9-2513-4c50-539e-08db572f78f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 23:36:00.7670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTFufZU4Ose1kBGUUJo5e2llkNDzjErXR4k8Wt1cmU12EN+F1OrtQhBLHwoAa0Lk5eUCabHwI92E5I+1bIi9pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747
X-Proofpoint-GUID: MqHVGJ-VxOYRaYs0sVbpoddhuXp3tP5x
X-Proofpoint-ORIG-GUID: MqHVGJ-VxOYRaYs0sVbpoddhuXp3tP5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=607 adultscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305170193
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UmVkaXJlY3QgIlRvOiIgRGFuIGFuZCBMYXVyZW50Lg0KDQpPbiBNb24sIE1heSAxNSwgMjAyMywg
QXZpY2hhbCBSYWtlc2ggd3JvdGU6DQo+IE9uIE1vbiwgTWF5IDE1LCAyMDIzIGF0IDU6MjnigK9Q
TSBBdmljaGFsIFJha2VzaCA8YXJha2VzaEBnb29nbGUuY29tPiB3cm90ZToNCj4gDQo+ID4NCj4g
PiBUTDtEUjogTmFpdmVseSBxdWV1ZWluZyB1cCAwLWxlbmd0aCByZXF1ZXN0cyBhcyBmYXN0IGFz
IHBvc3NpYmxlIGhhcyB0aGUNCj4gPiBjb25zZXF1ZW5jZSBvZiBkZWxheWluZyB0aGUgZW50aXJl
IHN0cmVhbSBieSB+OG1zLCBidXQgZG9lcyBub3Qgc2VlbSB0byBiZQ0KPiA+IGRlbGF5aW5nIGZy
YW1lcyBpbmRpdmlkdWFsbHkgYW55IG1vcmUgdGhhbiBiZWZvcmUuIENoYW5naW5nIHRoZSBudW1i
ZXIgb2YNCj4gPiAwLWxlbmd0aCByZXF1ZXN0cyBoYXMgdmVyeSBsaXR0bGUgY29uc2VxdWVuY2Ug
b24gdGhlIHN0cmVhbSwgYnV0IGluY3JlYXNlcw0KPiA+IHRoZSBjaGFuY2VzIG9mIG1pc3NlZCBJ
U09Dcy4NCj4gPg0KPiANCj4gRGFuIGFuZCBMYXVyZW50LCBjb3VsZCB5b3UgcmV2aWV3DQo+IGh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy8yMDIzMDUw
ODIzMTEwMy4xNjIxMzc1LTEtYXJha2VzaEBnb29nbGUuY29tL19fOyEhQTRGMlI5R19wZyFhSEtr
bl8wejhWOGtRTXNTdG5DWWNyUkZvU1hHcXZHVG9lR3hlN2YteE95Wlh6RFdMT1BUaTFDZkFWSE84
UHZuR2NoMUxJVzVJVU55ZndFc1lJTjUkICB3aGVuDQo+IHlvdSBnZXQgdGhlIGNoYW5jZT8NCj4g
DQo+IFRoYW5rIHlvdSENCj4gQXZp
