Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E8E6E83F0
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 23:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjDSVty (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 17:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjDSVtw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 17:49:52 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D045F44A7
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 14:49:51 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33JGSGBi020506;
        Wed, 19 Apr 2023 14:49:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=ZCMDdaQcvzGmkBtVSOYx22f2MhGvXC+//uuV1e4cliQ=;
 b=NinBgTBsVdz/IE46sCCMT4wsutlCiJprQoUBIoAdtvnAxRxWAdlco8GdymGAkAjqiaB0
 uxJZr725exYn5RG0trCdod7ir0kALk6DztUbnxwurwDP+U7JUvMDiynIG3cuy5rhN2mm
 lBP8dUkwLBpq8Wq5FzlPLqzHZfR3CT1uBPKk/ad4vkIY5H6fOQOdU/yQ5s1iLwezO3ga
 dPlIfrjAnW7+XvGFPwXDocYF7TWpYcNy8D9Kncq3WTz0NXI0f1PyYnn30QKZsFyXhqjm
 EFjlc0hM6dfmsTidMDz1AKXtmyMKPrT1+eetgJNPWx2xtYFoU771CAgozjBKCUKohZAu 3A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pyu66bqjr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 14:49:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681940984; bh=ZCMDdaQcvzGmkBtVSOYx22f2MhGvXC+//uuV1e4cliQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=d1H5lMJ22AdVfWikxCiTG8RPshL39rBn85o0Ro99woQknsXenbUtX5eURtqQHbdje
         UNJK1RXbgenkMr2cmZUnxuTyVCsGvlsdnqEA4xQkAapnwAVV3qV9+qgQv26n2u5Lo3
         rmcAvElZtmu5dKnqIPK6dEB0jn01aktlT0rTDH82HdSFqaoP5dc/qCp+rU4G4cnk+5
         3Y+jF4HsCdYXvneAYo20BSoWO0ZArWI0lbKdpwFihGQJlhZWLcBCpmauFu2pd68eeY
         dZUe6+2l7CHVYszBxreyCzQxAXfihl9tFOZiVcsso6Q06ykI8Zf4p+vUXUdZElgnFq
         Ht+UT05A992ww==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4897240756;
        Wed, 19 Apr 2023 21:49:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 53679A00BD;
        Wed, 19 Apr 2023 21:49:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gBdz++54;
        dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7E542404D6;
        Wed, 19 Apr 2023 21:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9eauMChSTqC8LI8vnDu5MNHLv5yR8/qyjJpkxHO+dsuACbXK+WR01eAx4bWvmraBUrDNh1TuT92kYUL6C88yuV8KxKqAp85wu/lCNTBRDLdq2s1MFOpJR+60/gsVW8zIorzzg0TRroA03LRAG+SRxnwZL/WEVVZTjiS6Sq4NzYqparMPUp7iRAfNdE4sv6gQrFFuLA3X9rrGIVh/0mhhz1+DWwufhpJfF8nwyP2Jql1XGOjA8eFbEF12iNCFNwB5PAp3N1uuslZpKadWjkzkz1/xSyA30gEw6gm5x/Ahg0N8N7kCK9SaRjSOZcRj+IASFCv+Bd6lVTLhNExsjPUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCMDdaQcvzGmkBtVSOYx22f2MhGvXC+//uuV1e4cliQ=;
 b=htjsBk9W3IKeTZx7AlEPAN0ruwuo7OV1NKuluMkG57W9/zn0T8eajFY6ztftBwB9U4IXfj9m3aopR1U20Q7YAVgZIcNMmuAOP4bNdMiuk1Rys818lOAWPu11DR1GrnYEw97NAS+0trJiYUhU6heKmW0cItCZbMfv6xbuDqKpeOYuVPPNbNcuyRgRKVX5vRH4h4anR2dttxhSF6oXVrbKIoAV9CX76j6dvMJhLc8OqV0Ix7APglnpmgP0tjbCEuTX3oi+O07s8UEcM6XdQ0OwW1eZAhIkmG3xV+C96zwkY922mLksJtWmPgBdXia5h7cYVaX0//IDhL9nncDAmGloEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCMDdaQcvzGmkBtVSOYx22f2MhGvXC+//uuV1e4cliQ=;
 b=gBdz++54Jmma39GGsGcGbaAtLdickE0w/8RRkC26NT/S9biwMEMMziFL8VbLCZPQyB5mfoGXynOf5DcLU53KAYuSUSu7O+mSu5YVXx2vUihkonZxlYUQJnosfwFY59opmOWB/ZYlwY3r6aawc/AZ6PMMhgQgFogS83feJtwV0xI=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 21:49:36 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::a6ef:a9e2:ad28:f5cf]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::a6ef:a9e2:ad28:f5cf%7]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 21:49:36 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAARK9gA==
Date:   Wed, 19 Apr 2023 21:49:35 +0000
Message-ID: <20230419214931.ckjgowyqyzqs2x4j@synopsys.com>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
In-Reply-To: <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|DM4PR12MB6541:EE_
x-ms-office365-filtering-correlation-id: 8d169573-8036-4339-bc18-08db411ff79a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z1/55D2KIa8f6viEjoso7QAz7rWOf9ZINO2yUa832u79WN4f7teEv4GqTWq2fEJQdcaqxPQLx7TAoTuHOQhk8VxcPNpvlKvzMkDJS7KTJRvLdq1Jb5RqeM5HNDsFdEZrAjWTV7mPtnStxFK0pcS1Q6R5teEEgWg3tGsdznLCUrjr6lew1S0pg6FHSgFKOuT5+00JwpBVS+TgB3KtssMQkrd9Djo+1h6V5U+yT17wpiSDAVLjEr6jjxjIBwXs5igacY0XbK7JBCR6Z6bkV4sxQM+6yWat+BVGtDW8jAbg1yOvMXocAQql1zw1Tmtm7nGPI/ZNHjnpv7WzbR91uuq+xZPOK+qtMW1ynwtVsMxZ0A9LFBg5TbiaEUpGRC+z/1aDCf2bLT7J4ralj8XkpsbzPEVpiDpPyHFTjCMRh88fnqR5eMCOP1+JJpLlpnVFOb9+99IdkS1o10FmOkIzkCiTgXJKC6uoogltD005q4HWjQ0PnipOvoWPzFtQFnnsiFO9nHu7LaVTkH0HBwDOtd5dzmCA1BuQ4Tx3SDPar0POMdX/yYeM+GqcKi5WnrIeHbBajXLR66eRTXD6aCV+ZwcMfrTf+PQMwBC8YUty9Gh33g2Rhz6OOPlNnLrA6RQ+HwFj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(66899021)(4326008)(1076003)(26005)(6506007)(6916009)(186003)(316002)(53546011)(6512007)(8676002)(8936002)(36756003)(86362001)(2906002)(5660300002)(91956017)(478600001)(54906003)(64756008)(41300700001)(83380400001)(2616005)(66446008)(38070700005)(122000001)(38100700002)(66556008)(66476007)(6486002)(76116006)(71200400001)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFMzUXYzMFFkck0xcmgxMzg5b0kwWHpMU0pVWkE1VEdwTnN1L2szQUtTeEVN?=
 =?utf-8?B?L2laMEZxYVBKSG1EcXVqMjdjcFQzVCtwd3FEUkxRaHZRUk5ZWFN2ZUl5SXlF?=
 =?utf-8?B?R0RWak8wbEN1MkFmOEo4NjVxUjRvZFBOMW1ScjVTRmpzZkM3UHN4N2NhcUNF?=
 =?utf-8?B?NDVWdmlrREMzRUNnUTdWWk82OUZXazU5VDBlT2o0Sk9EeG5qTlBiYUtWQkI0?=
 =?utf-8?B?cU9Dc3Q3UDNyWFFFREpaMndicTFjMnlLYW1iVEJ6Umljam5CV2F2eVN0MlZq?=
 =?utf-8?B?UXVUUDBQTU0zY1lHUERIcWpGRS9GUEVoaVVNQ2NidW8zV0FxR0s5SmhIYUM1?=
 =?utf-8?B?L1hTMnNMd0lEMTN2SUt6RXpHUWlPNzF5N0RTRnpxRUtLcmtaWHh2WHdadjBy?=
 =?utf-8?B?RjRUL2hUSVl5bWhWK1VZTmtKU1grZm4rZERBd01iM1lhKzlxWVVFaFZtemFz?=
 =?utf-8?B?WmowZzFreFc3eDRHaTl3Sit2ME4vbGJoUmpXRlZ3N1lCRWEvTkZZdmd6dFNv?=
 =?utf-8?B?WVY4SXNZZG1QRnltM21KT2dYSURtSmE4Wmx1bUNtejYxZUZhVktKQTJvQWZp?=
 =?utf-8?B?MEliN2lPVnZmd3dhOEhUMTdxYVFDTVZncElPS1dkVmZVYU1FbzhCVm55TjhE?=
 =?utf-8?B?TWx3eG83UDJLc3ZQTGtRZHhWR0lRRUVNNGxHMmlWa2JHRjBUdDU0WmxrSFBv?=
 =?utf-8?B?c3hMa29EemNycmFublh3TmdsKy9lTWlwaVEzODVXK2lCR0ZyWUN3S3A5RE5l?=
 =?utf-8?B?OFMrVitpanlaaHY4VS9OMEhaR0ZTaHZUcFZXbTEzclplRUYwMUFnc0QwYTNE?=
 =?utf-8?B?S2xSQTZOS1oxclkyWmhPb29VajV3d25XNVJJeU9OWFYyRlU5NVhNZWVLRHNr?=
 =?utf-8?B?WUEvS2FSVHhlMnhXdkpvdXdMNGpEV0dMNkVHa2E2b2FrQ2RpT0gwekNYM3ZO?=
 =?utf-8?B?bHlIUy9aKzRuVktMZEx2UVlSbjVtUm5iOEVNNmc1TVJaZ1Y4OE1LMzN1SVli?=
 =?utf-8?B?ZHAraDR4TERBVzF5NWlrZ2gyN3g2YU1vdE5NS3J6ODliM0o5MTR3YVh0NXha?=
 =?utf-8?B?WWMxc01kQTZLbTRCQ0ZtcVNqdSs1eFp3U0NKTTBIRUN4ZFVFbzNyWHJrUHlP?=
 =?utf-8?B?V0JFNTFTbmg2NW5FNCtVZWZoZlkyeU95ZFg3QnBWMmo2Y2E0M1Rpa2tVV0NQ?=
 =?utf-8?B?b25Vb1FPeHhDT0tERnBMZ0hSUCtPRXZGTytjVHBibk9OWThJTzlidEFodGhl?=
 =?utf-8?B?SVdLSTJ2emljUXFScmFvRTFYTUhCRGFweFZ3TDNaMDBLc25RVXpqUUI1R2E2?=
 =?utf-8?B?TmNLaHJHSEhCbzc1allITzdTdnRPTkdoRmlsWXB2VDNQQ05WVXlmM3BhSUpp?=
 =?utf-8?B?bWpPQTdKMFNlQ0UwRkFJSElBcHdtWERoTk9KVUtNRGNsdkwzc3hPMkpta1dx?=
 =?utf-8?B?N1ppcU1ibnJpRFU1c2NFdzEyZFNCMHh0L2VzNlk2YkRYNVlnMEludEFyMU15?=
 =?utf-8?B?c1JWV0tqZGVvaXp3VHkxVjNBSnpGKy9xcmJucWJtRTdYLzhKMEhVZ3pYL3Nk?=
 =?utf-8?B?RWs4UkFnT29DaGlzK3c1M01vWXRlcE5GR0hrVDFpdndDdUdDdWtUZDFlaGZS?=
 =?utf-8?B?WitJdGpCRVR3NlgxdEo0QWtMVUlGcE9FWnZxbysyZFRMUFNaVzVxaXFuMVB3?=
 =?utf-8?B?dHpRTzE3R2xxZk9EVzJETXo4M29KNzFKRDBNSkh4akJta0xtWGcvMjVtajhu?=
 =?utf-8?B?cWVMRVJpd3dtWFhjd0w0UXoyT3dqRWN4MHVpVEwyb1lCSDVnWkJESDI5Kzh2?=
 =?utf-8?B?b0N1THZjd2xxWllvWEJpM2tuSGpRZXF1eW1zVllkR25CQVNETDZFTHFwM3Ux?=
 =?utf-8?B?d0pMWUpobTdpU0wyMGFhOURQL0lnM1RvbUFZa0VuZkozVzR4ejlJNFY4WVRI?=
 =?utf-8?B?eGwwdTEzSXg4Vk45amsvclRQM2xkcTNxbm9pOEdPSC9ZR1czN3U1TWtUOStp?=
 =?utf-8?B?d09tcEQ2VnB2SUVnb2w1eVp5Yk95cHh2OEZscEVHV2V1aTZ0TlFTZytNRFNw?=
 =?utf-8?B?RWZEbmFVOGZ3dENoSE5obUdzT2hjNTdPZ3pBYVZiWHJYYXFMQm9HVGgrd05n?=
 =?utf-8?Q?7T6J4FMe7L2ol3CyWIsmowyLs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63F274AF6DEF0A4FBB3CF0394CE258A1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?OHhOVnppWG85MTdobkc5d0lBUjV2OXQwcStTNVR1WkVIaGNXMU53VjJRQks0?=
 =?utf-8?B?RmY4ODhzaFQ1VjJaVHBySlVuaEV6ZWRMN1RCQWhrNzNuLzBWMG4vRFJsbHA3?=
 =?utf-8?B?ZFNJR2Z6cXJzdXBXSTR0d0pMbnl3U0hwdHIybEFLN25aaFIyeHZGMVUyL2JV?=
 =?utf-8?B?TmcwNG1abUcza0Q2MFJNbk56MmZnbkxDa0s3SVlYZTNhWGQzSEhiZ0x5WGFY?=
 =?utf-8?B?SWttaWsrdTI4NTFLbHhrWlBZVXlicVNwZGozUnZpZ0EzUk5GVDNYVnc4WmNr?=
 =?utf-8?B?R0xXRVd4eFlmSG9qMXUvMHRSNUtDL0dMbm5rTlBsWFRZQnZNeUlZN2x1Vzha?=
 =?utf-8?B?YzFHZExzbWJ1cDBXN1BlaFlBaXJuNDUrUmVSbml0R0NZL3NqR3MvSCtTUVdU?=
 =?utf-8?B?dElKUkk1TUxCRy85Y1FGWjRNbFlyWkZLZ3QrSVFnMXhGWjNUak10SStMRVFT?=
 =?utf-8?B?UFVYSXVTd0h3ZmF0c1BoZTF3R3hXb1I1UnJjOVZGcE9EZHFvZFlUU0hndzJu?=
 =?utf-8?B?SW5kQWVya0RpNGpCMzNIK1hhMW84cTJLVGFsazBGL0xnajJCN3FmNi9KamRY?=
 =?utf-8?B?d2ZXaE1IaXFHNDU1cTl6a0VRZkpCaDV5b2JvNUJKSEJSaXExTTI5cUdsakhx?=
 =?utf-8?B?Y2c1cDZ1ajFpbERRcFRuaWs2T2JUVmdBNDVzL1QzWHNHeUwvd3lSOWlDem05?=
 =?utf-8?B?KzI0T2hXcDBhbDdKRkcwTitrbzltSXUrdjhlalppR01nMFhaZGNKYmJKZGpC?=
 =?utf-8?B?cE9CUGRFcWdQUEVxNVpCaDljazAzbENqUWdJUDRjZmZsZEZ6VTZqU0k4U1BX?=
 =?utf-8?B?UDhsTjhwdWJsWm5NNFFkU3pFVm05Mk40RWtEdVErc3EwQzl2NDhyRVQxRUxs?=
 =?utf-8?B?dHN4cjBQendlYW9JbXB5cXlOMFhDR2d5T2dpSTcwWnhVZkphYXloSEdsck0w?=
 =?utf-8?B?c3RtNFgrZ0Y2T1Uwcmhjcyt3UW1YZ3lTencvc1o5ZG84OFd2M2orNGJnUk56?=
 =?utf-8?B?NmErYnhCaTNXNjIyRjJaQWFhNDNZc1l5QXR5ZEJIeHFMcFlITlNPT3dDNjN3?=
 =?utf-8?B?cllzeXUyOFZtQk14Qi9VcEh4bHA2MDljYW5BNkVQc2loYTNnc0liMlFSRU15?=
 =?utf-8?B?TkhwL2NMQ1BJcG1IcDlxc05yR2JnbWpIZW8zOFlUWDJiS2ptU0tOc3RtVXEv?=
 =?utf-8?B?aDdtV0NkM3VPbVNUYVRhenQ3MVljK0RMUWZVMzRPcmZRZHJHV0xOVDRCRHpK?=
 =?utf-8?B?U2NWV0xqd3k4R0IyVU5LUHhjaitXZnYzU2xtMkl3QUR4WUNVNzlwd2V2dncx?=
 =?utf-8?Q?dPh5dzMVkphcI=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d169573-8036-4339-bc18-08db411ff79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 21:49:35.6658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ky6oo7L/LChUfbF5pxqPYWHd77ZEpUduJIcF57Fj8io1+BZNfUEo9t/xkQBf6yAHGhoyDZF2RnrDfdPowxSGww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541
X-Proofpoint-ORIG-GUID: _ev-SoSsQrOZBK6tHuRvYLzi5vSqig_L
X-Proofpoint-GUID: _ev-SoSsQrOZBK6tHuRvYLzi5vSqig_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_14,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304190188
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBBcHIgMTgsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiBPbiBUdWUsIEFw
ciAxOCwgMjAyMyBhdCA2OjA34oCvUE0gQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5oYXJ2YXJk
LmVkdT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBUdWUsIEFwciAxOCwgMjAyMyBhdCAwMzo0NTo1M1BN
IC0wNzAwLCBBdmljaGFsIFJha2VzaCB3cm90ZToNCj4gPiA+IEkgc2VlLCBhbmQgSSB0aGluayBJ
IHVuZGVyc3RhbmQgR3JlZydzIHByZXZpb3VzIGNvbW1lbnQgYmV0dGVyIGFzDQo+ID4gPiB3ZWxs
OiBUaGUgVVZDIGRyaXZlciBpc24ndCBmYWxsaW5nIGJlaGluZCBvbiB0aGUgdmlkZW8gc3RyZWFt
LCBpdCBpcw0KPiA+ID4gZmFsbGluZyBiZWhpbmQgdGhlIHVzYiBjb250cm9sbGVyJ3MgbW9ub3Rv
bmljIGlzb2Mgc3RyZWFtLg0KPiA+ID4NCj4gPiA+IEZyb20gd2hhdCBJIGNhbiBzZWUsIHRoaXMg
bGVhdmVzIHVzIGluIGFuIGludGVyZXN0aW5nIHBsYWNlOiBVVkMNCj4gPiA+IGFsbG93cyB0aGUg
aG9zdCB0byBjb25maWd1cmUgdGhlIGNhbWVyYSdzIG91dHB1dCByZXNvbHV0aW9uIGFuZCBmcHMs
DQo+ID4gPiB3aGljaCBlZmZlY3RpdmVseSBjb250cm9scyBob3cgZmFzdCB0aGUgY2FtZXJhIGlz
IGdlbmVyYXRpbmcgZGF0YS4NCj4gPiA+IFRoaXMgaXMgYXQgb2RkcyB3aXRoIHRoZSBVVkMgZ2Fk
Z2V0IGRyaXZlciwgd2hpY2ggY3VycmVudGx5IHBhY2tzIGVhY2gNCj4gPiA+IHZpZGVvIGZyYW1l
IGludG8gYXMgZmV3IHVzYl9yZXF1ZXN0cyBhcyBwb3NzaWJsZSAodXNpbmcgdGhlIGZ1bGwNCj4g
PiA+IGF2YWlsYWJsZSBzaXplIGluIHVzYl9yZXF1ZXN0cykuIEVmZmVjdGl2ZWx5LCB0aGUgVVZD
IGdhZGdldCBkcml2ZXINCj4gPiA+IGF0dGVtcHRzIHRvIHVzZSB0aGUgImZ1bGwiIGJhbmR3aWR0
aCBvZiBpc29jIHRyYW5zZmVycyBldmVuIHdoZW4gdGhlDQo+ID4gPiBjYW1lcmEgaXNuJ3QgZ2Vu
ZXJhdGluZyBkYXRhIGZhc3QgZW5vdWdoLiBGb3IgZXhhbXBsZSwgaW4gbXkNCj4gPiA+IG9ic2Vy
dmF0aW9uczogMSB2aWRlbyBmcmFtZSBpcyB+MjJrQi4gQXQgMzBmcHMsIHRoaXMgcmVwcmVzZW50
cyAxLzMwDQo+ID4gPiBvZiB0aGUgYW1vdW50IG9mIGRhdGEgdGhlIGNhbWVyYSB3b3VsZCBnZW5l
cmF0ZSBpbiBhIHNlY29uZC4gVGhpcyAyMmtCDQo+ID4gPiBpcyBzcGxpdCBpbnRvIDggdXNiX3Jl
cXVlc3RzIHdoaWNoIGlzIGFib3V0IDEvMTAwMCB0aGUgbnVtYmVyIG9mDQo+ID4gPiByZXF1ZXN0
cyBVVkMgZHJpdmVyIG5lZWRzIHRvIGdlbmVyYXRlIHBlciBzZWNvbmQgdG8gcHJldmVudCBpc29j
DQo+ID4gPiBmYWlsdXJlcyAoYXNzdW1pbmcgMTI1dXMgbW9ub3RvbmljIHVmcmFtZXMpLiBBc3N1
bWluZyBzb21lIGZ1ZGdlDQo+ID4gPiBmYWN0b3IgZnJvbSB0aGUgc2ltcGxpZmljYXRpb25zIGlu
IHlvdXIgZXhwbGFuYXRpb24gZ2l2ZXMgdGhlIHV2Yw0KPiA+ID4gZHJpdmVyIHNvbWUgZXh0cmEg
bGVld2F5IHdpdGggcmVxdWVzdCBxdWV1aW5nLCB3ZSdyZSBzdGlsbCByb3VnaGx5IHR3bw0KPiA+
ID4gb3JkZXIgb2YgbWFnbml0dWRlcyBvdXQgb2Ygc3luYy4gRXZlbiB3aXRoIHBlcmZlY3QgJ2Nv
bXBsZXRlJw0KPiA+ID4gY2FsbGJhY2tzIGFuZCB2aWRlbyBmcmFtZSBlbmNvZGluZ3MsIGFuIHVu
ZGVycnVuIHNlZW1zIGluZXZpdGFibGUuDQo+ID4gPiBEYXRhIGlzIGJlaW5nIGdlbmVyYXRlZCBh
dCBhIGZhciBzbG93ZXIgcmF0ZSB0aGFuIGl0IGlzIGJlaW5nDQo+ID4gPiB0cmFuc2ZlcnJlZC4g
RG9lcyB0aGlzIHJlYXNvbmluZyBzZWVtIHZhbGlkPw0KPiA+ID4NCj4gPiA+IEp1c3QgYXMgYSB0
ZXN0IEknbGwgdHJ5IHVwZGF0aW5nIHRoZSBVVkMgZHJpdmVyIHRvIGNvbnN1bWUgMjY2DQo+ID4g
PiB1c2JfcmVxdWVzdHMgcGVyIHZpZGVvIGZyYW1lICh+MS8zMCBvZiA4MDAwKSwgd2hpY2ggc2hv
dWxkIGJlIGVub3VnaA0KPiA+ID4gdG8ga2VlcCB0aGUgdXNiIGNvbnRyb2xsZXIgcXVldWUgb2Nj
dXBpZWQgZm9yIH4xLzMwcy4gSWRlYWxseSwgYnkgdGhlDQo+ID4gPiB0aW1lIHRoZSBjb250cm9s
bGVyIHF1ZXVlIGlzIGVtcHR5LCB0aGUgY2FtZXJhIHdvdWxkIGhhdmUgcHJvZHVjZWQgYQ0KPiA+
ID4gbmV3IGZyYW1lLiBUaGlzIGRvZXNuJ3Qgc29sdmUgdGhlIGlzc3VlIHdpdGggbGF0ZW5jaWVz
IGFyb3VuZCBjYWxsYmFjaw0KPiA+ID4gYW5kIGFuIGlzb2MgZmFpbHVyZSBtaWdodCBzdGlsbCBo
YXBwZW4sIGhvcGVmdWxseSB0aGUgZmFpbHVyZQ0KPiA+ID4gZnJlcXVlbmN5IGlzIHJlZHVjZWQg
YmVjYXVzZSBVVkMgcXVldWVzIGVub3VnaCByZXF1ZXN0cyBwZXIgdmlkZW8NCj4gPiA+IGZyYW1l
IHRvIG5vdCBzdGFydmUgdGhlIGNvbnRyb2xsZXIncyBxdWV1ZSB3aGlsZSB3YWl0aW5nIG9uIGEg
bmV3DQo+ID4gPiBmcmFtZSBhbmQgdGhlIG9ubHkgd2F5IHRoZXkgZ28gb3V0IG9mIHN5bmMgaXMg
ZnJvbSAnY29tcGxldGUnIGNhbGxiYWNrDQo+ID4gPiB0aW1pbmdzLiBJIGFtIGFzc3VtaW5nIHRo
aXMgaGFzIGJlZW4gdHJpZWQgYmVmb3JlLCBidXQgbXkgTEtNTCBzZWFyY2gNCj4gPiA+IHNraWxs
cyBhcmUgZmFpbGluZyBhbmQgSSBjYW4ndCBmaW5kIG11Y2ggb24gaXQuDQo+ID4NCj4gPiBOb3Rl
IHRoYXQgdGhlcmUncyBub3RoaW5nIHdyb25nIHdpdGggc3VibWl0dGluZyBhIDAtbGVuZ3RoIGlz
b2Nocm9ub3VzDQo+ID4gdHJhbnNmZXIuICBJZiB0aGVyZSdzIG5vIGRhdGEgbGVmdCBidXQgeW91
IHN0aWxsIG5lZWQgdG8gc2VuZA0KPiA+IF9zb21ldGhpbmdfIGluIG9yZGVyIHRvIGZpbGwgb3V0
IHRoZSByZW1haW5pbmcgc2xvdHMgaW4gdGhlIGNvbnRyb2xsZXIncw0KPiA+IHNjaGVkdWxlLCB0
aGlzIGlzIGEgZ29vZCB3YXkgdG8gZG8gaXQuDQo+ID4NCj4gT2gsIHRoaXMgaXMgdmVyeSBnb29k
IHRvIGtub3csIHRoYW5rIHlvdSEhIFdlIGp1c3QgbmVlZCB0byByZWFjaCBhDQo+IHN0ZWFkeSBz
dGF0ZSBvZiBVVkMgcXVldWluZyBlbm91Z2ggcmVxdWVzdHMgbW9ub3RvbmljYWxseSAoZXZlbiBp
Zg0KPiB0aGV5IGFyZSBlbXB0eSksIGFuZCB0aGUgdXNiIGNvbnRyb2xsZXIgY2FsbGluZyB0aGUg
J2NvbXBsZXRlJw0KPiBjYWxsYmFjayB0byBnaXZlIGl0IG1vcmUgcmVxdWVzdHMgdG8gcXVldWUu
IEFsdGhvdWdoIEkgd29uZGVyIGhvdyB0aGUNCj4gaG9zdCdzIFVWQyBkcml2ZXIgd291bGQgaW50
ZXJwcmV0IHRoZSB6ZXJvIGxlbmd0aCBwYWNrZXRzLCBpZiBpdCB3b3VsZA0KPiBldmVuIGNhcmUu
DQoNCkJ5IHRoZSB1c2Igc3BlYywgZm9yIElOIGRpcmVjdGlvbiwgaWYgdGhlcmUncyBubyBkYXRh
IGF2YWlsYWJsZSBhbmQgdGhlDQpob3N0IHJlcXVlc3RzIGZvciBkYXRhLCB0aGVuIHRoZSBkZXZp
Y2Ugd2lsbCBzZW5kIGEgemVyby1sZW5ndGggZGF0YQ0KcGFja2V0LiBUaGlzIGlzIHdoYXQgdGhl
IGR3YzMgY29udHJvbGxlciB3aWxsIGRvLiBTbyByZWdhcmRsZXNzIHdoZXRoZXINCnlvdSBwcmVw
YXJlIGFuZCBxdWV1ZSBhIDAtbGVuZ3RoIHJlcXVlc3Qgb3Igbm90LCB0aGUgaG9zdCB3aWxsIHJl
Y2VpdmUNCml0Lg0KDQo+IA0KPiBJIGFtIHVuZm9ydHVuYXRlbHkgYmVpbmcgcHVsbGVkIGludG8g
c29tZSBvdGhlciB3b3JrIGZvciB0aGUgbmV4dCBmZXcNCj4gZGF5cywgYnV0IEkgd2lsbCB0cnkg
b3V0IGJvdGg6IHNwbGl0dGluZyBvbmUgZnJhbWUgaW50byBtYW55IG1hbnkNCj4gcmVxdWVzdHMg
YW5kIGp1c3Qgc2VuZGluZyAwIGxlbmd0aCByZXF1ZXN0cywgYW5kIHNlZSB3aGF0IGhhcHBlbnMg
b24NCj4gdGhlIGhvc3QuIFdpbGwgcmVwb3J0IGJhY2sgd2l0aCB3aGF0IEkgZmluZC4gQW55IG90
aGVyIGluc2lnaHRzIGFyZQ0KPiB3ZWxjb21lLiBJIHdhbnQgdG8gZml4IHRoaXMgcHJvYmxlbSBm
b3IgZ29vZCBpZiBwb3NzaWJsZSwgYW5kIGFtIGhhcHB5DQo+IHRvIHRyeSBvdXQgd2hhdGV2ZXIg
aXQgdGFrZXMhDQoNClRoYXQgd291bGQgYmUgZ3JlYXQuIFRoYW5rcy4NCg0KQlIsDQpUaGluaA==
