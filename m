Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A166E6D03
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 21:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjDRTkN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 15:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232531AbjDRTkL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 15:40:11 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA1786B6
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 12:40:08 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33IHQwm4017727;
        Tue, 18 Apr 2023 12:40:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=kAG+xp4O8wR73oHXW72dtlse5P3SipBgdCt+Hc5foaQ=;
 b=BiBOMCm27LXsNdiHZS1VZjsAPLrK2Thnxyu1SWLjNISylTCpLDn/9gWv5owBON+s+WOM
 Yt8zbagmetaZzHbrWphPGbsSphbigoTPxVN8URFa0JEEzWKDbkvlxcG3PP0wQmCsGe8M
 nAL5PFKqnLWWLq1VQ9GhEphGgWaOWnYOH7FcdKt4xf48liYjGdRXhXHYA7hp4sKKsVOs
 +v2JgRo3dWQoCleO/7uS53WiOeVy0NZeeYDZldbys8FKsm673YV6AEZz0QeP8DOcwOsB
 F25/utgdSUgAQi4ZRheZsoRxcCkFuvG4MY9S8fwXGqany7wiYbZFhntz9O06Vu6BSsqj Rw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pytxnd5ch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Apr 2023 12:40:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681846801; bh=kAG+xp4O8wR73oHXW72dtlse5P3SipBgdCt+Hc5foaQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lfSXIFJunDAqccx75t/27f//qAgMK5DxeCHdC0lCbnf98vM/Sj4QCBy4/hoAkci9p
         Yv4YSGaZQ5frgv5LeXNcrlBAXzdoXP1z4px07+WClZSfFAVkfwR5bkJit02zmx0doP
         hmfEgdW9F+Y50VG/GWsmzQetEf81rvP8uBcv8NcHMqbvTM3FtTIJ2oeu2vmr6aKbto
         Q4h0ndbn12/hXDCsGkSWjInEb9EMsSAgHG/EZ3dJKG4rVetTsbtMeQoJvPit9HlvjF
         rbwQMHLY0xto8k0HbOmpY7kVGuKbel2F1i/bBAtn4UCT5WDWRKNROiF5gEjEOnds3w
         zs1VBiVRPnXKg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC83840A7F;
        Tue, 18 Apr 2023 19:40:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (unknown [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 04169A007F;
        Tue, 18 Apr 2023 19:39:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TEHqUyFW;
        dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 409A940DCE;
        Tue, 18 Apr 2023 19:39:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5pGnxWQbmW7bSyqjRGd1+PskI8TQCCd6HgzIs5DR8lGdAqxgzEm64SRpVk5HQvRAdIGf5mrugZcWgR3NNp0/0z5HVTugAJfw5tk9hAOVAjVkwlBPSWL3P4jELPEHmSf3NvLCx8sjKbyo9Y96l5/hVJnNFxOZi7xOZReOmPcKEq2zOyGfqe9nZjfg/uZsfiLlM1ByPAiUMd3EwK4Z/DzNKd83WmJAs6eVl8T7vgQdEuknZXnmQWrmqigpRcTvpi8cfVYv22FgkGFOxXiLm9tzP/t6wzG/1ToZ0/w9CkkOMOv3kbQtLU1pwG4Ml1WvmEKB/mw3rgEJWWEC5ewOzinvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAG+xp4O8wR73oHXW72dtlse5P3SipBgdCt+Hc5foaQ=;
 b=ToLzKdZZSpmVMKxuBhQ8HZqm32VlWdJuDVAGzMO1BJwGHYcxcKdPQC/Gf5x3/MSfytqx4Dnar3iwM0WVEOy0f9sU3ngvyLrQFyv3LW+68A6juePZTwqg45PhMYzwnaHjpMHkm62dhRLF+pMYk5waog39ykA8wHKVxiYOBIfciwAv22Jn22OS778IteYhL69AL16inE7eRvxGZw5QnM0xwgFVq+EqKfh5/65MNBGzEnudkT5xUAc3hS85DfCG4SfZo6PkCuKrjn63Q3mK0JDYmKhrgB+IRb7XhcSs6+tFTx/6+r1Jg73JXj80ykJZsUkmw81/6KnfPDlnPNBZCgRyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAG+xp4O8wR73oHXW72dtlse5P3SipBgdCt+Hc5foaQ=;
 b=TEHqUyFWPm038SdIhE8MzRKZu9KPCKWLdyDyov0tOdgxyHFxaxeN2Ubabv70EaIUumwZFBvnzSF/MBwk3BAVZStjUdIYGT+MLmrtkRKj+ZYIPphMcLGMLUEaSifoSGdafgseDq3ePPI7uPKfnogGlHakULttb0+ebmdf7aKeUio=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH0PR12MB7960.namprd12.prod.outlook.com (2603:10b6:510:287::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 19:39:56 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 19:39:56 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4A=
Date:   Tue, 18 Apr 2023 19:39:55 +0000
Message-ID: <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
In-Reply-To: <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH0PR12MB7960:EE_
x-ms-office365-filtering-correlation-id: a6c23ac1-ef95-4bd3-90dd-08db4044afff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3qpeVhOSovPpVgrLb/i/A+xROFV7obpptu1wF78qQ3tLW22KUtu+jEVd0TsyxMGgWZULibswNMisj0Xbp4MqzZKbiyw1ZhClCwmJ1FumsrmdqwyBZgvzN8NwqHlybseNyvoIUl7Yr4xXcJzsbdym1h0Ohak73HnLOHOeOBB+7R57bTZh4jHCJZgNU6RQk95miT8di+AwR4mws87ACXFZb9HcOoe2GfcqYlgDnUHeCkheEpgwEOJqcN3RqPlVO8aiVaPBF2Lir2lEKqhVlML/0YZ9EWmDG48t1GTo/RNuPgmdakiIGQ0ukowRWrGrmFh5O8A6ZZm3Wtm+SNrO/WoJgMwHc8nsqaGPmrDskbGaGzaZ4fLclrc6k6+7Hyid8aqCueDW479XSC0dPrkQnFyH62nhFj6Pizr4AKdKl/0kCaUxQYCSBHL8wQVMV8LPZH04AumCxWcpZ2n3cl9JkgG4olnDl3zaGYDcNhCRnEz4bLMsmCWYNnsGJgk3sferFDf6BDKeU771d86SrwAOiAQbrU3UNJbp+Faddv+SOK8DdXpoENCPe4ZSCD0Pjf9KhuMzPmUcQSyK/s+ngwvbjTlfF48TfbW4XsNz9wy3UPYnK4PF19d7PT1U4PQSMI6oIuyYNRG9rtA23F6Wl75TSHABig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199021)(64756008)(4326008)(478600001)(38100700002)(71200400001)(8936002)(8676002)(316002)(41300700001)(6916009)(66476007)(66556008)(66946007)(76116006)(66446008)(122000001)(54906003)(186003)(36756003)(2906002)(53546011)(38070700005)(1076003)(6512007)(26005)(6506007)(86362001)(83380400001)(2616005)(5660300002)(966005)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cm9NNldmTVc2REdLUGttNFBzbnBGWG81aSt6VUc5MWRydVJFeHM2V2o3RWZL?=
 =?utf-8?B?ZEJvVzMxcGVUa1JpTk5KRWc5UVhiaVYrMStHWEhqTWhCdHdTeW5OMEg1NXk0?=
 =?utf-8?B?b3kxKzVIUlZRdlhValJYSDBOQyt3UWJaWVkwQVc1RmlleHlTaEF4TldsaFkr?=
 =?utf-8?B?ZlpJaDFibFh6TEFWdjBudUZqanZLa2svT292ZmYyUzNScEhMRmE0cERaY28r?=
 =?utf-8?B?ZFpncTFPU3dzVEZyZDBkV1BpN24ydjgzSWVwN2xrOExzYlh1Z09HeHNvS05z?=
 =?utf-8?B?cmwwMldWYXc2bHVwZVJCZGh5b1R3VGhEamdzUTNiWS9zSkJhUlpHaUNVTWIw?=
 =?utf-8?B?T1BHc3c1ODNOaVJJMElNOTJjTHpVNFJ6MUR5L3I2MlI1VjZETEN1QW0zSHNn?=
 =?utf-8?B?ODV6YVF3ZFVaUkkzN2tEc0oxQ1dKWUNuZCtBT004TDQ3bUthaDJjZndBVDRN?=
 =?utf-8?B?cUpzQVpCMVVzdklDTDN0TkZFajBRVXpJVGdWaXFabWF1U1p3NWZORCtNSmU4?=
 =?utf-8?B?a0RoYVcrWSt6ZEFFOGpBbUNENjl4dVV1bFh2UDlsY1pDdjZ4ZlFxUFZGU0NB?=
 =?utf-8?B?ekhFVk9PTlhWdS9tU29CK0Q2dE1yTGlObHlzbkZsSkx2T0VnREN5ZVBUVEM3?=
 =?utf-8?B?eG55aWRiOHcwWU9TTXlnU25sVTVTTGlsSHpCY1pyOXVPV3RkVVhpTnlHKzE1?=
 =?utf-8?B?N1JKWHE0NXIvRWNCbVdwM0h3QlRLM1d6NUZGWnNoODl1Y0xha0xHZEJUUnor?=
 =?utf-8?B?RHJ6cnpPNUpSeTlLZmxidWh6UnFZSS9NcTZzejhldG5UME1kYklZQW0rMEZj?=
 =?utf-8?B?M2xGS1l2THpnL3lRK2l6VmxHRTZDNU4wZE0rNThwQVFta0pDSCsxUUhlM0Zs?=
 =?utf-8?B?NkZJY001SGNQV0hrREdKTm5PT3dyZ1cyN0pWUTN5YU54dEpjdzAzQVFlTytE?=
 =?utf-8?B?bzlCMk5EYmF5djk4YjFpcHM3M21HazFEYngyTmpsaWFrYUJXNWU2UzlsYTBP?=
 =?utf-8?B?M1FYZVdjaDRCSTQ5VjVRSDBZTVBBMUJvNzF5TGZpdTRWSG9HZTZ5ckN5MUhu?=
 =?utf-8?B?cTQydjIvTUM3S3FMME1xVk1HcXpoNzljVmxlUTBkZ2Rvb3VxdVJCVUo3OUI5?=
 =?utf-8?B?RWpuV0tncG55SllTNWRoMU44ZVdodlo0VHVnY2hXRGpWQ1RTSzVUN3dqSzhz?=
 =?utf-8?B?bjVwR2ozM2d5UXJQd0dpWmdrZ1lVZ2tJemFnUUFwUTJkT2Q4NlVqLy8xdmpx?=
 =?utf-8?B?MklrNVVRY0NiUVd4NUpqRHhvZUZiLzJmc2xkOVpJZWVjd1lYSlZsOFVRaVlj?=
 =?utf-8?B?Y0pZRC9mSkZrOGZWT3Iza2lYbDYwQjRMaHdzMmdHUGRmcFExUE55Qnl1TDBV?=
 =?utf-8?B?dUZjNWZqTmhZNE93Qzd4bW95THRqWXVVVW1QL0dId2Y5dUc1MWo5cmZ2NVlw?=
 =?utf-8?B?Nm41NjN1QlUxbmpwZHRQT1VxQ2V1OS9TK29ERlo5QW56N0phd1BYUHdJYWM4?=
 =?utf-8?B?K0N1a2NXTkNoWittOHFBcFpLQWtWNkpydFNpa3JoYTBRa1BKSmswTjNNTHZm?=
 =?utf-8?B?cG9PK0E0dmN1b2Y5ekRhVFJjdXFkdGNNbndqUkdOT0tmZHY1eFkxUDR5NFZj?=
 =?utf-8?B?ZkQ3YUg2VWtpWG1MUXFBbE92Wll2UUhkZUZHWkhvUjJDTlhEM2hCN3JscWhv?=
 =?utf-8?B?aEhJYzZHbHA1ZTUzNGFEMEJHYU9VdHM5Nkh6ZjlhTVM2eGc1eSsyOTBCeURF?=
 =?utf-8?B?WEhPWTI5a3o5dEg0MGh6TUVxaXdrUWkwSHh4R2NyQXY1d3NCako2RStLcmY1?=
 =?utf-8?B?MW5vaGJWQlI2c0R4U282NUxKcDlVeGhiVldMSWtwYTRZMHVaVnUwUXl3N25u?=
 =?utf-8?B?VVp6cXdnQjJhZTBQZU1wS2hlakcxeDduRmIxK1JEdkx1TFBSYzMyVzBhVFZR?=
 =?utf-8?B?UlVZc2IzMzkwbmp1c05NTlpDTG8vc2dnN1BDc210Y1lhL3JaTFdkTENnalhi?=
 =?utf-8?B?eGU2SlJrOXN4cnRiUzhCNytIeTNwOGdQRW9lcms3alNYbHRXYjNCWlN3cWpv?=
 =?utf-8?B?b3lXbEdoZ1BYVlRiZGQwZmxOQm1uREZQeEtLS2o4c0VHamlhU01Oby9hMDZW?=
 =?utf-8?Q?Ucho6yYrNHHsiK1NoRYsurklQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64E35A545CE91D4290D9A6E51BD3D392@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Q2t5QTYvZ2VSbC9FclA0bExPbmw1TXlCMFpEVVRLT1VYUnNEQ1B4WDlRQ3pX?=
 =?utf-8?B?bE9MUmExaThMUC9JcWltOXRBK3BXaC9vUXVtRUcxcEpITmxiWXkxNlJDWEJm?=
 =?utf-8?B?SXBIUEYvMi9GVWtrUElXTkxvSVdvVmc4ZWhWeXVDbTUxRGUyd2JSYm9NYVF2?=
 =?utf-8?B?MjNlR1JPVldsRHZEMjBFRzNzSUdNL0FhenRmNWxxSjdwbzBQbkRRZDI0T2t2?=
 =?utf-8?B?bmpHMGUyOVE3d3djOWFWN0NmSW1SeTRXYkVuTGoxYWhrZzBiTGpRY2VFY3dQ?=
 =?utf-8?B?aGVQTVZaTVBrWkxsTTRTSFNzYXZxRk0wb2JRbjRyaktTby8rT05KU2NTMldr?=
 =?utf-8?B?TEgxTTFCT2ZpMWt6WXlCUyt2SlVWV3hXOWpYWEJ5bUI4SXBhUEM4a242c211?=
 =?utf-8?B?LzA5MlE2NkdPamoyREdVekt5c0NnRnNmSy85RzRyRWczSkx6WEpObDRJZ0N4?=
 =?utf-8?B?TnlHRTlUNkE1c3kyalVMeE1JQ1FET0YrS1AwMDNRL1RxTFNRYVFacmVaZVIw?=
 =?utf-8?B?dUVMME1TT1o4a29Lc1NnTlJFa3YrcXJ0YTRtM212NmhEcWRCRUZGcTJ3S2FV?=
 =?utf-8?B?elVIUnhNVHpQRWE3Z1laNVJ2MGx5Q1ZpNHdsZkNseXIrNS8vWW9pV1Vsektl?=
 =?utf-8?B?WXhFUVhsUkpGdWtYM3RCOGhNU0QwZEpPb2RuRVF2Q1Yzd28vNEFuTzdIRUF3?=
 =?utf-8?B?SERjUGZmZXVLcGtBWHVzbWtzdEtnSDkzVTZMOU01aEFIaDh1ZzFCMWI0dGdP?=
 =?utf-8?B?OTBNMjF3MkQ4ZVhMV3piZ2hOUEU4aXkzeUVYLy9yL3BBSEpYallJejA1VThm?=
 =?utf-8?B?UjBETU5MUThxbFkyVG4rdFVZbURVdjVRNTFsa1J3bkhuZkRTcVRaWmtKdEJQ?=
 =?utf-8?B?eHhwSjVtNzZhYWtyTW1GeTBrMldjeU9NeUxsWkoxNUtBTStJUW12TFp2OHdz?=
 =?utf-8?B?OTFXd2pTWnA0K1dQMlBxWXRnZHBudUl0N0wvTzhQb0tlNnZZb3JiaUpONE9F?=
 =?utf-8?B?UHZ6by90R0hYdDkyM0hTSkppdVNrWkdRcmRZTU9NUDZvdUJlUC9Rb1JqdWhr?=
 =?utf-8?B?Ui92SC9uZUY4d1ZhUzBGMDZuQmtuQmxOSDhRb3R4dDNtQ042VnhxeWJUcHU3?=
 =?utf-8?B?clRlMmhsalh1VEJJSEtlNUpQK1NHUGFCd3VsM2NpYUxDQm5ZOTdZMUVSb0hW?=
 =?utf-8?B?cTRuWGVnbFRhdjVtWGZ0ZFlRQk91WEVEUElwWWNYeTNHdUNuVTVSUDhSNlZw?=
 =?utf-8?Q?t4t86VrzhX6zP42?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c23ac1-ef95-4bd3-90dd-08db4044afff
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 19:39:55.7517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xFZdoV2zLJYdVCDlr/8lPswcV8WrPr3RbUCgY4LGV4tOQaF58agi0NEkYgiNaiD87Fa35HC+NoBLTPSDrSUv0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7960
X-Proofpoint-ORIG-GUID: LUBmlWWr5d3PjRdUVqhNA0gtp8WpkuGM
X-Proofpoint-GUID: LUBmlWWr5d3PjRdUVqhNA0gtp8WpkuGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_14,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304180162
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCBBcHIgMTcsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiBPbiBNb24sIEFw
ciAxNywgMjAyMyBhdCA3OjQ54oCvUE0gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3Bz
eXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IE9uIE1vbiwgQXByIDE3LCAyMDIzLCBBdmljaGFsIFJh
a2VzaCB3cm90ZToNCj4gPiA+DQo+ID4gPiBPbiA0LzE3LzIzIDA2OjQ5LCBHcmVnIEtIIHdyb3Rl
Og0KPiA+ID4gPiBPbiBGcmksIEFwciAxNCwgMjAyMyBhdCAwMjowMzowMlBNIC0wNzAwLCBBdmlj
aGFsIFJha2VzaCB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4+IFRoaXMgcHJvYmxlbSBtYXkgYmUg
ZnVydGhlciBleGFnZ2VyYXRlZCBieSB0aGUgRFdDMyBjb250cm9sbGVyIGRyaXZlcg0KPiA+ID4g
Pj4gKHdoaWNoIGlzIHdoYXQgbXkgZGV2aWNlIGhhcykgbm90IHNldHRpbmcgdGhlIElNSSBmbGFn
IHdoZW4NCj4gPiA+ID4+IG5vX2ludGVycnVwdCBmbGFnIGlzIHNldA0KPiA+ID4gPj4gKGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY2VkMzM2
Yzg0NDM0NTcxMzQwYzA3OTk0ZTM2NjdhMGVlMjg0ZmVmZS4xNjY2NzM1NDUxLmdpdC5UaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tLyk/X187ISFBNEYyUjlHX3BnIWZCMGtyVVg2cXNPWHJCc09Iekxz
dFZGV3FUTEw5bmN3R0ZYeGx4SzBlZWRMWV8yOVhkd2pYUnRiTy1FV3YxZVg1b2tOMXJPZUJac3Ba
MjFLU2I1YiQNCj4gPiA+ID4+IFVWQyBHYWRnZXQgRHJpdmVyIHNldHMgdGhlIG5vX2ludGVycnVw
dCBmbGFnIGZvciB+My80IG9mIGl0cyBxdWV1ZWQNCj4gPiA+ID4+IHVzYl9yZXF1ZXN0LCBzbyBh
biBJU09DIGZhaWx1cmUgbWF5IG5vdCBpbW1lZGlhdGVseSBpbnRlcnJ1cHQgdGhlIFVWQw0KPiA+
ID4gPj4gZ2FkZ2V0IGRyaXZlciwgbGVhdmluZyBtb3JlIHRpbWUgZm9yIHRoZSBmcmFtZSB0byBm
aW5pc2ggZW5jb2RpbmcuDQo+ID4gPiA+Pg0KPiA+ID4gPj4gSSBjb3VsZG4ndCBmaW5kIGFueSBj
b25jcmV0ZSBlcnJvciBoYW5kbGluZyBydWxlcyBpbiB0aGUgVVZDIHNwZWNzLCBzbw0KPiA+ID4g
Pj4gSSBhbSBub3Qgc3VyZSB3aGF0IHRoZSBwcm9wZXIgc29sdXRpb24gaGVyZSBpcy4gVG8gdHJ5
IG91dCwgSSBjcmVhdGVkDQo+ID4gPiA+PiBhIHBhdGNoIChhdHRhY2hlZCBiZWxvdykgdGhhdCBk
ZXF1ZXVlcyBhbGwgcXVldWVkIHVzYl9yZXF1ZXN0cyBmcm9tDQo+ID4gPiA+PiB0aGUgZW5kcG9p
bnQgaW4gY2FzZSBvZiBhbiBJU09DIGZhaWx1cmUgYW5kIGNsZWFycyB0aGUgdXZjIGJ1ZmZlcg0K
PiA+ID4gPj4gcXVldWUuIFRoaXMgZWxpbWluYXRlZCB0aGUgcGFydGlhbCBmcmFtZXMgd2l0aCBu
byBwZXJjZWl2YWJsZSBmcmFtZQ0KPiA+ID4gPj4gZHJvcHMuDQo+ID4gPiA+Pg0KPiA+ID4gPj4g
U28gbXkgcXVlc3Rpb25zIGhlcmUgYXJlOg0KPiA+ID4gPj4gMS4gSXMgdGhpcyBhIGtub3duIGlz
c3VlLCBhbmQgaWYgc28gYXJlIHRoZXJlIHdvcmthcm91bmRzIGZvciBpdD8NCj4gPiA+ID4+IDIu
IElmIHRoZSBhbnN3ZXIgdG8gYWJvdmUgaXMgIk5vIiwgZG9lcyB0aGUgZXhwbGFuYXRpb24gYW5k
IG1pdGlnYXRpb24NCj4gPiA+ID4+IHNlZW0gcmVhc29uYWJsZT8NCj4gPiA+ID4+DQo+ID4gPiA+
PiBQYXRjaCBmb2xsb3dzIChtb3N0bHkgZm9yIGlsbHVzdHJhdGlvbiwgSSBjYW4gZm9ybWFsaXpl
IGl0IGlmDQo+ID4gPiA+PiBuZWVkZWQhKS4gSXQgYWRkcyBhIG5ldyAncmVxX2luZmxpZ2h0JyBs
aXN0IHRvIHRyYWNrIHF1ZXVlZA0KPiA+ID4gPj4gdXNiX3JlcXVlc3RzIHRoYXQgaGF2ZSBub3Qg
YmVlbiBnaXZlbiBiYWNrIHRvIHRoZSBnYWRnZXQgZHJpdmVyIGFuZA0KPiA+ID4gPj4gZHJvcHMg
YWxsIHRoZSBxdWV1ZWQgcmVxdWVzdHMgaW4gY2FzZSBvZiBhbiBJU09DIGZhaWx1cmUuIFRoZSBv
dGhlcg0KPiA+ID4gPj4gY2hhbmdlcyBhcmUgZm9yIHRoZSBleHRyYSBib29ra2VlcGluZyByZXF1
aXJlZCB0byBoYW5kbGUgZHJvcHBpbmcgYWxsDQo+ID4gPiA+PiBmcmFtZXMuIEkgaGF2ZW4ndCBi
ZWVuIGFibGUgdG8gY29uZmlybSBpdCwgYnV0IGFzIGZhciBhcyBJIGNhbiB0ZWxsDQo+ID4gPiA+
PiB0aGUgaXNzdWUgZXhpc3RzIGF0IFRvVCBhcyB3ZWxsLg0KPiA+ID4gPj4NCj4gPg0KPiA+IFBl
cmhhcHMgdGhpcyBjb252ZXJzYXRpb24gd2l0aCBKZWZmIG1heSBleHBsYWluIHRoZSBpc3N1ZXMg
eW91IG9ic2VydmVkOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMjEwMjExNjQzNDkuZmZ0NHlxbnh1enRzcWRldUBzeW5vcHN5
cy5jb20vX187ISFBNEYyUjlHX3BnIWVLM1Z5QXE3dlg3MHZBLVdKTEE2X2JQTWJaRngwbjMzd0gz
OUpJdEh6d0NOVnFLU2tOMmFHMGl6RjBHWlBXcVl4a2dMLWZOaW5XbElXNzFIYkdHQyQgDQo+ID4N
Cj4gPiBUbyBzdW1tYXJpemVkIHRoZSBsb25nIGNvbnZlcnNhdGlvbiwgdGhlIFVWQyBuZWVkcyB0
byBtYWludGFpbiBhDQo+ID4gY29uc3RhbnQgcXVldWUgb2YgdXNiIHJlcXVlc3RzLiBFYWNoIHJl
cXVlc3QgaXMgc2NoZWR1bGVkIGZvciBhIHNwZWNpZmljDQo+ID4gaW50ZXJ2YWwuIElmIHRoZSBV
VkMgY291bGRuJ3Qga2VlcCB1cCBmZWVkaW5nIHJlcXVlc3RzIHRvIHRoZQ0KPiA+IGNvbnRyb2xs
ZXIsIHRoZW4gd2Ugd2lsbCBoYXZlIHN0YWxlIHJlcXVlc3RzIGFuZCBtaXNzZWQgaXNvYy4NCj4g
Pg0KPiA+IEZyb20gdGhlIGRpc2N1c3Npb24gYW5kIHJldmlldywgdGhlIFVWQyBjb3VsZG4ndCBx
dWV1ZSByZXF1ZXN0cyBmYXN0DQo+ID4gZW5vdWdoLiBUaGUgcHJvYmxlbSBpcyBleGFjZXJiYXRl
ZCB3aGVuIHlvdSByZWR1Y2UgdGhlIGludGVycnVwdA0KPiA+IGZyZXF1ZW5jeSB3aXRoIG5vX2lu
dGVycnVwdCBzZXR0aW5nLiBUaGUgZHdjMyBkcml2ZXIgaGFzIHNvbWUgYmFzaWMNCj4gPiBtZWNo
YW5pc20gdG8gZGV0ZWN0IGZvciB1bmRlcnJ1biBieSBjaGVja2luZyBpZiB0aGUgcXVldWUgaXMg
ZW1wdHksIGJ1dA0KPiA+IHRoYXQncyBub3QgZW5vdWdoIHRvIHdvcmthcm91bmQgaXQuDQo+ID4N
Cj4gPiBZb3VyIHN1Z2dlc3Rpb24gdG8gZGVxdWV1ZSB0aGUgcmVxdWVzdCB3b3VsZCBtZWFuIHRo
ZSBjb250cm9sbGVyIGRyaXZlcg0KPiA+IHdpbGwgcmVzY2hlZHVsZSB0aGUgaXNvYyB0cmFuc2Zl
ciBhZ2Fpbiwgd2hpY2ggcmVzY2hlZHVsZSB0aGUgbmV4dA0KPiA+IHJlcXVlc3QgZm9yIGEgbmV3
IGludGVydmFsIChwb3RlbnRpYWxseSBhdm9pZCBiZWluZyBzdGFsZSkuIFRoYXQncyBmaW5lLA0K
PiA+IGJ1dCB0aGF0IG1heSBub3QgYmUgYSBncmVhdCBzb2x1dGlvbiBiZWNhdXNlIHdlJ3JlIHN0
aWxsIHBsYXlpbmcgY2F0Y2gNCj4gPiB1cCBhbmQgdGhlIG1pc3NlZCBpc29jIGFscmVhZHkgaGFw
cGVuZWQuDQo+ID4NCj4gPiBZb3UgbWF5IHRyeSB0byBkbyB0aGUgZm9sbG93aW5ncyB0byBtaXRp
Z2F0ZSB0aGlzIGlzc3VlOg0KPiA+IDEpIE1ha2Ugc3VyZSBVVkMgdG8gb25seSBxdWV1aW5nIHJh
dGUgaXMgY29uc3RhbnQuIFBlcmhhcHMgcXVldWUgZHVtbXkNCj4gPiAgICByZXF1ZXN0cyBpbiBi
ZXR3ZWVuIHRpbWUgZ2FwcyBpZiBuZWVkIGJlPw0KPiA+DQo+IFRoaXMgaXMgZXh0cmVtZWx5IGhl
bHBmdWwsIHRoYW5rIHlvdSEgSSBoYXZlIGEgc29tZXdoYXQgYmFzaWMNCj4gcXVlc3Rpb246IEZv
ciBhbiBpc29jIHJlcXVlc3QsIGlzIGl0cyAiZnJlc2huZXNzIiBkZXRlcm1pbmVkIGZyb20gdGhl
DQo+IHRpbWUgYXQgd2hpY2ggdXNiX2VwX3F1ZXVlIGlzIGNhbGxlZCwgb3IgZnJvbSB0aGUgdGlt
ZSBhdCB3aGljaCB0aGUNCj4gcHJldmlvdXMgcmVxdWVzdCB3YXMgdHJhbnNmZXJyZWQgdG8gdGhl
IGhvc3Q/IElmIHRoZSAiZnJlc2huZXNzIiBpcw0KPiBkZXRlcm1pbmVkIGZyb20gdGhlIHRpbWUg
J3VzYl9lcF9yZXF1ZXN0JyB3YXMgY2FsbGVkLCBJIHdvbmRlciBpZiB0aGUNCj4gInVuZGVycnVu
IiBpcyBhcnRpZmljaWFsIGJlY2F1c2UgVVZDIEdhZGdldCBkcml2ZXIgcHVtcHMgYWxsIGZyZWUN
Cj4gdXNiX3JlcXVlc3RzIGF0IG9uY2UsIGFuZCB0aGVuIHdhaXRzIGFyb3VuZCBkb2luZyBub3Ro
aW5nIHdoaWxlIHRoZQ0KPiB1c2JfcmVxdWVzdHMgZ2V0IHN0YWxlIGluIHRoZSBjb250cm9sbGVy
J3MgcXVldWUuIEluIHRoaXMgY2FzZSwganVzdA0KPiBzbG93aW5nIHRoZSBlbmNvZGUgbG9vcCB0
byB3YWl0IGEgbGl0dGxlIGJlZm9yZSBxdWV1aW5nIG1vcmUgcmVxdWVzdHMNCj4gc2hvdWxkIGRv
IGVmZmVjdGl2ZWx5IHdoYXQgeW91IHN1Z2dlc3QgYWJvdmU/DQo+IA0KDQpIZXJlJ3MgYSBzaW1w
bGlmaWVkIHZlcnNpb24gb2YgaG93IGl0IHdvcmtzOg0KKE5vdGUgdGhhdCBJJ2xsIGJlIHRhbGtp
bmcvdXNpbmcgdXNiIHJlcXVlc3QgYXMgaWYgaXQncyBUUkJzIGFuZCBhbHNvDQppZ25vcmUgU0cu
IEkgd2lsbCBhbHNvIG9ubHkgZm9jdXMgYWJvdXQgdGhlIGN1cnJlbnQgaGFuZGxpbmcgb2YgdGhl
DQpnYWRnZXQgZHJpdmVyIGFuZCBkd2MzIGRyaXZlci4pDQoNClRoZSBjb250cm9sbGVyIHRyYWNr
cyB0aGUgY3VycmVudCB1ZnJhbWUuIEZvciBpc29jIGVuZHBvaW50LCB3aGVuIHlvdQ0KY2FsbCB1
c2JfZXBfcXVldWUoKSwgdGhlIGNvbnRyb2xsZXIgZG9lc24ndCBjb25zdW1lIHRoZSByZXF1ZXN0
IHJpZ2h0DQphd2F5LiBUaGUgcmVxdWVzdCBpcyBzY2hlZHVsZWQgZm9yIGEgc3BlY2lmaWMgaW50
ZXJ2YWwuIEZvciBVVkMsIGFuDQppbnRlcnZhbCBpcyBhIHNpbmdsZSB1ZnJhbWUgKDEyNXVzKS4g
QXMgdGhlIGN1cnJlbnQgdWZyYW1lIGtlZXBzDQppbmNyZW1lbnRpbmcsIGVhY2ggcmVxdWVzdCBv
biBhIHF1ZXVlIGlzIGNvbnN1bWVkLiBJZiB0aGVyZSdzIG5vIHJlcXVlc3QNCmF2YWlsYWJsZSBm
b3IgdGhlIGN1cnJlbnQgdWZyYW1lLCB0aGUgbmV4dCBxdWV1ZWQgcmVxdWVzdCBpcyBjb25zaWRl
cmVkDQpzdGFsZSBvciBleHBpcmVkLiBUaGlzIGNhc2UgaXMgY29uc2lkZXJlZCB1bmRlcnJ1bi4N
Cg0KImZyZXNobmVzcyIgbWVhbnMgdGhlIHJlcXVlc3QgaXMgc2NoZWR1bGVkIGZvciBhIGZ1dHVy
ZSB1ZnJhbWUuICJzdGFsZSINCm1lYW5zIHRoZSByZXF1ZXN0IGlzIHF1ZXVlZCBmb3IgYSBwYXN0
IHVmcmFtZS4gSXNvYyBkYXRhIGlzIHRpbWUNCnNlbnNpdGl2ZS4gU28gaWYgdGhlIGRhdGEgaXNu
J3QgZ29uZSBvdXQgYXQgYSBzcGVjaWZpYyB0aW1lLCB0aGVuIGl0J3MNCmRyb3BwZWQuDQoNClRo
ZSBwcm9ibGVtIHdpdGggbWFueSBnYWRnZXQgZHJpdmVycyB0aGF0IHVzZSBpc29jIGVuZHBvaW50
IGlzIHRoYXQgdGhleQ0Kb25seSBxdWV1ZSBtb3JlIHJlcXVlc3RzIHdoZW4gdGhleSBnZXQgbm90
aWZpZWQgdGhhdCB0aGUgcHJldmlvdXMgc2V0IG9mDQpyZXF1ZXN0cyBhcmUgY29tcGxldGVkLiBU
aGlzIGNyZWF0ZXMgdGltZSBnYXBzIHdoaWNoIGNhbiBzdGFydmUgdGhlDQpjb250cm9sbGVyIG9m
IG1vcmUgcmVxdWVzdHMuDQoNCldlIGhhdmUgc29tZSBiYXNpYyBtZWNoYW5pc20gaW4gZHdjMyB0
byByZXNjaGVkdWxlIG5ldyByZXF1ZXN0cyB3aGVuDQp0aGVyZSdzIG1pc3NlZCBpc29jIGFuZCB0
aGUgcXVldWUgaXMgZW1wdHkgZm9yIFVWQy4gSG93ZXZlciB0aGF0J3Mgbm90DQplbm91Z2guIFRo
ZSB0aW1lIHRoZSBjb250cm9sbGVyIGNvbnN1bWVzIHRoZSByZXF1ZXN0IGFuZCB0aGUgdGltZSB0
aGUNCmRyaXZlciBoYW5kbGVzIHRoZSBpbnRlcnJ1cHQgaXMgZGlmZmVyZW50LiBUaGUgZHJpdmVy
IG1heSBub3Qga25vdyB0aGF0DQpxdWV1ZSBpcyBlbXB0eSB1bnRpbCBpdCdzIGFscmVhZHkgdG9v
IGxhdGUuIFRoZSBnYWRnZXQgZHJpdmVyIGp1c3QgbmVlZHMNCnRvIG1ha2Ugc3VyZSB0byBrZWVw
IHRoZSByZXF1ZXN0IHF1ZXVlIHRvIGF0IGxlYXN0IFggYW1vdW50IG9mIHJlcXVlc3RzLg0KTm90
ZSB0aGF0IDEyNXVzIGlzIHJlbGF0aXZlbHkgZmFzdC4NCg0KTm90ZSB0aGF0IHRoaXMgdGFsa2lu
ZyBwb2ludCBpcyBhc3N1bWluZyB0aGF0IHRoZSBVVkMgaG9zdCBiZWhhdmluZw0KcHJvcGVybHkg
YW5kIHBvbGwgZm9yIGRhdGEgZXZlcnkgdWZyYW1lLiBJZiBub3QsIGl0J3MgYSBkaWZmZXJlbnQg
aXNzdWUuDQoNCj4gPiAyKSBFbmhhbmNlIGR3YzMgdG8gZGV0ZWN0IHVuZGVycnVuIGZyb20gVVZD
IG9uIHJlcXVlc3QgcXVldWUuIGllLiBJZiB0aGUNCj4gPiAgICBxdWV1ZSBpcyBlbXB0eSBhbmQg
YSBuZXcgcmVxdWVzdCBpcyBxdWV1ZSwgcmVzY2hlZHVsZSB0aGUgaXNvYyB0cmFuc2Zlci4NCj4g
PiAgICBUaGlzIHdpbGwgYnJlYWsgc29tZSBvdGhlciBkZXZpY2VzIGlmIHRpbWUgZ3VhcmFudGVl
IGlzIHJlcXVpcmVkLiBTbw0KPiA+ICAgIHBlcmhhcHMgYW4gYWRkaXRpb25hbCBmbGFnIGlzIG5l
ZWRlZCBmb3IgdGhpcyBjaGFuZ2Ugb2YgYmVoYXZpb3IuDQo+ID4NCj4gDQo+IEkgYW0gbm90IGFz
IGZhbWlsaWFyIHdpdGggdGhlIERXQzMsIGJ1dCBqdXN0IHRvIGNsYXJpZnk6IElzIHlvdXINCj4g
c3VnZ2VzdGlvbiB0byByZXNjaGVkdWxlIHRoZSBzdGFsZSByZXF1ZXN0cyBpZiB0aGUgY29udHJv
bGxlcidzIHNlbmQNCj4gcXVldWUgaXMgZW1wdHkgKHVuZGVycnVuKSBhbmQgdGhlIFVWQyBnYWRn
ZXQgZHJpdmVyIHF1ZXVlcyBhIG5ldw0KPiByZXF1ZXN0PyBEZXBlbmRpbmcgb24gaG93IG1hbnkg
c3RhbGUgcmVxdWVzdHMgdGhlcmUgYXJlLCB3b3VsZCB0aGF0DQo+IHJ1biB0aGUgcmlzayBvZiB0
aW1pbmcgb3V0IHRoZSBuZXcgcmVxdWVzdCBhcyB3ZWxsPw0KPiANCg0KTm8sIHJlc2NoZWR1bGlu
ZyBoZXJlIG1lYW5zIGFsbCB0aGUgcXVldWVkIHJlcXVlc3RzIHdpbGwgYmUgc2NoZWR1bGVkDQpm
b3IgYSBuZXcgZnV0dXJlIHVmcmFtZS4gQnV0IGFsc28gbm90ZSB0aGF0IHRoZSBxdWV1ZSBlbXB0
eSBjaGVjayBpcw0KaW5zdWZmaWNpZW50IGFzIGV4cGxhaW5lZCBhYm92ZS4gU28gdGhpcyB3b3Vs
ZCBvbmx5IG1pdGlnYXRlIHRoZSBpc3N1ZS4NCg0KQlIsDQpUaGluaA==
