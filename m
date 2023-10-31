Return-Path: <linux-usb+bounces-2413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 615EA7DD946
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 00:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F33281889
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 23:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925862747D;
	Tue, 31 Oct 2023 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UTJSXX7r";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Dpnl6laP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j8kgWHff"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7016C27479
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 23:30:50 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56521C9
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 16:30:48 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39VM4ANd032580;
	Tue, 31 Oct 2023 16:30:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Op4+1aGfhQozleSWX71sMgM8DpXoUh3lZKWjHdDLTnA=;
 b=UTJSXX7rWil3rsqBjC1QE7ubb2Pw9voKb+tardnov717xYdc8lBkk8KmZFNlzUtKjpqZ
 8sJbgbxhEf4mPWcyFio1DELX9HwxS/Dpl9Rz4wBeBdBr3M3tVh7iY92f8gOTtpjOQrgq
 9xWXC0DvCngRqQ79cZqC5xnBMZS1k9OT5KoHZzODMi/dHPCuC0zKb1BCsVpc3Z+weLbE
 GOlZZL3DRL7xCy19d3COnn/GwTfDzLFnNP195e3BeiduEenKfGHp/InT4NY2FkrNe5b6
 bd2tU51fDXgYu1ae9VzOouEwCwD4/qTs9lErZwaMiiTobmWCLVRyfliq+9fqFX1pf59m Wg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3u10xf1a3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 16:30:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1698795044; bh=Op4+1aGfhQozleSWX71sMgM8DpXoUh3lZKWjHdDLTnA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Dpnl6laPd2YVs9p7BushMk4Ak9Vo/YOc4OtqkMQeFG/aX+4a0cOJGxbpgZYouNARV
	 Fv7ZKZcmDZwjCZquCeBeP1nMT+oFx0lcN/qrMqJjaFxo4iLCeei3s+Je2Tt6v81yJT
	 xJ54xgWhpaBo1VyOYqxI40ZptfHCSwivFzWEAe63Cj9VEs7CQN/LgDtwct177xxf3X
	 rB0MNh9cZ39+CBCwZASiaD9+qKrqNSfIjhAXLFgkteVxhT/GuCTJgUTgIMTx9UWX0l
	 ggch7WWhgxLtpHyYOJdZ60JK8T5lDu01g6xzSo18V1erPby2t1npsi/5buFN1yNV4Y
	 /5i/1QcufByZg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E63440493;
	Tue, 31 Oct 2023 23:30:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DE3F8A007B;
	Tue, 31 Oct 2023 23:30:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=j8kgWHff;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id CFCEE401CF;
	Tue, 31 Oct 2023 23:30:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnzMwNIlTPLSJSoljTxkKAM9QmcEc18LI4fhSsOBnx71wO9mNW1Ofsjq3T4dlswyoxZ341L8Bi+1RvDXDjmysPcLqMBDqPeglt9/WpwZrnPZC4rQJKH/W6NM4NtLsgxpmytc6Jp31ICP/vQSMdYU4HTETrb8BT6jsMv7x5GMMoDGKiN7vuHpn0pI+foDSxJBs50HoSzQ13dowfYSJ09uPcXBzOfPEHsOMwiuctgH3PZsN6O3ALPUbDY7CMX49LgJSoJbscerblkxMqQmovUfC6hXJWl2FS1bk4v4mRjpp9t3YbZe1VhX/4RLPOoH5P/ZFHkuLd9YXv+isM4IGEvB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op4+1aGfhQozleSWX71sMgM8DpXoUh3lZKWjHdDLTnA=;
 b=RPBaW396NqIRdfjro980mKzebGIY179y2xQ3hFmv57FlfGDJRAowCjxRvxeQlcomZc4uJUUT/C9HMpBbrgeDZSesaji8xOb68KeKWTQT5jevg5/UBpNiMZIycrQSCyW2AEz9X4jB6lLTrIox84Qw9Et0Y4kfQA/ioNzmmGxQw4xSpbqTIs69Gm1v33SEdV1i4JALq++NCBH90jA1FEqj/O5fvpZZLvccfu6uWi7SqWXd6yTT4EfGP2pdGDaDWK7Do3Ft4kcGbsVOWJDL+0exR51opUnZUpHmp4lVCnmoiL2pENmC+OJwomUBalDFokYch56qgSsYUvTJz7o3gtZzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op4+1aGfhQozleSWX71sMgM8DpXoUh3lZKWjHdDLTnA=;
 b=j8kgWHff6VRR8T2sOuIN8tlmHSERb5Y13G2Ozprla9bK4TrUtfKB5D9hAkB0kvJhheAVEUIcMjgazc4twMUyQOR/VjwRSRQfwxYtWy6fOv6Um3Oo/Bs6jHBVP8U4g+JRGCWkNF7BDZRCBUn8FGMHdNX88zEVRnBP0UdQ+8HZh+A=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 23:30:38 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3fd1:e599:fe7b:e676]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3fd1:e599:fe7b:e676%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 23:30:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] usb: dwc3: Fix default mode initialization
Thread-Topic: [PATCH v2 1/1] usb: dwc3: Fix default mode initialization
Thread-Index: AQHaByjPTDyG0od9KkWERCgTzW0obbBkliWA
Date: Tue, 31 Oct 2023 23:30:38 +0000
Message-ID: <20231031233029.rmzdomvytyqi2mpf@synopsys.com>
References: <20231025095110.2405281-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231025095110.2405281-1-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB8476:EE_
x-ms-office365-filtering-correlation-id: 906c77ac-c49c-4304-1e60-08dbda6963a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6xCQMxsS+UhxcmKTQC4TApRqomVqTDUQiW+tS6EHKf+Pd7lkXdtf4PLg+YfoTLy7wkXOlYFiZ+8kP6BEOdH69ZjoBp+Wb26W71x94crgNFSa1fnSKEQWfXCfwjML1ax1DZBcZkSTpSKllbbqNYeOGqkbqKfWawDJu0WH5oc5eEzadInCA6vS9jNBKQHhzANeA11kKChyhRvk6KE+zvOBbXpgp/RqFfLtEKhEAfmU7/XMMD35yJn7gntlmC11Z3l9k8NtZ5RvEZ246CGieSYpUW9UBa/plC7fO7n6RLk4qQQ/5B0y4rESzkJA6aG93VrzFEgvxASkQnI1bvIebogNhDii5DE8UXI55pLLE3Nn/VVBqYZR0s7+geTmQ82/lXPBgg2Xbj1wfBPS8/Hm5T6SvHjoUTQ77ynBpexzTp+VuTIJqbWN98fCdmb4gzH3B+kO6O6qRArkrPDnJs6ATN4McbFVo8V9ddRkSleU8GjKDqey9Ce/7nP/HPa0grKqyo8P6vI1kjZa2GFWe4uPuZNZ7Z6RXyY/ajfqE7kozWQHxeEZfaV57Eg7EwLNfzxrfcMFgjegrKpDSIauQB3ki3siCF+XstA+OG2AorvK674D4yo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66556008)(66476007)(66446008)(54906003)(64756008)(316002)(6916009)(38070700009)(41300700001)(8676002)(8936002)(86362001)(966005)(478600001)(2906002)(4326008)(6486002)(38100700002)(76116006)(66946007)(122000001)(5660300002)(36756003)(6512007)(1076003)(26005)(83380400001)(2616005)(71200400001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YUxzK2l1cndEMTY5VFhjc0xuQS9WQlBiWlBKaTdua3laVHNidmx4eDZjY2FY?=
 =?utf-8?B?bERoOWhDNWkzbW4zeks3ZkVObTV6VmZBNzR1SnZtSjV2QXkxd2VvM1pUM25B?=
 =?utf-8?B?MG9rT1YyY2xwTzcxU1RzejhNOEVUbHFWRHZaekhEVWlOVXNYY2FxSW03T1F1?=
 =?utf-8?B?MnFEUnlWTE5LSVNJT01yVThMVGhra0MwSVlBRmhRRmxNUTYxYy9XbmczczR1?=
 =?utf-8?B?cHZxNE9Rb1orUUwzSmhlcG9rTG51ZUNqeGpKSjVBeitHM1lGZXIvaGtMVDg1?=
 =?utf-8?B?TE0zUGlCbUIxL2dBMjhlUUJ1ZFlubTVQTXFycUszdlRzM0RDWDVyZllTVlIx?=
 =?utf-8?B?dXlPZjB2ZWlHWXlHZmhwa1J6N0EyMUU5dWJ3ckVIdDNocEFZWEUzbFlXSEFw?=
 =?utf-8?B?NHgrZ1F6RW93d1RyRmpQbzJKWHNHMTFDT3VaSys3cmovVlhmck9TeWFlSVdX?=
 =?utf-8?B?YU04KzIxZHUvbXg3aUdhRThLY042Sm9tY2N0bXBhN2pjRDBzMlk5bVBJUmI1?=
 =?utf-8?B?aEx5YVJoWFBXYVEzeUlDWkliUkNOVXNGR3hTNVA3Uml2RW9xL1d6Nk5tLzUz?=
 =?utf-8?B?TjZyUXhOeXNqQnBKTXFWVGZsUTBzYW4vaE1CSHVQaG1xZGNQUkZkLzFZU3Qy?=
 =?utf-8?B?azB3aDg0VGhZc2dBbHUzWVVmanplclY0ek8wbUdPRm91dW9LTWdpVWFNc2hX?=
 =?utf-8?B?anA0Zll4VXdjSFNFK3JjNC96cmNUaS90TVh1SmhlU0VVZDM4WnNDcU5aM1lJ?=
 =?utf-8?B?MlBVTEk3UEV1ZTFNamplSGV0WHp4VDJveDVENnBSUHlzdWM2NjZzRDUrRE04?=
 =?utf-8?B?VFJiYTk3K3BzZVhHY3BYL2RMYWJTdHB0NXBvQXJMMmdKeVR4MS80Y1NEM0pU?=
 =?utf-8?B?M1dsV2pFdkdJcUtrMlRWWVVRUXVMUDdldWwxbHlpd21paSs0WUJNK2NQNjN6?=
 =?utf-8?B?bklPVHFFT2RnY1V2azlKbmRnUkVFTmh5VUNiL2x4T2RyYzJ4amI4Y25CUXVv?=
 =?utf-8?B?MUw3WG1aUmttU0NBVVlZMGh3ZmtvbHJHVnlxTDI0dEQxelhzWmpSa0x2Mm5C?=
 =?utf-8?B?NnpJZU92TnprUG5XL0NJbUtta0t2eFBCNVZucWJJek1ldDM0VUZNaWt1VFE3?=
 =?utf-8?B?U0R1aHQwbTkydUtlMzNGNG1qR3lnV2o2SExySWl3UGNmSHlQQzJwMlhoNHM4?=
 =?utf-8?B?aWVJUDhWZEhiQTB3UXA2WjVPT25QV0xpMEpUSXkrWllYMkc4TGVoMnZpbzQv?=
 =?utf-8?B?dFBkMmZVMGVPSHNsdk9ObFZqWk9mMDF3MkhNMWM0UjIzQ3NRcHhYRlBIZE5F?=
 =?utf-8?B?RkgvajhBaDBxb3d3Q0JBc1c4S2pSbTgxTFBNVmJjeS9YZjRvMU1VK1Nyc3N2?=
 =?utf-8?B?SllkZFZaM2k4d1RXU0NPbVM3eFBJdFZtNDBaWlRsc1lGNjRFanhNSFpNV3Qx?=
 =?utf-8?B?R25XRVFKMjBGUXJIMmt2U09RQ3BDSWgrVzJyOTBUZS9KdXZISGZLNzRWRnpZ?=
 =?utf-8?B?L2RvNFFYbFRORGdnQkJ3T0NFWHBxQTlxa01CcmRiS3EvRmFBSFR2bzFIelh0?=
 =?utf-8?B?ckNDcjBzZjZoNTB6a2F5R082dXduTEMxWXo4NFkxZWtsN1lNK0F1RXJYT2dP?=
 =?utf-8?B?MGV4L1FUY0kvRm93Z3lYN3NuYU9VbHJ5MEF0YXBGbXA0Y0MzUXVqV25FVk4v?=
 =?utf-8?B?MVFwekVyS1ZWTEdNRXRJcGNYbDJ0QmFyQUM0Y2hnWlh6MGhYMUxhUTNHdHJN?=
 =?utf-8?B?R1FMako2YXVvM3RBbG9YanlZMlZycVJMZzFIVFVrUzlkbGRpSXBJTUVsdTZo?=
 =?utf-8?B?UmZPc1VIanMrMGIzWDJHOTN1Z3FnRzZpZk1UMXpRZkhUbG1HTWZCQnhwU1FZ?=
 =?utf-8?B?bnFtRVFTRW8vTWNHUzgyTmViaCtqZ0x1UXh4MVZHQnhJb0I0ZnlWZ0puQ0Zv?=
 =?utf-8?B?YUY3QWxMYzdZSEtQelJrSHd2Q3pkN0ptSjkwZlZkakFydWs2a2ZBM1RYRnVW?=
 =?utf-8?B?a0lhOVhicEFSWHZKNUJJL2dGaFcvbWUzRnhnNTRFUXdLUUsrQzBvTkhhUTZ4?=
 =?utf-8?B?ZXF2aUk0NGJmRUdiTnlnbC9mUk9DcFNXWjR5MmlXUkNvcGpGRCtncjEreFh2?=
 =?utf-8?B?STJkWmxnZFdFVFBoZ0c1Tk9qNkZ0Sm5CUFJBcHhXVzZQUUJaWnRwTmJidjVI?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE1EC92125786B4E9A49EC67DB056771@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	I9uPXPWqdqSQIrWqcjLzRn6S9MLDa05p6MJx4iuA9OBA+c8wFZpUYSfQUtSgxk4lG9IrfAhtujSbVyM6yYnHxroECb5OxPorQuEXsdg4pqwnYaUp5r/5NdRJH7v2LVp3LtZSZBxOX4l+0pa/sTxc5KnS6ySPqC6D5U8ractk6OePqQY6fK9v12lOvLhpigYox8NZC6kFoC93T7AvBYKHUP4p4x70ULOGWlBIhQV7Iw+F06YOT2ufoAJ8UAog6+2DDP5Tal/LOi4Gba+xV+WEzcRm5T8K5zq0bGmWGW41LryQiZv93n/8YI7MCRkTMqLiVRLiZiN7tM8OBalQJUwz2iOdY0YoQlRLzcs33S0JLUmwcVLWmBRHXDwZjBA9Y44VQuWdjUWHQhuHkSkE9IwDT+AjE0NcsWkDC3usWjKIpKns2Oy/1iTC96V8B9ltZcfWMOivJe9K0cBRsBd8o6GHR8pxKMHJyWDF6oQzIe1dRxazjsu3ZmTkCMaiiQfMDpQAJMWeIUAtzpqiDEaeJO0+uU01C3Xodumn9QtY1mIN1QPNznzHoXmtV8Ooflln5VQYrasidcjyGXFoUPRV68buF8mapqfOsKXkkBMRPLZ4WAea7hiNEDxiUC4gkK2qdo4VKtOOlMPK8E5BIaUr740HZgfMabCCD8JPA0iNj8sg767a/yr5frMN5fQTzZ/+c/7b/nnAxw4HAraXCHNmkoDGNW+O4nCRRNxQs0qtxcFZHve/tutrKhMbmhghU6eSoXhMTfWOlSneZhYJayPAoR9RWvCwGWg48CR8k2mT6fLveDHzcyDrQ5EvklwlNTwEvEZc3jGorucU17JthbpqOF4Kikq42+NuXpzvt3clvvOjhxZAV7a9PFbWpD8TD36bLy9G1ypHYO0sBcD+nvb9nS1OaA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906c77ac-c49c-4304-1e60-08dbda6963a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 23:30:38.0753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1SqastrZ7f2MLbJaq7CQQy/5+7MjViqDqFgiE/X3z0qgTSxSX8/ytnsROFacQ69NPQLyZhKgcWaxPSf3d8vdZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8476
X-Proofpoint-ORIG-GUID: Qm3WlMQ67632n8OJHu4UiN3xG4TPVkYU
X-Proofpoint-GUID: Qm3WlMQ67632n8OJHu4UiN3xG4TPVkYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 mlxlogscore=898 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2310310194

T24gV2VkLCBPY3QgMjUsIDIwMjMsIEFsZXhhbmRlciBTdGVpbiB3cm90ZToNCj4gVGhlIGRlZmF1
bHQgbW9kZSwgY29uZmlndXJhYmxlIGJ5IERULCBzaGFsbCBiZSBzZXQgYmVmb3JlIHVzYiByb2xl
IHN3aXRjaA0KPiBkcml2ZXIgaXMgcmVnaXN0ZXJlZC4gT3RoZXJ3aXNlIHRoZXJlIGlzIGEgcmFj
ZSBiZXR3ZWVuIGRlZmF1bHQgbW9kZQ0KPiBhbmQgbW9kZSBzZXQgYnkgdXNiIHJvbGUgc3dpdGNo
IGRyaXZlci4NCj4gDQo+IEZpeGVzOiA5OGVkMjU2YTRkYmFkICgidXNiOiBkd2MzOiBBZGQgc3Vw
cG9ydCBmb3Igcm9sZS1zd2l0Y2gtZGVmYXVsdC1tb2RlIGJpbmRpbmciKQ0KPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgU3RlaW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+DQo+
IC0tLQ0KPiBUaGlzIGlzIGEgZGlmZmVyZW50IGFwcHJvYWNoIHRvIFsxXSB0byBmaXggdGhlIHJh
Y2UgdXBvbiBkd2MzIHJvbGUNCj4gaW5pdGlhbGl6YXRpb24uIGR3YzNfc2V0X21vZGUoKSBuZWVk
cyB0byBiZSBjYWxsZWQgaW4gZHdjM19zZXR1cF9yb2xlX3N3aXRjaCgpDQo+IHRvIGVuc3VyZSB0
aGUgbW9kZSBpcyBpbml0aWFsaXplZC4NCj4gVGhlIHVzYiByb2xlIHN3aXRjaCBkcml2ZXIgcHJv
YmUgbWlnaHQgYmUgZGVsYXllZCBvciBkZWZlcmVkIGZvciBzb21lIHVucmVsYXRlZA0KPiByZWFz
b24sIGxlYXZpbmcgdGhlIGR3YzMgbW9kZSB1bml0aWFsaXplZCBpZiBkd2MzX3NldF9tb2RlKCkg
aXMgbm90IGNhbGxlZCBoZXJlLg0KPiANCj4gWzFdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMjE3NjAzNC5JY29qcWVueDl5QHN0
ZWluYS13L1QvX187ISFBNEYyUjlHX3BnIVpjOENIam52WWV0bHA2SDhTZDJtWTExUmFIZThmUHBJ
MFUwcXROam54N2MzdlBGN0dmODJJY3NkcjhjWkc2SjZBN0hiZFo5NVRXdExaRDFaN1FJVVlyV1hP
LVBPRmNsTUU1N0IkIA0KPiANCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHJkLmMgfCAyICstDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2RyZC5jIGIvZHJpdmVycy91c2IvZHdjMy9kcmQuYw0K
PiBpbmRleCAwMzliZjI0MTc2OWFmLi41N2RkZDJlNDMwMjJlIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2RyZC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHJkLmMNCj4gQEAg
LTUwNSw2ICs1MDUsNyBAQCBzdGF0aWMgaW50IGR3YzNfc2V0dXBfcm9sZV9zd2l0Y2goc3RydWN0
IGR3YzMgKmR3YykNCj4gIAkJZHdjLT5yb2xlX3N3aXRjaF9kZWZhdWx0X21vZGUgPSBVU0JfRFJf
TU9ERV9QRVJJUEhFUkFMOw0KPiAgCQltb2RlID0gRFdDM19HQ1RMX1BSVENBUF9ERVZJQ0U7DQo+
ICAJfQ0KPiArCWR3YzNfc2V0X21vZGUoZHdjLCBtb2RlKTsNCj4gIA0KPiAgCWR3YzNfcm9sZV9z
d2l0Y2guZndub2RlID0gZGV2X2Z3bm9kZShkd2MtPmRldik7DQo+ICAJZHdjM19yb2xlX3N3aXRj
aC5zZXQgPSBkd2MzX3VzYl9yb2xlX3N3aXRjaF9zZXQ7DQo+IEBAIC01MjYsNyArNTI3LDYgQEAg
c3RhdGljIGludCBkd2MzX3NldHVwX3JvbGVfc3dpdGNoKHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJ
CX0NCj4gIAl9DQo+ICANCj4gLQlkd2MzX3NldF9tb2RlKGR3YywgbW9kZSk7DQo+ICAJcmV0dXJu
IDA7DQo+ICB9DQo+ICAjZWxzZQ0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQpUaGlzIHNob3VsZCBD
YyBzdGFibGUuDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+DQoNClRoYW5rcywNClRoaW5o

