Return-Path: <linux-usb+bounces-2786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CBF7E85DB
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 23:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 890571F20F11
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 22:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3403B789;
	Fri, 10 Nov 2023 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KsAalOxY";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="M9dlWc0T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QdPQjEV4"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8875B2032C
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 22:43:12 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC05111
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 14:43:10 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AALkvY6005548;
	Fri, 10 Nov 2023 14:43:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=6Dpt+noChcfj+FK4OzjVgPghYSjShNhYpgYgFXkpP1U=;
 b=KsAalOxYVreLqDvhCUiAvwcWAKRULE3WTigcLFkDL7yU6zxCaP8CPLeHNTBX2uFwvSo/
 +ar4+0CoEs1sr+EFzmb15qm4hxaujKChIqKgE7l3xfxzrGj5vlDjOh8NIZb/RUEdvV5s
 ummvYkm/UpPQTf0nSHpuL6w5SvGicYbThAb2DtvEnV3E56OFbpWW/rnNLFyYqh9lHlXx
 CBPq8X1dL67Lz4jtta/3eRy0rzcDDZVkI83VZYLRupjGgxdxBPMYZSCqZx83VXQPwOHN
 dqVn7EtpaCnDwgk1/YN5F+ewhd6jlIPb61w876JPox2Gyk/18Ly+gb7dSf07T3gdwBLJ gA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3u7wamjhun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 14:43:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1699656182; bh=6Dpt+noChcfj+FK4OzjVgPghYSjShNhYpgYgFXkpP1U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=M9dlWc0TBePoz/JMJCFJfA4a3SpKsz1YvimTWqzrT3/GlNLn1Z2Gkog2vvPRqHK3g
	 X98Kek00kpkeY04aaMQSg3GbLUQaaL1AmCKNYpkltQ7Pok6Eoe7xtW+3OKRv4kFEW+
	 shqxCLK7SEtdt0AKck5Ix+xFzAkpy2HPW0mShYY+Fiz4bLqZjVj0kCNPLey3vc6nZf
	 hL/dAH5QY0LBshT3xvkTUnQteOX/C88r0qKtu9xK4dWN4R7OXtkYh8Mdrt2myMfOf8
	 Gv/lUXlD84k9e+RA7IrCCfwIdCk6ajhhkZG0plxiH7icanWLR9GFsqvsKR5BS5cuUx
	 0IcUqryXywq8Q==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CD2E740121;
	Fri, 10 Nov 2023 22:43:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 097BBA00AB;
	Fri, 10 Nov 2023 22:43:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=QdPQjEV4;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C3F6240520;
	Fri, 10 Nov 2023 22:42:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEsL9zLhC4B+i1Yp1o/t4rYlpuiXvh3vEJgZQNRigXFvNhADt9ociz3MJu2f0zGDMbFYzA9EDgVn0dOdfpD6sMWOZC8/S3t7SQIrWC76V78O/VOPaTNir4hiX4iceVek07g/enrw2r8f5QiemZpGDxaRj8gbGqj0ImLU6t4YKZ2lOfnNPqPLviZQUs7DO4iIEQzWCKgvwKtqYw4ZUank/u+qPovWl8Phj+OcHK9QMxb2OWA9hfsZXQqzz3jsRQssMNGmCD+gUOl9LN0+f4HKgvygbeayMYlkvkn50MrhW3FqULKG4PxpFIy6H+2FnjHPkes74XCW5tajNQNSrzAa3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dpt+noChcfj+FK4OzjVgPghYSjShNhYpgYgFXkpP1U=;
 b=a4rYsqErR7MfXln3j+FfLyb3cpCrOHUgyLOQ+Via5e+Q1MNQ3ssER2r+xG/sWTernqPGiM2Xux4/U+jDf+EYUTE3uoL+2Fp3u74g1Jk4yw2x+JEhLenwc7jbhv1GMkJ3EIu96dLcH8UMQt7RnG0y1Z1k5PGorVfs3T97CyLK+hWepCF7zXRzrY5PwvtHTC6JR53bZt1Ig4CFwdUeFY50DaWdrPCwiKbixYvcDQ8vtKRIxYcbHMt9oyXdG4tvddymvke9Ig426FsvxGkyWnZfo5HxNPmKYHjtJ7nNEP4MniFFl/n96HQiwTF+5wvKFxcE5F6vYlkXFMgciD4zK7CD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dpt+noChcfj+FK4OzjVgPghYSjShNhYpgYgFXkpP1U=;
 b=QdPQjEV4/fwrWL4hYQ+D0mhMYIs7rtltuFVthG/V+cdpMmOFmOHOcjfmRH541wsKaInAECtAl85JtxC1fWqjGHCwYPQhxqOsD+OQMf2Gl6vRIJmxUdT7sJrPBzBzj8xwjTx/YqKxYD9bXEuRcBUKrbMEVeLL+mlcgQGRtE/cbx8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH2PR12MB4874.namprd12.prod.outlook.com (2603:10b6:610:64::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Fri, 10 Nov
 2023 22:42:52 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::4e1a:5b9b:db11:b40e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::4e1a:5b9b:db11:b40e%4]) with mapi id 15.20.6977.018; Fri, 10 Nov 2023
 22:42:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: gadget: uvc: reduce the request size to increase the
 throughput
Thread-Topic: [PATCH] usb: gadget: uvc: reduce the request size to increase
 the throughput
Thread-Index: AQHaE2U8RRnQzJTjj0ugR2ED8ucRQbBy0SiAgAFWOYA=
Date: Fri, 10 Nov 2023 22:42:51 +0000
Message-ID: <20231110224147.vranz2blmbpnsol7@synopsys.com>
References: <20231031231841.dbhtrgqounu2rvgn@synopsys.com>
 <20231109233341.2461129-1-m.grzeschik@pengutronix.de>
 <20231110021655.cgj2lk62p4ez7zhp@synopsys.com>
In-Reply-To: <20231110021655.cgj2lk62p4ez7zhp@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH2PR12MB4874:EE_
x-ms-office365-filtering-correlation-id: 21e809f3-2546-4743-c0f1-08dbe23e5f05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xBeuMarVk2+NvEaEEgvaZ+s+/+Uc7sb84cM2TLF3P+Bj5tQnVr58uXt9HQOKKVPEorf4/8od91fxN8Q3LmDTRqIS9KmkV2rj4dzNFC9fSn7Xpi8Kd2permNlhKpoplPukxfCkEJjaiaeLhv8zIYLeN3AU+teNiLsRhLf8bWfWBI9eIdxEXE95aKVp6md41korjEd2eSQLuqND6EFbJpWWQDKTlJq95x+QA20Oc8Msjwn9H/vhIHcNoPkoDgGfXBIT6utYyFj/jJTMibRVEbZyi2frsmdcMMIKAb76SXw+cPNaxZevFW8Ecyb6f43rDtZLgaxi1jRNGjZZHHa0/fwfI6X7woA8yU6wgJ9cbE4+immtupkBmY7at2pGyHhYf11PH/4Qb5NCZ1qq1og8BjO0olEA96/GAU5bG2/SlV/N2uwE0l6kJTt+nXLNdkXi0WUx3a2u+HjNNlZLKLhv6BZuF3Q2uEJaBLmjQgmy70E6p4QvfFXgWmmR4UtewIPfBz+ZtSts/QZ6JgM4dPmjs06jG2oOaUjQguJHw1C7PS2NrwQF7oGZwopkHzoH4TACiDHhE7SBW2r5+j8qFKAavD7+rdyFoezDkGw2EEM50L47ZQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(4326008)(38070700009)(2906002)(6200100001)(5660300002)(36756003)(6512007)(71200400001)(41300700001)(6486002)(6862004)(316002)(86362001)(966005)(8676002)(38100700002)(122000001)(2616005)(6506007)(66946007)(64756008)(478600001)(83380400001)(66476007)(54906003)(66446008)(26005)(76116006)(66556008)(8936002)(91956017)(1076003)(37006003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NDFIOWhjVUhUaHoyOWl6WnR1TmRtZ2Y4eDQ4bnNDVEZWcWxDY1FWOXBnL1Z0?=
 =?utf-8?B?elpyVlErVnhhZ2M3RXZrQlFVUFBPUlRRMGFRdVErb1FUWVhicHRUWFdqbm9m?=
 =?utf-8?B?SndNOHZ0N056QzZScE5KZGpyZ0lhYUk2RUsvOW9NK3Mzb2JXUU43eWo3aWVD?=
 =?utf-8?B?ME9pRTVZNHZKbm1qUmlRZ1FKdDhlYklGWXhSSHNIR0lNYk9oWWJWZHdrWnRW?=
 =?utf-8?B?Qm03STQ5S0xvNnU2Mk5BeWlQL0NTQ3NOczBxOUE4WWo1aWNRbWlmR1BJelVP?=
 =?utf-8?B?UitGUExIdlN0Rm1qRnpLMVI1dWpXNzgyeUNwVE9IK0t3NzlVWGMrN21jdkhD?=
 =?utf-8?B?b0taRGNDVlpUblhpdkh6SXdPWHlSUHRBeTVXN2MzZVFNT1B4V3B2MEtZS0k4?=
 =?utf-8?B?UkI3OExlNGhoSEEwcEVJTlk1Wm1jRmpQU1VvS2Uyd3JpekJIMDBkVjgwczZy?=
 =?utf-8?B?QU1EazBoNkRoR0lrdFJFS1A0UVVIdXpUb0lTNlpKZjNlTU1Kdnk3VVhteUVl?=
 =?utf-8?B?ck5tMjQwUk1RampwanFwbWZvcHh3TTVwKzVqL2pyb3BFSERhWmxaaFlITDVW?=
 =?utf-8?B?cjA5dmNMNFQzaWtRbGlnMUxzKytJL3FZYWI1dmMxWGZYYndtZWhpY3pJN3lp?=
 =?utf-8?B?d2o1enBweHBIUmYvVlJ0aTByRmQ5WXNqSWFyQVY1T1FZT3RkSGZYNkwxQnlj?=
 =?utf-8?B?UmVRRnAxdC9nS1Vza09uOTJva0pjWU16RzQrcCtjWGpqbWFtS3RJNTIxc3Bx?=
 =?utf-8?B?dlNPVWZJOWNlMDdrN2RQWWV2aG9ReEhDcGZmRnN2TmdYZ3o1WHE4aFl6UHJn?=
 =?utf-8?B?d3V1SFhyTU1UcThnOWl0WXF5ZFlPWE9vaXd0S3Y1VDBGWUJqVVN4aHc2akpU?=
 =?utf-8?B?K1BEUEVOcEZYeCtGSFRlZWNlMitFYVNMN296ZVVWeitPV29tV1haRlduUmFT?=
 =?utf-8?B?U2cvK2RHdlJUeFd1NWhhYllwZ1hFTldUQnNiN3ZkQU9hSm1wei9lbzNtdkVE?=
 =?utf-8?B?cDJiby9Ga2tLV2NOR2hWSnRpd1FTaW8wSlBPajFzMHVnbUJUUEpnZkpMaWQ5?=
 =?utf-8?B?VmtDTThsRWdNV0JvL2RBRE05ak90cjVJcGp2cmlOdTBnZWl6Vmk2WGhUYVd1?=
 =?utf-8?B?M3pYY0hvYU84LzFleStjLy9rOUcxUmxYdGNSYkxWWFBpSGdIQm8wcy9OUkly?=
 =?utf-8?B?LzluL3NMMWVMTm5ISm96M2pObUZxL1RyT1I2TGNZWGw1bGk2eHAwVEdNajhO?=
 =?utf-8?B?TzNXL0hmNXNSTGhZWjgrYWdrWDh3T2RqQ0NyUU5rUDJPMVFOQ2Y2RjY5Wlcv?=
 =?utf-8?B?RUU5ZWNOMHhhbWFmNmVuWEhPcjNoWndzbHRyVytrYVRmRXFiTUR4LzN0S3Qr?=
 =?utf-8?B?YmtnOVNRSU9rbzhJZXBDalJiYjhaM3E5QU1ma2FqUDkyQjUvTFZJWDFGTjNJ?=
 =?utf-8?B?eE0xWlhXMHVUQTUxRmdGZmMzSjBTNXd0Z3BJci9iMDNidUQ0dUlnanVnQnNx?=
 =?utf-8?B?LzJaWEpLd3grNExyaFNYakh2MytwQm5xYmJTSG8rckplME9TVVlOYXZCMGhr?=
 =?utf-8?B?RmdET0NKUGtnUnZIRnBXZTRGYlZINVJEMlZ6RzVybVFCTEszbC9OaTRYbC9o?=
 =?utf-8?B?WSszVE9iU0hHSGs0bW1SdDJJYmpqSFFSNkR2TlRhd2dWSEt1QlNkMDFwa2t1?=
 =?utf-8?B?dDlnckZEeUwzakl0dmMvNVRRaktUOGZQSGJkRTF3dDBQaCs5TnE2YUlOWTBk?=
 =?utf-8?B?OTVsdUphc21WeUUyUXFHOFBSNjJDYkJDaXdMVTY1T2lFRGpGS3d0cUpLdTJW?=
 =?utf-8?B?eWpyVC9VK2xWallwRk9UREVCMmpUbmlRdXFyak1NTkhWOU5ZMkFGbktEc2Iv?=
 =?utf-8?B?UW93N1lIR1p4OG9yeEJRQkJUOStVbVRRVGh5bnpsbWpkUXNHajliMmgxVERl?=
 =?utf-8?B?VzgxVWQwOFRrUURRWWV2ZDJYb0M5RjdOOWlNU2dxbnVCWG1OVzd4ajNRY0w4?=
 =?utf-8?B?cStXS0R6SjBQSFNWVmNXZHM4M2JmNy9RbHRLUHRGWmZnZE42TnJaaUZKZ2xG?=
 =?utf-8?B?TXA1N21WdWhsUGF0Zk5aWnVnc0dxa2h5YmVzNFk0ZVphS2xCdjVWeG5lMGRW?=
 =?utf-8?B?TGYxa2JuakhmM1JNMWtFN1Q3ajVQTWVJU3RjMDhub0J3TGcxNkJLTHNIdndF?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <965213D1185D6D4884B7BDF2FC319575@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?QlJ1QmRyekZkNnVBTDk4Ukk5L1ZzVVdSd0pqbjN0MU5WYzA5S1ZrQUVHQVUz?=
 =?utf-8?B?ZFZ6K1JQWHd0NUpTSjBKSXozR2hQWmN1NDZieWFTU2tDNWdlYUZjL1M1bm01?=
 =?utf-8?B?Z2l3MkZjM29xM1JISXRvUGIzVm9aT0VKYnF6ajJYazRlMGJna1hUUndITXg2?=
 =?utf-8?B?YTlWSlM4eUJ2aks0YjBsNUhYNVpTQ0RxMlN1WWdPZHh1N3VtRFBJeWcySCtJ?=
 =?utf-8?B?dFpVS3pDYmxjUlpoamxCZ21ZandEZnl1MWJhSXlNejE3czRETFpTWFlJTjg4?=
 =?utf-8?B?ekhsaVN0OXFGYkJKanMyTXZ5WXJWekZRaDFEYUFPbUxjQW10d2NNVWsvNVJE?=
 =?utf-8?B?bHpCeDByRWhldXc5c09SZjNMU2VBQmd3YWVsMEFRall6K0NiVlRWSUN4VjVI?=
 =?utf-8?B?R2NWbzZXWGJHZ0VMSkdCSWp6OEFXSStYTHNhNnlCZ1RmTXlRNmUrd0FpZWtF?=
 =?utf-8?B?NDZ2MVFqemFwVlBoOVNqZDJGTmV1NlBGRFlSUFM1emQ1S05tMDBJT1RnQ25M?=
 =?utf-8?B?T2YzVTI3Mjc2elpSSWFGTUQ3OWdBZVBJZ1c5QjArTHNrTnhoMXBLT21IbGJQ?=
 =?utf-8?B?ZzBQaDJRUEFlcWRXMTFuSTE4UkZwK1hVT2g0eDhzMUpHVk45SkZQaFZwZVFK?=
 =?utf-8?B?ejlSUjU0VlRBbGIrZklXTUFJditsMW1mWVBzaG1JbUFyd0pUdGVIWGtpUTY2?=
 =?utf-8?B?RGNIUDhrQ2t5RG8za2I5VXIxbHdkN2ZwaC9rS3VmUHN1dEI0SGNaNUE0eHQv?=
 =?utf-8?B?UFkrWlQzZzVodUNrd0E0YUpUdHNDZ2JlVldOWVovemkrRCtCUEdtQnVhRjdR?=
 =?utf-8?B?alI3T0VRNGxkOC9mZVhJZ0Z1ZmV2U3ZSUkxZVkEwQ0xjNlVmTGJtTHEwK0lh?=
 =?utf-8?B?TTRKRHVMcWYrQmJhV3QydjEvOWVReEJhaTdHSGxUR0RLWC94Y3BkcUNkdjR5?=
 =?utf-8?B?ZVBPVnR2TGdISjIwSlROZFBnUzk3NmViejlYckViYk9sd3p3bm1ST2pMZkwv?=
 =?utf-8?B?enBtYVdOTHBqRmd1eXF5OExML3IwS3Mxa1ZLcWU4RTM4d0RyZjBXS2FFSUJl?=
 =?utf-8?B?UjgySjJQMFUwYWZMVDJHS0NEY2xZNndvRlN2MVlCa2s3WU9Td2JnU1MzODla?=
 =?utf-8?B?aTlMeVNBblgvSlY4bFpWdk5qc1JWbG5yZFlEN1FEZnY4OE4zVmxsWHg1MlJv?=
 =?utf-8?B?SDRLNUNETml0ZDZBQldhc1VLcmVjUmJ2N0dJRHB5RXM0ZmM3Q05JcUpHcWxH?=
 =?utf-8?Q?pVLdGp34x69/dZE?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e809f3-2546-4743-c0f1-08dbe23e5f05
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 22:42:51.2691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBEGGuuAFixJ/dklAt2Ps9cgd4gtc4bjTyDjdXVoVsejJSjZxiHiAr9N21zkbK3UMq/FUgVP1kpWCGLkupjs9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4874
X-Proofpoint-ORIG-GUID: 0MrGQNK4TbUwJrBvzhDOrlonaen2M3NT
X-Proofpoint-GUID: 0MrGQNK4TbUwJrBvzhDOrlonaen2M3NT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_21,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311100190

T24gRnJpLCBOb3YgMTAsIDIwMjMsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biBGcmksIE5vdiAxMCwgMjAyMywgTWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+ID4gT25lIG1p
c2NvbmNlcHRpb24gb2YgcXVldWVpbmcgcmVxdWVzdCB0byB0aGUgdXNiIGdhZGdldCBjb250cm9s
bGVyIGlzLA0KPiA+IHRoYXQgdGhlIGFtb3VudCBvZiBkYXRhIHRoYXQgb25lIHVzYl9yZXF1ZXN0
IGlzIHJlcHJlc2VudGluZyBpcyB0aGUgc2FtZQ0KPiA+IGFzIHRoZSBoYXJkd2FyZSBpcyBhYmxl
IHRvIHRyYW5zZmVyIGluIG9uZSBpbnRlcnZhbC4NCj4gPiANCj4gPiBUaGlzIGV4YWN0IGlkZWEg
YXBwbGllcyB0byB0aGUgdXZjX3ZpZGVvIGdhZGdldCB0aGF0IGFzc3VtZXMgdGhhdCB0aGUNCj4g
PiByZXF1ZXN0IG5lZWRzIHRvIGhhdmUgdGhlIHNpemUgYXMgdGhlIGdhZGdldHMgYmFuZHdpZHRo
IHBhcmFtZXRlcnMgYXJlDQo+ID4gY29uZmlndXJlZCB3aXRoLiAobWF4cGFja2V0LCBtdWx0aXBs
aWVyIGFuZCBidXJzdCkNCj4gPiANCj4gPiBBbHRob3VnaCBpdCBpcyBhY3R1YWxseSBubyBwcm9i
bGVtIGZvciB0aGUgaGFyZHdhcmUgdG8gcXVldWUgYSBiaWcNCj4gPiByZXF1ZXN0LCBpbiB0aGUg
Y2FzZSBvZiBpc29jaHJvbm91cyB0cmFuc2ZlcnMgaXQgaXMgaW1wcmFjdGljYWwgdG8gcXVldWUN
Cj4gPiBiaWcgYW1vdW50IG9mIGRhdGEgcGVyIHJlcXVlc3QgdG8gdGhlIGhhcmR3YXJlLiBFc3Bl
Y2lhbGx5IGlmIHRoZQ0KPiA+IG5lY2Vzc2FyeSBiYW5kd2lkdGggd2FzIGluY3JlYXNlZCBvbiBw
dXJwb3NlIHRvIG1haW50YWluIGhpZ2ggYW1vdW50cyBvZg0KPiA+IGRhdGEuDQo+ID4gDQo+ID4g
RS5nLiBpbiB0aGUgZHdjMy1jb250cm9sbGVyIGl0IGhhcyB0aGUgbmVnYXRpdmUgaW1wYWN0IHRo
YXQgdGhlIGVuZHBvaW50DQo+ID4gRklGTyB3aWxsIG5vdCBiZSBmaWxsZWQgZmFzdCBlbm91Z2gg
YnkgdGhlIGludGVybmFsIGhhcmR3YXJlIGVuZ2luZS4NCj4gPiBTaW5jZSBlYWNoIHRyYW5zZmVy
IGJ1ZmZlciAoVFJCKSByZXByZXNlbnRzIG9uZSBiaWcgcmVxdWVzdCwgdGhlDQo+ID4gaGFyZHdh
cmUgd2lsbCBuZWVkIGEgbG9uZyB0aW1lIHRvIHByZWZpbGwgdGhlIGhhcmR3YXJlIEZJRk8uIFRo
aXMgY2FuIGJlDQo+ID4gYXZvaWRlZCBieSBxdWV1ZWluZyBtb3JlIHNtYWxsZXIgcmVxdWVzdHMg
d2hpY2ggd2lsbCB0aGVuIGxlYWQgdG8NCj4gPiBzbWFsbGVyIFRSQnMgd2hpY2ggdGhlIGhhcmR3
YXJlIGVuZ2luZSBjYW4ga2VlcCB1cCB3aXRoLg0KPiANCj4gSnVzdCB3YW50IHRvIGNsYXJpZnkg
aGVyZSB0byBhdm9pZCBhbnkgY29uZnVzaW9uLCB0aGUgaGFyZHdhcmUgVFggRklGTw0KPiBzaXpl
IGlzIHJlbGF0aXZlbHkgc21hbGwsIHVzdWFsbHkgY2FuIGJlIHNtYWxsZXIgdGhhbiB0aGUgVFJC
LiBJdCBzaG91bGQNCj4gYmUgZmluZSB3aGV0aGVyIHRoZSBUUkIgaXMgbGFyZ2VyIG9yIHNtYWxs
ZXIgdGhhbiB0aGUgRklGTyBzaXplLiBUaGUNCj4gaGFyZHdhcmUgZG9lcyBub3QgInByZWZpbGwi
IHRoZSBGSUZPLiBJdCBqdXN0IGZpbGxzIHdoaWNoZXZlciBUUkIgaXQncw0KPiBjdXJyZW50bHkg
cHJvY2Vzc2luZyAoSSB0aGluayB5b3UgbWF5IGJlIG1peGluZyB1cCB3aXRoIFRSQiBjYWNoZSku
DQo+IA0KPiBUaGUgcGVyZm9ybWFuY2UgaW1wYWN0IGZyb20gdGhpcyBjaGFuZ2UgaXMgdG8gcmVk
dWNlIHRoZSBVU0IgYmFuZHdpZHRoDQo+IHVzYWdlLiBUaGUgY3VycmVudCBjYWxjdWxhdGlvbiBp
biB1dmMgZnVuY3Rpb24gY2FuIHVzZSA0OEtCL3VmcmFtZSBmb3INCj4gZWFjaCByZXF1ZXN0IGlu
IFN1cGVyU3BlZWQsIHRoZSBtYXggc2l6ZSBmb3IgaXNvYyBpbiBTdXBlclNwZWVkLiBJIGtub3cN
Cj4gbWFueSBob3N0cyBjYW4ndCBoYW5kbGUgdGhpcyBraW5kIG9mIHRyYW5zZmVyIHJhdGUgZnJv
bSB0aGVpciBoYXJkd2FyZS4NCj4gKGUuZy4gSXQgZ2V0cyB3b3JzZSB3aGVuIHNjaGVkdWxpbmcg
dHJhbnNmZXJzIGZvciBtdWx0aXBsZSBlbmRwb2ludHMgYW5kDQo+IHVuZGVyIG11bHRpcGxlIHRp
ZXIgaHVicykuDQo+IA0KPiBUaGUgYmFuZHdpZHRoIGNhbiBiZSBpbXBhY3RlZCBieSBtdWx0aXBs
ZSBmYWN0b3JzIGFuZCBub3QganVzdCBmcm9tIHRoZQ0KPiBnYWRnZXQgc2lkZSBhcyBub3RlZCBp
biB0aGUgZGlzY3Vzc2lvbiBiZWZvcmUuDQo+IA0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggaXMgc2lt
cGx5IGRyb3BwaW5nIHRoZSBtYXhidXJzdCBhcyBhbiBtdWx0aXBsaWVyIGZvciB0aGUgc2l6ZQ0K
PiA+IGNhbGN1bGF0aW9uIGFuZCB0aGVyZWZvciBkZWNyZWFzZXMgdGhlIG92ZXJhbGwgbWF4aW11
bSByZXF1ZXN0IHNpemUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBHcnplc2No
aWsgPG0uZ3J6ZXNjaGlrQHBlbmd1dHJvbml4LmRlPg0KPiA+IC0tLQ0KPiA+IFRoaXMgcGF0Y2gg
aXMgY3JlYXRlZCBhcyBhbiByZXN1bHQgZnJvbSB0aGUgZGlzY3Vzc2lvbiBpbiB0aGUgZm9sbG93
aW5nIHRocmVhZDoNCj4gPiANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzIwMjMxMDMxMjMxODQxLmRiaHRyZ3FvdW51MnJ2
Z25Ac3lub3BzeXMuY29tL19fOyEhQTRGMlI5R19wZyFmVGFJbzR0RGxqU2JFdlVZNVNaTGtOdktX
Y3owWWVOMEVrenMwQ1BXeUQ3M1JHUm1FclJDMmZyT0RGZ25NQjFNNE5zZTBvS0tnd3hDNjVnZVBo
R0F0YXVLSnExVm56bGokIA0KPiA+IA0KPiA+ICBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24v
dXZjX3F1ZXVlLmMgfCAxIC0NCj4gPiAgZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y192
aWRlby5jIHwgMSAtDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y19xdWV1ZS5j
IGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y19xdWV1ZS5jDQo+ID4gaW5kZXggMGFh
M2Q3ZTFmM2NjMzIuLjFkM2MzYzA5ZmY5N2NiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNi
L2dhZGdldC9mdW5jdGlvbi91dmNfcXVldWUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdl
dC9mdW5jdGlvbi91dmNfcXVldWUuYw0KPiA+IEBAIC01NSw3ICs1NSw2IEBAIHN0YXRpYyBpbnQg
dXZjX3F1ZXVlX3NldHVwKHN0cnVjdCB2YjJfcXVldWUgKnZxLA0KPiA+ICAJc2l6ZXNbMF0gPSB2
aWRlby0+aW1hZ2VzaXplOw0KPiA+ICANCj4gPiAgCXJlcV9zaXplID0gdmlkZW8tPmVwLT5tYXhw
YWNrZXQNCj4gPiAtCQkgKiBtYXhfdCh1bnNpZ25lZCBpbnQsIHZpZGVvLT5lcC0+bWF4YnVyc3Qs
IDEpDQo+IA0KPiBJIHRoaW5rIHlvdSdyZSByZWR1Y2luZyBhIGJpdCB0b28gbXVjaCBoZXJlPyBB
bHNvLCB0YWtlIGFkdmFudGFnZSBvZg0KPiBidXJzdC4gU28sIHBlcmhhcHMga2VlcCByZXF1ZXN0
IHNpemUgdG8gbWF4KDE2SywgTVBTICogbWF4YnVyc3QpPw0KDQpJIG1lYW4gdG8gcG90ZW50aWFs
bHkgY2FwIGF0IDE2SywgaXQgZGlkbid0IHRyYW5zbGF0ZSBjb3JyZWN0bHkgdG8NCmNvZGUuLi4u
IEkgbWVhbnQgc29tZXRoaW5nIGxpa2UgdGhpczoNCg0KbWF4X3NpemUgPSBtdWx0ICogbWF4YnVy
c3QgKiBNUFM7DQpjbGFtcChtYXhfc2l6ZSwgbXVsdCAqIE1QUywgMTZLKTsNCg0KPiANCj4gQ2Fu
IGJlIG1vcmUgb3IgbGVzcyBkZXBlbmRpbmcgb24gaG93IG11Y2ggdmlkZW8gZGF0YSBpcyBuZWVk
ZWQgdG8NCj4gdHJhbnNmZXIgb3ZlciBhIHZpZGVvIGZyYW1lLg0KDQpDYW4gdGhlIHV2YyBnYWRn
ZXQgZmlndXJlIG91dCB0aGUgbWF4IHZpZGVvIGRhdGEgb3ZlciBhIHZpZGVvIGZyYW1lPyBPcg0K
aXMgaXQgbm90IGF2YWlsYWJsZSBhdCB0aGlzIGxheWVyPyBJIGZpZ3VyZSBkaWZmZXJlbnQgc2V0
dXAgcmVxdWlyZXMNCm1vcmUgdmlkZW8gZGF0YSBwYXlsb2FkLg0KDQpJZiB3ZSBoYXZlIHRoaXMg
aW5mbywgdGhlbiB5b3UgY2FuIHByb3Blcmx5IGNhcCB0aGUgcmVxdWVzdCBzaXplLg0KDQpUaGFu
a3MsDQpUaGluaA==

