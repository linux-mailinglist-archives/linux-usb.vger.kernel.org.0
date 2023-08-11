Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F61D7795A0
	for <lists+linux-usb@lfdr.de>; Fri, 11 Aug 2023 19:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235284AbjHKRFa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Aug 2023 13:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236061AbjHKRF2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Aug 2023 13:05:28 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A70830DC
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 10:05:26 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37BDdhIw019673;
        Fri, 11 Aug 2023 10:05:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=vdvyZMHXoZci2KskI1LdDhcnn0zMjlt/DOpm3zZrZgw=;
 b=cdCGrRdY1fl8vUB50i2OkKZxFcMjP4xHXNhUv9GR7PCrpk2fft2SSf3UNoxETjw+MJzm
 wRQJ1kOZeczmn92K/oa2vsBAMp6ZjFESJ9CEHq04Em0Xxb6XiaJOdooQrpa5ivzMqG6X
 sQWb6pFumtsY2fpRBfcGrx8arwAH4HSv3/tSrtTjGcZg4Uq8HFlVUDbX8rFLmFbDqXSZ
 JUjfh6DwS+i2/DW9YVWBNz1f3ZE5++QUPvgz8OwSL1stGXXMGwMDT5HgeNLZF0XzMUi2
 UNkMJ9dnC6eInah5HqO2q9Wyj6xp6kXokd3nWTeyR0XKrPYonVoiLBAjulWFvplsqQHu ww== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3sd8yam2hn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 10:05:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1691773524; bh=vdvyZMHXoZci2KskI1LdDhcnn0zMjlt/DOpm3zZrZgw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lD/pX1lVsnxud7DH4Z2894n0A8xDuCG8M95HD2WkRmI9/IU33lFXwewZyFUNd3kpe
         hEJCN8X1UttM0bVKMxuSvpEDP8DxmsQ7YUAZXXaOjNmzAl0GtND0TefAu9zxLxJ6FQ
         UneEwcfWGh6U0z1zoFqbaAE91OuTU40ob1CmzirvHEz4xiNfzKIKKe2eTaDMqEUdaK
         pkcxp0VSPGI+dhwV7ZP+X7aBDmhMlg3lJGUeRNvfOdw6KJc7kj8CG9xu1xMoLvfzlJ
         jt8l8O49zbVaGqW0L1Yhi+Oyc3xR/yzdw3adO5+RwqjAK6krFPsU7oUJKmrDeEJzhT
         KdrjNMamaowBQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9A88A4035C;
        Fri, 11 Aug 2023 17:05:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 87888A0080;
        Fri, 11 Aug 2023 17:05:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=q76Rpefo;
        dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9E5504034E;
        Fri, 11 Aug 2023 17:05:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqL4LXp92hG/FDzeCY3Iy6ww/M8ou5RTsC/7XTRgjO9vRHsDJZsMCkdiApsRSiHMdwNdldQgQgNlAeSoh8ualyx3hTquWj/X6HttW8/3RUksYFn2zJ3JYLUdDoNGzQ7f/yYMuy8AY3AhkT70ZOwqGqMJKuOU0W/lr0qZf9qiGZMCs7t12YNN4GpY8fqyTsOxKbqjMwvFn3AsKILngNUHU5lpi9E9opdw968+fphNOKSnp0JJ7RtnEbvS5zPxcWtur0Oz+WHebU9F5O8RZv+Wx0aPwMcSECFO+fzqjqvNOjH/Exo5t3m2SA95S3sAuojps7B93CKsWHhwqZ6Nn/Zu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdvyZMHXoZci2KskI1LdDhcnn0zMjlt/DOpm3zZrZgw=;
 b=FwBjSmyRmte7iKfW6yOmzhbFxLgZQL0iAnPM+o4tsrb2gRP98aI/xrLTt62s8/2aPOJz2NbqmldmQLwXL8lHzgL+Unps1OU3nh5MJu6dFcAOI9azEbAf0Wuejk203bqB5VHzELdtUBgVwnUsricX4+2+fbNfFde647Gcks24lm0v5BHaorUncw4Pnro+3Jgz/22G9ekjc237LmYsdIFcfB5Xaba4jqL6wjgjsuLxp560lTKbjH9n8z49Z1lla9EjMVaGaC2gIc8ces54tuF6E2ek6OPxx29CVN9eyh3F067Chwfby/9JNMVBimir33MTgdu0ugbn69xhukWG6407Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdvyZMHXoZci2KskI1LdDhcnn0zMjlt/DOpm3zZrZgw=;
 b=q76Rpefo7N42D4SSLKDaODotfB4NBzKE9wIN0bFjx7m56tr7MQ4J+gUYDVdTLR51gj3oBmK3OonTHn4L3nt+anmfsluvh6lKPuieglqjfqUpxmcigdU5eD2eRc4Gf06T3gpRIAFIcT8NnoCzYfSj2+rSglN6MaI/2fI4pQ3i2SM=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CY8PR12MB8338.namprd12.prod.outlook.com (2603:10b6:930:7b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 17:05:12 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b18d:912e:908a:5952]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b18d:912e:908a:5952%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 17:05:12 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Thread-Topic: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Thread-Index: AQHZxwcxBbIIf0BjtUaoyoF9g1KO9q/itRGAgAAWDACAAPfSgIAAZg0AgAA2AgCAAP7gAA==
Date:   Fri, 11 Aug 2023 17:05:12 +0000
Message-ID: <20230811170500.xbjyzmcslvajs2qv@synopsys.com>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
 <e070f49d-9bd2-4711-b748-b15e1a6be901@rowland.harvard.edu>
 <c1a18876-c505-4d4f-9f58-264199135905@rowland.harvard.edu>
 <20230810223824.6kgawiwerwkaj6vh@synopsys.com>
 <3c63cad6-55ef-46dd-90b7-d19cbefedbea@rowland.harvard.edu>
In-Reply-To: <3c63cad6-55ef-46dd-90b7-d19cbefedbea@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CY8PR12MB8338:EE_
x-ms-office365-filtering-correlation-id: cf070a81-81c4-4eb9-e3c2-08db9a8d201a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hdadOWOxy4dNe6ww+Brvhv3xvPE9DE7NEOEznr9iKwqiSbDkjwHdA2DR08kIn9o5sApC69mHl5YlhYa9+UxAwo+Ig4Qq1azIUtrPB3IlmPM6Ms5jGgtjKtm1hnkUgC7KkRFWD6xsftvDmUaMYEEYl06nmd2wMKSOinkNXfG4a3MJDnCue/S9R0E1/1F8ocqruef1I+OGBYavkcbR/vxbo+iJKtRdzl5oGPjWZ4HlprS54TJ6sv294OAjC9wsV/rzTG62qGEdF9zqF0e496LV+OkG6MSaniK81I0c7uy4SEQUy40KTe6assk9SVmDxFo6fqSs4LmxS8e/nuLM+ZhuprefJHdxSIc2RMVdLSMwHxXzPWBom8jTGbquJPlRL1jOVEdRCD8/4lt1GMXjYBujYt9hkt7qTFFWzUJuQXmGkRzXj0oCM2zXtojuqR8ABmkgLFNp7ioumFWQXKq0jLhNviY20/wiIuSHIeHMD27m/9Pev4z264GFEpuO9eGlnGhp+0RZqWtDDnclo3wIB4DKRgidbdLq7SaPOFAmQ3ADnymRO9XHNNIOVbB7qeNpl+IiGbiq4Tdu1MHcJsy7MrzDnPlJ3CVNcycIM+Qzt3YEsKtObja96fxwRgc2EpLguWp+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(186006)(1800799006)(6512007)(478600001)(6486002)(54906003)(71200400001)(2906002)(1076003)(26005)(2616005)(4744005)(66556008)(66446008)(64756008)(5660300002)(66946007)(4326008)(6916009)(41300700001)(316002)(8936002)(8676002)(66476007)(76116006)(6506007)(86362001)(38070700005)(36756003)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azVHRnRIOFdMMFRLcC9xcDRhTlNLSDNyWSt2YndsYlo0dkxuS1U5bUs5eHFt?=
 =?utf-8?B?LzRlSzZlam1ueExid01Dd0V1TVFGeGJyWndIY0pHQ1p4YUEyMXQvRmRIR3Qy?=
 =?utf-8?B?cnZKaWh5S1NKU0dBaWZTQ0ZWUEpiLzVtMjVXQWFXWXhNdVY2MTZZT0kwRjdG?=
 =?utf-8?B?VC9kcEJBZE0wQXJoV08yNExHWFJCOXc3TG9nWS9wRVRoaHFVdEM3dTdPRDVD?=
 =?utf-8?B?VG5OWVZtYndycHY2MXFSclNQSDByOG44L0ZBRjBJVzhRSHF4TG9FVE53QmJi?=
 =?utf-8?B?K1ZJbFBXemtyMnEvbTY3b09DRk9rSDk1dU85TlNkeDRuMEEzMy9WalZ5bnM3?=
 =?utf-8?B?RzB1ZDFPa2dCc3Iyampvbjc1TTM0MldHbFozTDI2ZTlodzlGeEt0NCt4Mmtp?=
 =?utf-8?B?VzhzM3BEb3R3RGYvZkF6RXMwdTVIdnhIQmw5RXp3SzFKS1N2KzZFb05xSmxs?=
 =?utf-8?B?V0xvTGo5MVVHYUZYMlE3dHRiTHZIUTNQTmlpY01wQnB6QWFRU1dmcnVnemxv?=
 =?utf-8?B?aHhCc2MwbXpMWGJSdit1cy9iV1craVRCTnc4QmsvYUxXWkt5SzhKcTdTWDNY?=
 =?utf-8?B?UmszcGJQVThsaURQK0RDa290aUpwcU5LOS9xbE9EdlBVQUZUZ0crbTNxYW9q?=
 =?utf-8?B?MzZXRTlCWmxtZTZNNjV0U0wzWnZkSW5qdGVKT09oYzBhdVdEL0dGSENlQkdW?=
 =?utf-8?B?Z0pKbjJaR3M5cEdNYUIxc21wczJ4am1YUktML0hGcHdnYjhqams2U0NVM3cx?=
 =?utf-8?B?NVdIWVVLd0tHeFlNNFM5cWNUWTZDTWh2ZGljQ0tiVVJhVXN0K3pSRTkxSStu?=
 =?utf-8?B?SERuS0lCK1JsSVRaTmZjVzU5andGQmJHZkx0bEVuTEpLSE8rLzlZTjNzRUFD?=
 =?utf-8?B?bnc4SHhjMGlEUDVUNDVmNXZVclBGVkQzTVJGMzRyZjhnUTh5U0hxQVVKMVlD?=
 =?utf-8?B?ZmJWQUNQd1hFakVXbUlkZFh5a0w3c1JmSDBrRVRDL0gya09qZ3VyS2RkVkRL?=
 =?utf-8?B?ZHUyNzdhQWNQa1djZyt0TXFkYVNtVmpZT2ZIQ1FQK0FTVmw1YzVTbjUzN1VR?=
 =?utf-8?B?WFMxenJvMGZqWUhQajg1bGsvR2RuemdFOWdtMkcwbkpIVm1CSXN4TVhoMHd3?=
 =?utf-8?B?MmU0c04yL1NZK0NDc2k0SU9tbVA3aVNLQ1hLL0ZSOGZBSGw1eUsyS0RjeXdk?=
 =?utf-8?B?RGE3NnF3cko0SmdXSEgrOFE4Y2R2aHVMZTJvclVpU3dhMSs0TFlveHJBakZS?=
 =?utf-8?B?UzU3V1FHM1FtWUp2cmVwdjV4a3piZGJZMmVnQVhiTHJrYXpxS0FDcjI2MHdI?=
 =?utf-8?B?VytlMEVnaWNMTFRYVURhd3N1WlBjRGJUY3IrbkZyOTgwdnYwWmZHcytQUXFi?=
 =?utf-8?B?VTl4VzQvODd0MVNHSDZtSWpzMWpBdDhMZFRoUlVpVkFxZEJzSVlSSUNYd1Vo?=
 =?utf-8?B?dVhISXRmSmVPQk9sWUthY1FXQVJ0Zytxc2dQSU9kMEVNNG96RmhPa3BXRXpE?=
 =?utf-8?B?VGUyT1JOZVYyd0pHYjBjSEY5WkkwOEtMdFl6bTQ1aEduVk1CRUhZZlRoazZl?=
 =?utf-8?B?ZDdrN1NBKytqRHpzS0tUcUhUMWlXbmpadDhxbWF5bEphTmYveThnNVFTUFFT?=
 =?utf-8?B?MXhLbzljSk84U0J0MGM0Y2RSTll5REg4T1ByclExWE5kOFlZeXhyYlljUDBY?=
 =?utf-8?B?VHQvNDFjRmtZN1dJdDIwSDlvckErdDRMS0hsMm5ycEZrTGExbmdYN0liT2dZ?=
 =?utf-8?B?a2hMVDB4NEtuZXJ0SVJKVFBodVVBZ3pMR2ZwdXg2UUMwZER2eDREK1ZJZ1NX?=
 =?utf-8?B?bzRUODNRL0hBeDRwdnhKbkV5aTROcVN0bm1kNGZpbXNaT2tDbU1GNmFnNHhI?=
 =?utf-8?B?QThWcVBBWTN5S0twdk9sSEVLQkhHYXMyS0hrSnFRa2dDVHl6Z3VaUU83YmxY?=
 =?utf-8?B?am80RTA4dm5NeGlTcEZleG9kRFprR3UzazBYUEFXeXd5Q21uWmUycXQ5a1BO?=
 =?utf-8?B?cFhMM2JDeUxVSlRxMktVVHFIcmQ3Ni9zRXZSS1RnY2ZPTldnblpFZzV5ZVZF?=
 =?utf-8?B?YjlZY3IxT3NZTHYzU01Qa2xid0lwT1AveWZObjYrVWloMENUTU8ySmJlOURK?=
 =?utf-8?Q?2Wul4pAAhjHYCEidn5QYwR3pt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDA628A2B2041B469358D8F4E87B9F8C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?TFhVNURsMEY2Y05Ndk8yQkFmcnBnMlg3QnRtbm9zeVUvekp6Q1ZkRUZ0RUFM?=
 =?utf-8?B?RGMyOUxRcjNCTGZWZ2RwR1VxNzEyeEZrbzNqM05RdnI5U0w0Wnl2RGFueC96?=
 =?utf-8?B?TVkvMFFUVStDYlVvZG1rdVc5amNKWGZBSC9pZ2NPN1grZDBlT0ZwUDdPV3lh?=
 =?utf-8?B?dHpMdERGZ0w5QUltcWpjY2lzeEx6VnpESTVoc2J4UWNvNFNQL01GZ2xSUmNB?=
 =?utf-8?B?bFJQSU0wei9VK2VoZ0h0WnpGd2s1L0hkc2dKaVhsTEh0aHVKeE1TUXhJVEVs?=
 =?utf-8?B?dXlTQ25kZm56M1ZwdGxISUY0VlNVa3VpNWpISXk4bjlwODdha3JxVVZlRGYy?=
 =?utf-8?B?SVErcHh1UHE0M09LODEwWWZHMm8yU0dvYk44cmEyYVUxa1RKSlk0b2ZaSUJk?=
 =?utf-8?B?d054bG5LaWtFTUQ3eXdwb25kd254VkNVeFFTcXc1cWY5RE9ubVd2TndZRlV5?=
 =?utf-8?B?VEVTbVdyMHl6ZFVtVUU2cjJabDdoQ0p5QVlJQW5CSkNqYXoxbFBaQ0k5OFVP?=
 =?utf-8?B?K0tqdllxbzhlNEQxN0drS2R3cUlWZ1MyWDl6VnVBY3J0WmhpS0pleklXdjRm?=
 =?utf-8?B?am9adnhQSFpPNnJtQ0RWb2NURkF6djZQWXBnU2VkWlk1QzMzSVVpUGZtdGl3?=
 =?utf-8?B?ajR2bzZLQkpxa0ZuNTY1Y0JwdXdHNDNnWG1hUzhXM3JCQjlVTlQrSy85ajlU?=
 =?utf-8?B?VEZMdHA1MXVKS0hKSm9DZjFjZzBwWG1rdVgrTVpJeHBZbzhPK2NZRFZhTFYx?=
 =?utf-8?B?d01jYllreVUrS0w3VzlFTDR3UUZvM2lpRmRwN051T1BKdis5Y1lOdk1TNmJw?=
 =?utf-8?B?a2gxMHl0K1RrdGhwaU5vWmM3Zmc5OVU1eXZxclluUzczRzM3M2l2M2hadWs0?=
 =?utf-8?B?V2puNUZZUHphRHlabk1SVHhZb3pKNS9CZlRsUDA1Vjc4dWVRc2pvd2NJWVBv?=
 =?utf-8?B?Nlo2bTVLZnZ3OU50NU1yUTZwc3Q3TDFSMC9HbHhhMWpIa25uMExXVzQ0QTNC?=
 =?utf-8?B?RU5vNEFDQXA0TTJOTlNseEhWSURmVExlV2l2VlFpem8zcFdLbkIxRlJ4Ky9O?=
 =?utf-8?B?ZEY4S2hRMEVsU2FxOEpPUlEvRXNxM1JpU2dTMUVwNHBEeGFEM3NGOUZ4bHZZ?=
 =?utf-8?B?UldSL2ZVT084cWt1WEhBWlFFNzlWQTVlKzNYMkF1TnYvaFhYdkZsaHIwb2Fj?=
 =?utf-8?B?a0ZleFJFeEs0SDVtY3c2UjF0VzVESWQ0aURRbmhCaTZabTRDd2lJT05iMFhS?=
 =?utf-8?Q?+9diC4FgWy9evBA?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf070a81-81c4-4eb9-e3c2-08db9a8d201a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 17:05:12.2215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7DndNIrIkVjlG2nm9kpHvhvsu4SID1tx5JjeyV12o39UMMt8tpGFKydVO3Hrwg7N8e09c5jGfFnGdCzrE8T0hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8338
X-Proofpoint-GUID: rXGtoCo-CA8APlgcf86ba4i90UsrNdxi
X-Proofpoint-ORIG-GUID: rXGtoCo-CA8APlgcf86ba4i90UsrNdxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_08,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 malwarescore=0 mlxlogscore=480 adultscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308110155
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBBdWcgMTAsIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFRodSwgQXVnIDEw
LCAyMDIzIGF0IDEwOjM5OjM2UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBU
aHUsIEF1ZyAxMCwgMjAyMywgQWxhbiBTdGVybiB3cm90ZToNCj4gPiA+IE5ldmVyIG1pbmQ7IEkg
Zm91bmQgdGhlIHByb2JsZW0uICBJIGhhZCBmb3Jnb3R0ZW4gdGhhdCBhdCBTdXBlclNwZWVkIG9y
IA0KPiA+ID4gZmFzdGVyLCB0aGUgZGV2aWNlIGRlc2NyaXB0b3IgdXNlcyBhIGxvZ2FyaXRobWlj
IGVuY29kaW5nIGZvciANCj4gPiA+IGJNYXhQYWNrZXRTaXplMC4NCj4gPiA+IA0KPiA+ID4gVGhl
IHBhdGNoIGJlbG93IHNob3VsZCBmaXggdGhpbmdzIHVwLiAgTGV0IG1lIGtub3cgaG93IGl0IGdv
ZXMuDQo+ID4gPiANCj4gPiANCj4gPiBRdWljayB0ZXN0IGZvciBHZW4gMSBhbmQgMiBkZXZpY2Vz
IHdvcmsgZmluZSBub3cuIEhpZ2hzcGVlZCBhbHNvIHdvcmtzDQo+ID4gYXMgZXhwZWN0ZWQgYmVm
b3JlLiBJIGRpZG4ndCB0ZXN0IEZ1bGxzcGVlZCB3aXRoIHZhcmlvdXMgTVBTLCBidXQgSQ0KPiA+
IGRvbid0IGV4cGVjdCBhbnkgcHJvYmxlbSBsb29raW5nIGF0IHRoZSBjaGFuZ2UuDQo+ID4gDQo+
ID4gVGhhbmtzIGZvciB0aGUgZml4LA0KPiANCj4gQW5kIHRoYW5rcyBmb3IgdGVzdGluZyBpdC4g
IElzIGl0IG9rYXkgdG8gcHV0IHlvdXIgDQo+ICJSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiIgdGFn
IG9uIHRoZSBzdWJtaXR0ZWQgcGF0Y2g/DQo+IA0KDQpZZXMuDQoNCkJSLA0KVGhpbmg=
