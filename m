Return-Path: <linux-usb+bounces-4936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D403782A624
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jan 2024 03:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE4E1C214AE
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jan 2024 02:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E870A3C;
	Thu, 11 Jan 2024 02:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jzVhW+ey";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d2Ii/U05";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yh4uAD3w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105E510E1
	for <linux-usb@vger.kernel.org>; Thu, 11 Jan 2024 02:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40AMw6Gj019695;
	Wed, 10 Jan 2024 18:01:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=DV9UhrtleRxpTaxgCAlS5224N/PadOcKbCvJmcEE2Tk=; b=
	jzVhW+eyVtMPTrSDwD39DGqVEUyn614FXYf/nRb/eegGsHbloTKuhAXb0SiJrVSk
	hn58Q/pKVTf3FJuTQZklCdEqAY+/RPLnXCzyl5vnMc2GL/Fb3NNV/P6IHVpyxTou
	Jk6HE7IJ3lESh6dadvbUEvXUDQbpVH4YcdM9u5dcI3kQTFHpuZrkBP6hky4Zu2td
	DUz6XBAcnvOa+P6tE1yzxYh/JJqjARHlBM79B9lfsqcFWlx0HcBOhgRSaYUrUc6a
	kMpppvGqBIV1Mu5M1phOiUmsQ/a4UoZHCFziIJR3sX2SrtHRhaK/fRp4mcEXAFzu
	kkz/cVeQrvb4b8upLPE1Zg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vj4gd8hcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 18:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1704938491; bh=DV9UhrtleRxpTaxgCAlS5224N/PadOcKbCvJmcEE2Tk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=d2Ii/U05zKMFdP/CpTZAmKFRRLTvspGY6FCaEGzqqcgEGFJW48e8JaZJUWwKeRmwa
	 2Mbh8NW7L1ImeBfC3KBHUTgHcFw2I/K24vfz4AKwX241w8MFPyjp4x4xJHqGuqKg/L
	 4ZCBdZKUGk9GH1UYbRS1Sv/WRmPDYHPh53qi6OgV3IBdRB9SSeU3XBIWF8JSn4QLy/
	 2NNMqWY+anioEhLEev4Xm9ohuNcwllOWBo92qvXDO2jGtIrXqhDO2tHZa1VNqtSxtX
	 3ezdMvVupRZQMWHgBWAtRCHW90ZBnSY0np1/5zbT13Q2/kv8TB5TNZNBpOKR0qBugD
	 1BlpifXygZwoA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 278F34052B;
	Thu, 11 Jan 2024 02:01:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A8D04A0077;
	Thu, 11 Jan 2024 02:01:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Yh4uAD3w;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4392040356;
	Thu, 11 Jan 2024 02:01:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njYz2mL2+OHGtM08ttVmRCg5WEYM3JXIQa9uWKkT2Bgxa3MCkYTJzg4uoQwHmvNGbyrFxT2gxiC7fHF6JLdsrxU9w826T202iRJLTOy/mu6F5by/9Czmgr1c5uifCoP06faid9d1oUhN5Uj3xwclFn7R9ANhUbE6WZjnnPed/nDfOCe6YBDMCNWNEoCnIRLqHDUQyHWA91/60SDGaq6h2qYQ+ULEET88MHPy9RvvwHGq0hk+YJscri7gI8bGoaiWkjkRzv9m5umG+LZxkAvxYSEZgNqv7ppImZgoHiAw/aCEKFaBXIUXUDPv3tOxylnP28bgH/2qhQO+VNbWqCU5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DV9UhrtleRxpTaxgCAlS5224N/PadOcKbCvJmcEE2Tk=;
 b=jWSgip141+uFk2jUCvzknz49ItXduTlsKe/qC12QhoXMkiNxhPYw9CH7kzmMvJ7jdAvL+F4szKQl4kJVR9cRTk5yx8e6JtHCq5V0IZdTluMvZG5HT/IX8fWW3yXHVuSM3lBbKly1Pr+px4VguIdFVs1AcioOiv97Yzwva551D0nlqr7l5MF52zLMYOrTsCkgOcndGSyISiJATqpQ78xQ85gUkEX1kB2cXx/F3jCt2KpYC/RmDxBZ7hMHmwZfl5wTQUajrABwg99KXZ8VTHXsPT3Fp+N0MZpO47KhNszJj0VNYsD5UNXicdc2XkcmngMWM1dnGWfAaPpFZT75NotGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DV9UhrtleRxpTaxgCAlS5224N/PadOcKbCvJmcEE2Tk=;
 b=Yh4uAD3wiMxpvWNR8fg2NDx/ESoZRZWgxLWtr4vL1veOMMhVHVGCMIthcYiIWX4M1XURSn5+/C3PY3WtiMdBd/8ObFGcOrc+yU1oiZBcm/gAD30Yae64e83FEUcANMYAdTUu9sr73Wylq6/Yu/+JA4GmQiX4XW4BJgwOMRh49EE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH2PR12MB5514.namprd12.prod.outlook.com (2603:10b6:610:62::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 02:01:23 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 02:01:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "johan@kernel.org" <johan@kernel.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
        "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Vivek Dasmohapatra <vivek@collabora.com>,
        "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
        "ray.huang@amd.com" <ray.huang@amd.com>
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Topic: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Index: AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloA=
Date: Thu, 11 Jan 2024 02:01:22 +0000
Message-ID: <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
References: <20231122165931.443845-1-gpiccoli@igalia.com>
 <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
 <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
In-Reply-To: <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH2PR12MB5514:EE_
x-ms-office365-filtering-correlation-id: f67c3c1d-d61d-4b03-197a-08dc12493627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 D2WNc1gPfRfD8I25agBoEMSijTb/0qglfsJbV03VAqp/UD2cmPqB+FGldZLf3C+oT9n4joKCYfJP7b+bkDIeXnRsu9vuOa4XSrY0zOyVYBtvSxXxJ+AV1VnBizpX6RcyJoVT/96yMmbygeYwXrhl/Pb6DxIOhX0bb2TE1ZjxmAUcbbYZOVMNr6+2cIRNkACjO75LrCdZIVHDog7z4idU1Xlw+hvHgWfaoIXgHibJcS3hCnJG2JGeaNmp413k/Mc3VDeZQX55PJcTO8/50sKpRq9/svdAwu2JjIr21TzmRp0fH3v7HGLbD/S85ePWg9FZJNZYMat5xFjO1QtXsMXPZ0xE2qVY6ku8kLT2FXYRjGdii7z/3rT0v1pgPhJB6zosIoGZsnj0SUY+sCLqYFVoGpSra1jW1l2weFs7MPTni562MzAvnjB2ImPd21ajMt/KuG4Mn1J0JSlamgWgVfPhJzbmCja7IzzHMeibsQkCxavogcaH1bJLH83KEgLiLxMvl7Dxwmh73FuKQFBfkL4zGYBbDXhPFxD53mcQ13HaNYIgjIFr3zEaQ1hyjoNzZ1clZkMHEMhTOzT2mTR7KtwYTzeSDyTs6M6tMx4YbfZmBIusmPQlUa/M6W8NmiWxIgxH
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(64756008)(6916009)(66446008)(66476007)(66556008)(66899024)(66946007)(2906002)(7416002)(5660300002)(8936002)(316002)(71200400001)(91956017)(54906003)(4326008)(8676002)(76116006)(41300700001)(38070700009)(36756003)(86362001)(38100700002)(6506007)(2616005)(53546011)(478600001)(122000001)(6512007)(26005)(6486002)(83380400001)(1076003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NTUxeHhlYTdOb2NSTkZBS2pJN056bXpMZXBud2psY1NPVWp6TE4wWGtvNkc5?=
 =?utf-8?B?Qm82dmF3Ymt5eXNqY3RGTUtscXE0Zm42MHNuanJmT1ZXZ3RwRUF5Q2F3QXUx?=
 =?utf-8?B?OVp6dytZN3JiZHp0ZE9qMlVQcHg2YWk0djVienpQZ1ZGalM1VjQ0NDJFU3Er?=
 =?utf-8?B?djRXcGFYVzV2c2dHSk1iZEdBMEVMMy9Cb1pJdkVVeWdSUnZzTkZoajd2SmxV?=
 =?utf-8?B?a1Y3WXBlYmI0MEQxajZEMmZNeXZPVmRWMEF0REpONzdKbjZqNERtN1BnR3pC?=
 =?utf-8?B?VVFwRnoySStveFlieGhmMDVzOHBmTE80ejdUc3lheWNWelhJbXFDcHhNR1ZJ?=
 =?utf-8?B?YmdHdVNDc0tnZnd6TTNZbkxVUElPM1BIWTVKcHg3YUw5NVNXaUp1ekI0RTVm?=
 =?utf-8?B?U1JKTGN6STNoalIwYWtvWCtrUmpyYjBLdHQwSE5Hb2lLWjh3U0UzNUpDSU8w?=
 =?utf-8?B?ZkRpSUtGMkdweFJMUDN3Y2MwdlJZckFCOFZkZmFyOFJnckxxemc5eTJ6TDVi?=
 =?utf-8?B?NjRLbTlkRk4zWkNvNXFyMzEyajJKL1NFaG1nRUNUbWRIb0xaNExBdWM0amdQ?=
 =?utf-8?B?UGRKMmkwL2xxQU5zbTJlS09BSE03aVpLRGFkaTVxTzBFYUhONXRCRXV1YkRx?=
 =?utf-8?B?TnpFYUord2lYZzA3dTVxRGZNaDFBdUNHVmZoR1I0Mk5ZZC96dEhJTzU5cXJa?=
 =?utf-8?B?d3dnRGNLNjZNTnBxdXlUY2FncmxzSGlyTDlQTEptT1RnOFJ6SmhTeFpWc2E4?=
 =?utf-8?B?aE9YS21TSi84WGJ0dWRCQy9nYkdqOE1RZ1QzL2wvUWMydWV0aXdZVmRhVGpE?=
 =?utf-8?B?NTYyWnV5ejlUQkZRV3ZhYWNDMklqekxFODJFa1BQKzVmNlcvSEtJWU40aUhp?=
 =?utf-8?B?MU05ZXIzMlNpY0pwRUxlSkR5bWFSWmZQN2FORndUZG9LQXJNNEt0V25lbnJD?=
 =?utf-8?B?N28veWRSeE1UUUtnUlJiZU5oVjN3bExTbHdtMlhGL0c0amhjQ3REczVNNTNl?=
 =?utf-8?B?UjNpa0pHbzBEMTgwU3IvY1FUQ040WEVDbkRuKzdLUkdVUWNza0dRQ2pCTDE0?=
 =?utf-8?B?ZFRjSWwzMzF4T3c4cU1SWEhBak1tRnNzeHVFVXZtS3hDV1p2V1djbFY5Vktq?=
 =?utf-8?B?NjlKWktkYUI4ZFMrMVBaYXdla3pLbk0xMURGcUNnQUtlS2R4WnBzNjVGMExs?=
 =?utf-8?B?MEFlSDhKQW50TkhHdHRDSHJRK0VBM0w3ajk5WUlmNnZ4UE1qc0pLeUlmaStU?=
 =?utf-8?B?Sm43Q2plUEZxZ1dVVU5BODE5WUhDRmMzMm1Zc25GckFWNnQ0aFR1MUtXaDBC?=
 =?utf-8?B?ZUM1cWRGUEZhWTkveGJFcng3cWYrc2hqMCtqUnJiUEQxRUx1bUJSL2dMUWlo?=
 =?utf-8?B?NUFVSGhiMHFEWXFpMXk4dWwvMm90THkxRWRQdEVyZk9qTWYrVXRVWUZNSmFK?=
 =?utf-8?B?T2paajRVeWJrQmMvRnhxL2tzeTdJWlpMUjIyNUcrWHZCTXgwUnhMdzViTlU0?=
 =?utf-8?B?VzZiRWxDQ0phWVpBckZwdXFRYVZ1TlRleElodkZ0VU5BTStMVEl1K3hueUlt?=
 =?utf-8?B?dkp1aTRueTcySDZQckh6dVhCeTRrZjNKaUlXNFBCekN3NTYvYXZBTGNZalgw?=
 =?utf-8?B?bjBlKzFkdXFlUDJ3bG9wOWZQUHRTTlJreW9Ud2tDZEVQYU9WTUNxTzZacUZE?=
 =?utf-8?B?NGh5bHVKRVgza09xdmR6Q0ZtQU1NejJZWnhrdGJ3YjFPZXgyK2xuSjNNVkNz?=
 =?utf-8?B?Rm1NMXp1UkxzVkt4bGs4TS9HbjZwSWs2KzVlV0lmaG9hTlI0Ky9kbTZPVzBn?=
 =?utf-8?B?VlRVdjUyalNMbVNGd0ZXdWp1YTZBK3Fnd0tPWHljRzJrMkg3djBzS0JHZ0Rl?=
 =?utf-8?B?aHJYV29jdytIS0M4c3ZjWGliblliU2RwVS9HKzRQQlpKY0ozMUx1aWRTV1Qr?=
 =?utf-8?B?eE0rWmpSWmwydTN0ZWhqVlIyS0VsMnVEK0FQOENnWmpjOEp4TmphQlpUcFMz?=
 =?utf-8?B?bGRiYjlZVTBhUkxCY0R6VnZySWNkanlDTnFkaUxBRXJyR2pBMW5lZmRJQXNU?=
 =?utf-8?B?WHNSYlF5ZFdyMXFtNDZiQ2czNEJialZQVHF5SzVQa3hSUWlhN2EreENzWWVz?=
 =?utf-8?Q?IaPopCW6F0h0jjYGG3lBi6GA/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1BCAB122824EC4B9CB455B733765579@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1q+5UsLTy4yUD0gKRLFtD1UbZaeVx4IUhpjjJl02stAECqGNuoXdjMTdpOLvZqRonW0MF+eKsStytT7enAX9aRn30BwIgh0EsvOpLZqO/4og3NVaasAxC4aaNCVRy3g7g+38j3DPUlYdPPe0kCrGlxL3MY2xCsdCRRZs2pBy3Hy6UFEnOriXfxGbIIelJGB9tn5Imzn9OkKsYQSag2P7hJgov91dRYzB30ow1Zts11CD2rwmnNzbMaOBC0n/35PIgwZKfNVPruK//Kvy+8GAFbBlp9+R8wYHcXbIKxFu4OtLPVU11/17rM7krvulVSz0mXQ0teoIm/iwY7JohQp/6B0jMSG6vuftKFSHjncDmjVDQT2LmlJ6jLgdOjVDWj0FUAcjsqn2HCTws3Ny0KOTNi4WsuwWLql7Id/q7iKMspb+0+MdDuyyppU61TjYJZLFKZrM2cY7mv8sAmsxvTBYpusDROvroNw3AjFxxB9ovJtAy96IdvZ3EEJCWJhnK3jrhrGjAKD7YQqMCd6vUABH3eeBB7pOuCdoA1hs/3S8TNz3B78XXyMZRhU/+xznsihPWyMpiiUB8bQpli7saev/XeTWE9R1TkXyQEBIaIT0dNje2KktycG5KUOewFAva7rgvR3bE9UcTA54RZsoA3ZgkQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67c3c1d-d61d-4b03-197a-08dc12493627
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 02:01:22.9587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5M3u1FZPrD5GwlAb/AJQIgnAPMrupwdT2fDiAU5SnCq047CxOCuJWdJxgwKAaFovwhbpzSxbANoNijz0nlmZUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5514
X-Proofpoint-GUID: Zfi40x2eaLUBieNLqij3AXZu9jixOaZB
X-Proofpoint-ORIG-GUID: Zfi40x2eaLUBieNLqij3AXZu9jixOaZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401110014

SGksDQoNCk9uIFR1ZSwgSmFuIDA5LCAyMDI0LCBHdWlsaGVybWUgRy4gUGljY29saSB3cm90ZToN
Cj4gT24gMDUvMTIvMjAyMyAxMTo0MCwgR3VpbGhlcm1lIEcuIFBpY2NvbGkgd3JvdGU6DQo+ID4g
SGkgVGhpbmgsIHRoYW5rcyBmb3IgeW91ciByZXNwb25zZS4gSSdsbCBjbGFyaWZ5IGlubGluZSBi
ZWxvdzoNCj4gPiANCj4gPiBPbiAwNC8xMi8yMDIzIDIyOjIzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+ID4+IFsuLi5dDQo+ID4+Pj4gSXQgd2FzIG5vdGljZWQgdGhhdCBvbiBwbHVnZ2luZyBhIGxv
dy1wb3dlciBVU0Igc291cmNlIG9uIFN0ZWFtDQo+ID4+Pj4gRGVjayBVU0ItQyBwb3J0IChoYW5k
bGVkIGJ5IGR3YzMpLCBpZiBzdWNoIHBvcnQgaXMgb24gZGV2aWNlIHJvbGUsDQo+ID4+DQo+ID4+
IEknbSBub3QgY2xlYXIgb2YgdGhlIHRlc3Rpbmcgc2VxdWVuY2UgaGVyZS4gQ2FuIHlvdSBjbGFy
aWZ5IGZ1cnRoZXI/IElzDQo+ID4+IHRoaXMgZGV2aWNlIG9wZXJhdGluZyBhcyBob3N0IG1vZGUg
YnV0IHRoZW4gaXQgc3dpdGNoZXMgcm9sZSB0byBkZXZpY2UNCj4gPj4gbW9kZSB3aGVuIG5vIGRl
dmljZSBpcyBjb25uZWN0ZWQ/DQo+ID4+DQo+ID4gDQo+ID4gRXhhY3RseSB0aGlzLiBXZSBoYXZl
IGEgZHJpdmVyIHRoYXQgY2hhbmdlcyBiZXR3ZWVuIGhvc3QvZGV2aWNlIG1vZGUNCj4gPiBhY2Nv
cmRpbmcgdG8gQUNQSSBub3RpZmljYXRpb25zIG9uIHBvcnQgY29ubmVjdC4gQnV0IHRvIG1ha2UN
Cj4gPiB0ZXN0cy9kaXNjdXNzaW9uIGVhc2llciBhbmQgZWxpbWluYXRlIG1vcmUgdmFyaWFibGVz
LCB3ZSBqdXN0IGRyb3BwZWQNCj4gPiB0aGlzIGRyaXZlciBhbmQgZG8gaXQgbWFudWFsbHkuDQo+
ID4gDQo+ID4gU28gdGhlIHN0ZXBzIGFyZToNCj4gPiANCj4gPiAoQSkgaG9zdCBtb2RlIHRlc3QN
Cj4gPiAxKSBQdXQgdGhlIHBvcnQgb24gaG9zdCBtb2RlIHVzaW5nIGRlYnVnZnMgaW50ZXJmYWNl
Lg0KPiA+IDIpIFdhaXQgMzAgc2Vjb25kcywgcGx1ZyBhIGNhYmxlIGNvbm5lY3RpbmcgdGhlIFN0
ZWFtIERlY2sgdG8gYSBsYXB0b3AgLQ0KPiA+IHdlIGNhbGwgdGhpcyBjb25uZWN0aW9uIGEgImxv
dy1wb3dlciBzb3VyY2UiLCBzaW5jZSBpdCBzZWVtcyB0byBjaGFyZ2UNCj4gPiBzbG93bHkgdGhl
IERlY2suDQoNCkkgYXNzdW1lIHRoZXJlIHdhcyBhIHJvbGUgc3dpdGNoIG5lZ290aWF0aW9uIHRv
IHN3aXRjaCB0byBkZXZpY2UgbW9kZQ0Kc3VjY2Vzc2Z1bGx5IGhlcmUgYmVmb3JlIHRoZSBuZXh0
IHN0ZXA/DQoNCj4gPiAzKSBTdXNwZW5kIHRoZSBEZWNrIGFmdGVyIHNvbWUgc2Vjb25kcyAoUzMv
ZGVlcCkgLSBzdWNjZXNzDQo+ID4gDQo+ID4gKEIpIGRldmljZSBtb2RlIHRlc3QNCj4gPiANCj4g
PiAxKSBQdXQgdGhlIHBvcnQgb24gZGV2aWNlIG1vZGUgdXNpbmcgZGVidWdmcyBpbnRlcmZhY2Uu
DQo+ID4gMikgV2FpdCAzMCBzZWNvbmRzLCBwbHVnIGEgY2FibGUgY29ubmVjdGluZyB0aGUgU3Rl
YW0gRGVjayB0byBhIGxhcHRvcC4NCj4gPiAzKSBTdXNwZW5kIHRoZSBEZWNrIGFmdGVyIHNvbWUg
c2Vjb25kcyAoUzMvZGVlcCkgLSBmYWlscw0KPiA+IA0KPiA+IDNhKSBJZiBwY2llX3BtZSBpcyB1
c2luZyBNU0lzLCBpdCBmYWlscyBzaG93aW5nIHRoYXQgYSB3YWtldXAgaW50ZXJydXB0DQo+ID4g
aXMgcGVuZGluZywgaW4gdGhpcyBjYXNlIHRoZSBTdGVhbSBEZWNrIGVmZmVjdGl2ZWx5IGRvZXNu
J3QgZW50ZXIgc3VzcGVuZC4NCj4gPiANCj4gPiAzYikgaWYgUENJZSBQTUUgaXMgbm90IHVzaW5n
IE1TSXMsIERlY2sgc3VzcGVuZHMgYW5kIHJpZ2h0IGFmdGVyIChsZXNzDQo+ID4gdGhhbiBhIHNl
Y29uZCksIHdha2VzIHVwIHByb3Blcmx5Lg0KPiA+IA0KDQpZb3VyIHBsYXRmb3JtIGlzIERSRCBy
aWdodD8gSWYgdGhhdCdzIHRoZSBjYXNlLCB0aGVuIGl0IHNob3VsZCBiZSB1c2luZw0KbGV2ZWwg
aW50ZXJydXB0LiBJdCBzaG91bGQgbm90IHN1cHBvcnQgTVNJIHVubGVzcyBpdCdzIGhvc3QgbW9k
ZSBvbmx5Lg0KDQo+ID4gDQo+ID4+Pj4gdGhlIEhXIHNvbWVob3cga2VlcCBhc3NldGluZyB0aGUg
UENJZSBQTUUgbGluZSBhbmQgdHJpZ2dlcmluZyBhDQo+ID4+Pj4gd2FrZXVwIGV2ZW50IG9uIFMz
L2RlZXAgc3VzcGVuZCAodGhhdCBtYW5pZmVzdHMgYXMgYSBQTUUgd2FrZXVwDQo+ID4+Pj4gaW50
ZXJydXB0LCBmYWlsaW5nIHRoZSBzdXNwZW5kIHBhdGgpLiBUaGF0IGRvZXNuJ3QgaGFwcGVuIHdo
ZW4gdGhlIFVTQg0KPiA+Pj4+IHBvcnQgaXMgb24gaG9zdCBtb2RlIG9yIGlmIHRoZSBVU0IgZGV2
aWNlIGNvbm5lY3RlZCBpcyBub3QgYSBsb3ctcG93ZXINCj4gPj4+PiB0eXBlIChmb3IgZXhhbXBs
ZSwgYSBjb25uZWN0ZWQga2V5Ym9hcmQgZG9lc24ndCByZXByb2R1Y2UgdGhhdCkuDQo+ID4+DQo+
ID4+IElzIHRoZSBQTUUgY29udGludW91c2x5IGdlbmVyYXRpbmcgbm9uLXN0b3A/IERpZCB5b3Ug
dGVzdCB0aGlzIGluIFVTQjMNCj4gPj4gc3BlZWQ/IERvZXMgdGhpcyBoYXBwZW4gZm9yIGV2ZXJ5
IGxvdy1wb3dlciBkZXZpY2Ugb3IganVzdCB0aGlzIHNwZWNpZmljDQo+ID4+IGxvdy1wb3dlciBk
ZXZpY2U/DQo+ID4gDQo+ID4gSXQgc2VlbXMgUE1FIGlzIGNvbnRpbnVvdXNseSBiZWluZyBnZW5l
cmF0ZWQsIHllcy4gSSB0ZXN0ZWQgYnkNCj4gPiBjb25uZWN0aW5nIHRvIG15IGxhcHRvcCBhcyBt
ZW50aW9uZWQsIEkgZ3Vlc3Mgb3RoZXJzIHRlc3RlZCBkaWZmZXJlbnQNCj4gPiBzY2VuYXJpb3Ms
IG5vdCBhbHdheXMgcmVwcm9kdWNlcy4gQW4gZXhhbXBsZTogYSBrZXlib2FyZCBvciBhIGRpc2sN
Cj4gPiBjb25uZWN0ZWQgd2hlbiB0aGUgVVNCIHBvcnQgaXMgb24gZGV2aWNlIG1vZGUgZG9lc24n
dCByZXByb2R1Y2UuIEFsc28sIEkNCj4gPiB0aGluayBJIGRpZG4ndCB0ZXN0ICJpbiBVU0IzIHNw
ZWVkIiAtIGNvdWxkIHlvdSBkZXRhaWwgbW9yZSwgbm90IHN1cmUgaWYNCj4gPiBJIHVuZGVyc3Rv
b2QgdGhhdCBwcm9wZXJseS4NCg0KSSBtZWFuIHRvIGFzayB3aGV0aGVyIHRoaXMgdGVzdCB3YXMg
ZG9uZSB3aGlsZSBvcGVyYXRpbmcgaW4gU3VwZXJTcGVlZA0Kb3IgU3VwZXJTcGVlZCBQbHVzLg0K
DQo+ID4gDQo+ID4gDQo+ID4+IFsuLi5dIA0KPiA+PiBFdmVuIGlmIHlvdSBtYXNrZWQgYWxsIHRo
ZSBpbnRlcnJ1cHRzLCBhbmQgdGhlIGV2ZW50cyBhcmUgc3RpbGwNCj4gPj4gZ2VuZXJhdGluZz8g
RGlkIHlvdSBjaGVjayBpZiB0aGUgZHJpdmVyIGhhbmRsZWQgd2FrZXVwIGZyb20gUE1FIGFuZA0K
PiA+PiBwcm9wZXJseSByZXN0b3JlIHRoZSBjb250cm9sbGVyPw0KPiA+Pg0KPiA+IA0KPiA+IE9r
LCBsZXQgbWUgY2xhcmlmeSBhIGJpdC4gRnJvbSB0aGUgQUNQSSBwZXJzcGVjdGl2ZSwgSSB3YXMg
YWJsZSB0byBjaGVjaw0KPiA+IGZyb20ga2VybmVsIHRoYXQgc29tZSBHUEVzIHdlcmUgZ2VuZXJh
dGVkIG9uIHJlc3VtZSB3aGVuIHRoZSBpc3N1ZQ0KPiA+IGhhcHBlbnMgKGFuZCBwb3RlbnRpYWxs
eSBldmVuIHdoZW4gdGhlIGlzc3VlIGRvZXNuJ3QgaGFwcGVuLCBpbiBob3N0DQo+ID4gbW9kZSBm
b3IgZXhhbXBsZSkuIFNvLCB3aGF0IEkgZGlkIHdhcyBtYXNraW5nIGFsbCB0aGVzZSBHUEVzIHVz
aW5nIHRoZQ0KPiA+IGtlcm5lbCBzeXNmcyBpbnRlcmZhY2UuIEFmdGVyIG1hc2tpbmcsIHRoZSBp
c3N1ZSBzdGlsbCByZXByb2R1Y2VzIGJ1dA0KPiA+IHRoZSBHUEVzIGNvdW50IGRvZXNuJ3QgaW5j
cmVhc2UuDQo+ID4gDQo+ID4gUmVnYXJkaW5nIHRoZSBQTUUgaW50ZXJydXB0IG5vdzogaWYgTVNJ
IGlzIHVzZWQgb24gUE1FLCBJIGNhbiBzZWUgYW4NCj4gPiBpbmNyZWFzZSBvZiAxIGluIGV2ZXJ5
IHN1c3BlbmQvcmVzdW1lIGF0dGVtcHQgKGNoZWNraW5nDQo+ID4gL3Byb2MvaW50ZXJydXB0cyku
IE5vdyBpZiBNU0lzIGFyZSBub3QgdXNlZCwgZ3Vlc3Mgd2hhdD8gVGhlcmUgd2FzIG5vDQo+ID4g
aW5jcmVhc2UgaW4gdGhlIGludGVycnVwdCBhdCBhbGwuIEkgZGlkbid0IG1hc2sgdGhlIFBNRSBp
bnRlcnJ1cHQgb24NCj4gPiBQQ0llIFBNRSBkcml2ZXIuLi5idXQgZXZlbiB3aXRoIFBNRSBkcml2
ZXIgZGlzYWJsZWQsIElJUkMgdGhlIHByb2JsZW0NCj4gPiByZXByb2R1Y2VzLg0KPiA+IA0KPiA+
ICJEaWQgeW91IGNoZWNrIGlmIHRoZSBkcml2ZXIgaGFuZGxlZCB3YWtldXAgZnJvbSBQTUUgYW5k
IHByb3Blcmx5DQo+ID4gcmVzdG9yZSB0aGUgY29udHJvbGxlcj8iIDwtIEkgdGhpbmsgSSBkaWRu
J3QgLSBob3cgZG8geW91IHN1Z2dlc3QgbWUgdG8NCj4gPiBjaGVjayB0aGF0Pw0KDQpJZiBpdCdz
IGluIGRldmljZSBtb2RlLCBhbmQgeW91IG1lbnRpb25lZCBQTUUsIHRoYXQgbWVhbnMgdGhhdCB0
aGUNCmRldmljZSB3YXMgaW4gaGliZXJuYXRpb24uIEkgYXNzdW1lIHRoYXQgeW91J3JlIG5vdCB1
c2luZyB0aGUgbWFpbmxpbmUNCmR3YzMgZHJpdmVyIGlmIFN0ZWFtIERlY2sgc3VwcG9ydHMgaGli
ZXJuYXRpb24gYW5kIHdhcyBpbiBoaWJlcm5hdGlvbg0KYmVmb3JlIHRoZSBjb25uZWN0aW9uLiBP
dGhlcndpc2UsIFBNRSBzaG91bGQgbm90IGJlIGdlbmVyYXRlZC4gSWYgaXQNCmRvZXMsIHNvbWV0
aGluZyBpcyBicm9rZW4gYW5kIHJlcXVpcmVzIGEgd29ya2Fyb3VuZCAoYXMgdGhlIG9uZSB5b3UN
CmhhdmUpLg0KDQo+ID4gDQo+ID4gV2hhdCBJJ3ZlIG5vdGljZWQgaXMgdGhhdCBlaXRoZXIgdGhl
IHN5c3RlbSBjYW4ndCBzdXNwZW5kLCBvciBpZiBubyBNU0lzDQo+ID4gYXJlIHVzZWQgb24gUENJ
ZSBQTUUsIGl0IHN1c3BlbmRzIGFuZCByZXN1bWVzIHJpZ2h0IGFmdGVyLCB3aXRoIHN1Y2Nlc3Mu
DQo+ID4gSW4gdGhpcyBsYXR0ZXIgY2FzZSwgZHdjMyB3b3JrcyBub3JtYWxseSBhZ2FpbiwgcmVz
dW1lIGlzIHN1Y2Nlc3NmdWwuDQo+ID4gTGV0IG1lIGtub3cgaWYgeW91IHdhbnQgbWUgdG8gY2hl
Y2sgYW55IG90aGVyIHBhdGggb3IgZnVuY3Rpb24gY2FsbGVkLCBldGMuDQo+ID4gDQo+ID4gDQo+
ID4+IFsuLi5dDQo+ID4+DQo+ID4+IFNvbWUgcGxhdGZvcm1zIG1heSBuZWVkIGEgc29mdCByZXNl
dCBiZWZvcmUgYSBjaGFuZ2UgdG8gcHJ0Y2FwZGlyLiBUaGlzDQo+ID4+IG1heSBicmVhayBzb21l
IHNldHVwcy4gVGhpcyBzZWVtcyB0byBiZSBhIHdvcmthcm91bmQgYW5kIHNob3VsZCBub3QgYmUN
Cj4gPj4gdHJlYXRlZCBhcyBwYXJ0IG9mIGEgbm9ybWFsIGZsb3cuDQo+ID4gDQo+ID4gT0ssIGRv
IHlvdSBoYXZlIGFueSBvdGhlciBpZGVhIG9mIGEgcmVnaXN0ZXIgY2hhbmdlIHRoYXQgaXMgc29m
dGVyIHRoYW4NCj4gPiBjaGFuZ2luZyAicHJ0Y2FwZGlyIiBhbmQgY291bGQgcHJldmVudCB0aGUg
aXNzdWU/IEFsc28sIHdvdWxkIHRoYXQNCj4gPiB3b3JrYXJvdW5kIG1ha2VzIHNlbnNlIGFzLi4u
YSBxdWlyaz8NCj4gPiANCj4gPiBXZSBjb3VsZCBndWFyZCBpdCBmb3IgRGVjaydzIEhXIGV4Y2x1
c2l2ZWx5LCB1c2luZyBETUkgaWYgeW91IHRoaW5rIGl0DQo+ID4gZG9lcyBtYWtlIHNlbnNlLi4u
b3IgdGhlIGR3YzMgcXVpcmtzIChhbHJlYWR5IGhhdmUgc29tZSBmb3IgQU1EIHJpZ2h0PykNCj4g
PiANCg0KWWVzLCB5b3UgY2FuIGNyZWF0ZSBhIHNwZWNpZmljIHF1aXJrIGZvciB0aGlzIGRldmlj
ZS4NCg0KPiA+IEknbSBDQ2luZyBQaXl1c2ggYW5kIEh1YW5nIGZyb20gQU1ELCBzaW5jZSB0aGlz
IGlzIEFNRCBIVy4gQW55IG90aGVyDQo+ID4gc3VnZ2VzdGlvbnMgYXJlIG11Y2ggYXBwcmVjaWF0
ZWQuDQo+ID4gVGhhbmtzLA0KPiA+IA0KPiA+IA0KPiA+IEd1aWxoZXJtZQ0KPiANCj4gDQo+IEhp
IGZvbGtzLCBqdXN0IGN1cmlvdXMgaWYgeW91IHRoaW5rIHRoZSB3YXkgZm9yd2FyZCB3b3VsZCBi
ZSBpbmRlZWQgdG8NCj4gcXVpcmsgaXQgYmFzZWQgb24gRE1JL2RldmljZSBJRCwgb3IgaWYgc2hv
dWxkIHB1cnN1ZSBhbm90aGVyIGFwcHJvYWNoDQo+IGhlcmUuIFN1Z2dlc3Rpb25zIGFyZSB2ZXJ5
IHdlbGNvbWUsIGFuZCB0aGFua3MgaW4gYWR2YW5jZSENCj4gDQoNClNvcnJ5IGZvciB0aGUgZGVs
YXkgcmVzcG9uc2UuIEp1c3QgZ290IGJhY2sgZnJvbSBicmVhay4NCg0KVGhhbmtzLA0KVGhpbmgN
Cg==

