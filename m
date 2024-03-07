Return-Path: <linux-usb+bounces-7622-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA79874536
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 01:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7EE1C21E23
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 00:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76674A1C;
	Thu,  7 Mar 2024 00:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QQ+p/eNb";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cHhbO+yD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ctn0+PHJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07011849
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 00:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709772057; cv=fail; b=QirLrJzpGHYyHi20SFXIFXhHO8TJs6MGgfYHcGbb1ka0OaEsAa/4aTMj6aLmSidgUiu5tk8jNC188Dz2foynTRQweHAWnej1wuOCsO7rQ+7sMNvJeDTpO2r/JUrfV4D8FooGy21EdeF7PYiDgBSjJc64j+9axurGOn1JbTzMcFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709772057; c=relaxed/simple;
	bh=gMbxyYoTS9j8bzdt6OpBt1l30lB8jq+Nazp0HCkq2So=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r+xreda4L1WaChgU75GqFU6ZSAgv6JZZ1nL7HgVCKpnjCjdZOcuMlQwsFP4W0L6lRLBm0PNKB5gJN0dgQKa51LxseXrmtVQYcnICADAB3PEVngmySKQsr/4Zs1zx9m/eXKhg6RaBLBn/ikWme3DSe+2RA3q5FFa2hi1mwvbe4pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QQ+p/eNb; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cHhbO+yD; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ctn0+PHJ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426KUKj0012405;
	Wed, 6 Mar 2024 16:40:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=gMbxyYoTS9j8bzdt6OpBt1l30lB8jq+Nazp0HCkq2So=; b=
	QQ+p/eNbh+Vy2w8GtgeT2G5LyVFwgVUOmQz82D+fjpQ/naREZ6SdMLTF9UBj/7bD
	BbsBa2H6+FTh+xTJo+cpRGrxDppuHx0Wurm5j4PTwzWwAytrKKwjCTFcZu0nYQP8
	npwTvdqKOv7omq+hYH2Gxr6yspTxwRYfNjasBLT969vMzSOhgFpJDU2ry/OFATBc
	XxbSfduxa47rhSLiEdbNo5UFkUnGhjZQpZAraFe0U6bsaqbK2GflGskQCoFK6yzu
	4UP1r/GIziArh9yETHY0fM19FF5duSRqo94lwhpvYDPjAGAG9d0fDiTb1+1f9Nft
	JOcTIQvoUefHcJVwQderlA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3wm3mhktkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 16:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1709772014; bh=gMbxyYoTS9j8bzdt6OpBt1l30lB8jq+Nazp0HCkq2So=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cHhbO+yDsxHzL2B26595WszrvwElBQ6LPjCof0e08bl3Vbr7sfPM0Mob9bMmjUlpL
	 we8+ep2AWO3ol1LrnFjj+F1CPLwiu1xFYlb0ZY9Nn9x8DIIFd+UQhh9F+T2dcNigGF
	 TkJNNw1wrY733VX9anzf3R37dRpyOC0sM6EkOzapWPdL8h4veXXTP2a2jUVUNCmT00
	 gUYXePAleOxuEGSjGfjpR1aSBdakHT6Tgl7FN4FPnWh2SCQtu1eTxzaW06/GEtW2D9
	 Sd8f1dfVdEKf5ZxmUIVv75Mv1aok4hJA8mDW0qTeiuZKd6rvCsJ6QHqSybZTrQnTbq
	 giSyfi8thsBuQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3F66D4035A;
	Thu,  7 Mar 2024 00:40:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 58A8BA005C;
	Thu,  7 Mar 2024 00:40:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ctn0+PHJ;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 724DB401C4;
	Thu,  7 Mar 2024 00:40:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNsjsg729Db7DfFx2MjIx2FybbZIUwGPwSYZRRI0sxdujugNU3NnlkWNtv0nwTwFUdhGmjTTMaaSMfGg8coefC7iS6mF1ovJOAWKHbqLstspyJbnT2mtrrEjh33ALUOmPw1nIock2zLzScLHHI7jqSVTfbgBXpWYwXvnjb9oQoo/Ej/SuzawPVjUI3cicEUgzOGFKvzvUD24bfNyJVw1zB8aq3RmdgvLnRHwBvCvPLYbrW9vSB+vdy21woYY9NXxuYa0omdHFzOJRjTOm/Fi9Zcu1zntwwo0xVrLwavMR+7QPSqTCBJGdHHTVQ70d7DdlZRh62uPMveUULqFVeCwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMbxyYoTS9j8bzdt6OpBt1l30lB8jq+Nazp0HCkq2So=;
 b=eTg5c0EzluvvyKjzHHSI11ZPlcWHyEwKcd1z62SvueifqpgqqqgUGjY5mrpMnfxB7n7xs0EvsxVmfhEisg0PhkLGoIcj+Y7iuyXHhG96lxULT1EkmY8IqrO7oW1LgGxEDTMYMzyFrrV+nTlxruxpusr9EiIl/Kh+kh76ITQH3/2rfcbFoJ5WVNNA7ikP7XNlM2TLCXJ8XNYkTVeQzCCaFEu9TmLJ6DMnqF8wSKcGWRphPS8uil0PIgJy8WLk+P2TrjklJ4v2d+ljx6G3G9M+3wvAYOyTsnhmx4V5R16VjVx41KrBTCbjCQGPuER/Cg1WNCJIjRWfo7pZtpeP3TjMyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMbxyYoTS9j8bzdt6OpBt1l30lB8jq+Nazp0HCkq2So=;
 b=Ctn0+PHJR+QotN4kdir8otRhHaoTIesAJQRL7HliJUWufRe2moVIGpumBJWITcuUcc/CnQHWxc6QOi0Epedy/kPvUJ6hHWe87/awEpRqGyx3BNVV6T1nvyG+uh1boChH/wXF8h+m1tgKHEH8DMd8dGP4Qk9GI2vqzPONN/YG8z0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 00:40:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c%3]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:40:08 +0000
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
Thread-Index: 
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4CABdZRgIACH0WAgAi5FoCAAkh6AIACnmOAgAB3LICAAN6oAIAHFi2AgAB/wICABATrAIAAF8SAgCauMwCAA7YYgA==
Date: Thu, 7 Mar 2024 00:40:08 +0000
Message-ID: <20240307003955.js57ik6cuxhhsae3@synopsys.com>
References: <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
 <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
 <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
 <20240208235300.pjife5zxfz5onqvk@synopsys.com>
 <b9495221-54be-ae5d-774a-f1450290b104@igalia.com>
 <7594701a-34d7-579b-6c9c-05a18d3ab651@igalia.com>
In-Reply-To: <7594701a-34d7-579b-6c9c-05a18d3ab651@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB7697:EE_
x-ms-office365-filtering-correlation-id: 75c7ad3f-01b9-4d16-1228-08dc3e3f239d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 C6h68QEaINGBhVvnLIpeEDXOXxiJ5DmSAYUFTW/ZjspGQfcSnIxDSPYHqJjAm6YzkUMZse1qp4eCab8LXZjn6fylCu+kSL+A4zrsp0cSAwYr/ZYvSg6PeDYi+5j9Ht0ScIoqamH+uEe9BUjRdVqz2PZW052bru5OmgVRfOvwfChCQfmG5+TYzHqSYMBv2o0mEOXHtdeUMGxoOJl++bAjQSaxnvHTjXoeSdLKQPv9ULZIbRMzT2zXb5PWz1/dIf5dwD/s74Ao8UZH8weQyeioLDQhxqTDdgElua7EvMusbnzEwmdaDvybsSdRpOp+buhpwjbgRG1OqOrHjzqx+uhY9dcHVjP+++njzb2kQUcFLjEHOcXKVOjfON0QpcBqA8E6P1pJW1iEuO/Lgu1S+5bn0VWvyu/8+TrvjphJneyZCo4UMhf7dEavdECni1rDlzAjHOkGxu/bq76azHkBcWtwPksk2uGxE9lXH1WcmdEacoUnjRk0vOlQoBAJe8rus/QduX3hvi28lzwOZ732YlIJ0H4RfrsdIuQaDxcHgymelbS4hD2Nbjs+nBaWfsi4aXVrE3r/UQW+GictRRVA9DOYJY0uRLw2RRSYDPWpESDXJSDVs5Mwz+HD6rAVwbCORGoE2LMGAFSb/YlrB/xHO1Aex2GCsnS1iU8aOvm4yQOrQ0PSLDtogxAa4VbURANxPne/1jmkA4uRLWvREO84SLAPJyJD2q4bn5iV6fAGDVlyWhM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eFhCVFBxcHJjOGdFWGREaWNyNzg5Tjg2NFBoVGtoMWVEdWgvNkdKMGxIVTVQ?=
 =?utf-8?B?S3A2VXo1aWRNdlBIa0tsSWhya0dEelhtME14K3ZDMWxFVWVTSjJBS2JJcU9I?=
 =?utf-8?B?V2p4bFNUNlVsNjVvU1RsQWhOME5tOWk5RytLRlhMTTRLK3V5bFpzWU93M2g0?=
 =?utf-8?B?OTlkYjQ1cmVqSm5PYUpSVWo4RHEzLzd3MTlDdXgwelE2dkJMRkJyUkl0eExk?=
 =?utf-8?B?Q0RKVlRaUjJRQk1zcGtTSXM1RnF5L0xJY053Q3l6ZHArVzMzUk5MeG1lUkgx?=
 =?utf-8?B?TmdRdkFuYlovQ3RFV3dsZHVoaFRrandXdHdrREZ3UnFDbGw2amdjMWNSTGpq?=
 =?utf-8?B?ZElFOXRSOCtnMlRweG1uaUZpMjM0MUV3VG4zY0Q0cEZIbDR0RWU0Y3VpZDNm?=
 =?utf-8?B?SHY1Z3lSMWZyRnFCYXlFRHRLNHhzZmcyNVg3ZXNZYkNKM2RKTERITHNkdXJh?=
 =?utf-8?B?NzMzL05MNmZDUTZBSXpkdTdLVElzZG1Mci9PT3c0ZWkyN3R3OW1MS1B5TjBp?=
 =?utf-8?B?dHZyaE5YMmtYYjg1Zk1pWmVJOUZDZ2lPaDEvNDVVdXZuSXhLVTQ0TG92Qmxq?=
 =?utf-8?B?akFocnoxT0VEdE5Lb0VzS3Azbm9jdUp6K2hFRENKWWJQQ2dFMzNvOUxwYURu?=
 =?utf-8?B?MFdOVysxc2xUZk9lTHdpTXFOUFhTQmpVbnFDUlV3RUZteFA1R2hKK3FoMFo3?=
 =?utf-8?B?N2pxa29BZExMTnA4VlNqZ2tpK1Z3bmFYTU1qVitxSDA4TUo2UnNHWjN4SU56?=
 =?utf-8?B?a211dTBZclpQNnRWa0tWem5XTXVtSENmOXhUaGhNWGNLWkdERXhVSzJvcHRr?=
 =?utf-8?B?cEhsTUVHaSt1NVF3QXVnOUp1cXRwdXBINWZKUUhiczVVSS92L2V3VWlhc2Y2?=
 =?utf-8?B?K2RyUkxMa1lJUHViSHBpSHZlaExwSjREMFdCNWswRHRlbVhzYVllaHFGMzQy?=
 =?utf-8?B?c2p3TDNnM0lOWjNIUDRSSzhVWEV2VEZTb2hIK0lWa1dqRVlsNFdrOXVBeWo2?=
 =?utf-8?B?UjhwbDdHck1WWWl2KzNUa3NlVVNmeFY4Zm5UYStIL0o4ZTN6aG5MM1V6Y0Fh?=
 =?utf-8?B?VitHcmpoNXAvQk0xQlNsa0EyaHQrdkhmSlBmL0xMVXhMSWs0ODVua2NDZXVs?=
 =?utf-8?B?c2Q5UWRJZ0tPc0MwZ0lGN01nKytPODFISWZDY1MzYUhsaFo4MmE2OGYrVTJL?=
 =?utf-8?B?OGxYY3hPQ1Y3dlZZRWJDUG1pYmk1WGNoTCs0aHkyTi82dURLVDhMMGxSWXBE?=
 =?utf-8?B?ZUpIRHVUWXdnMVkvMjRneDlwcjZabkdCc0o4VGlxOFc4RmxvUEZzMkxYZDRP?=
 =?utf-8?B?OG1YVktQREkvSHR6TjEyaE9tK3F0R2REcjVYTnZHQU9kU1h4bmZkVlgxYkNT?=
 =?utf-8?B?LzllTkR5Z1dBWG1WNkZGODNTN2ZhTFBOcTc1SWd5Tm5zSFZ2T2xkdWJTOE9X?=
 =?utf-8?B?a2lMT0JYWFp6Y0pwL0FFRFF3VVdJejIwdzlhTGJXb01OK1JvZ2RtckVERjUw?=
 =?utf-8?B?RG5BRUtLOU1NUm1uR3Rqcm5UUkowdDRWb05KZnBDZG5LbWY5WjMzT001UlZs?=
 =?utf-8?B?RjJaRm1XekNsQ0xSdVpmOGtHSDRwNkFwT01ETWlwOGZsWWdmL3BwYmpQckhr?=
 =?utf-8?B?MFZuQ2l5NXROL0VSL2Rrc0xybmhyVlEyTk4zeVhmeGt4dXVTQ25vcEV5ZFVl?=
 =?utf-8?B?TmQwV0h0OFJEeEJpK1AySEo5NldpaDlSN0MzYkFzRlQzUjNPOWo3bC9OOUR5?=
 =?utf-8?B?OG03Z2FjdDlVTytzVUZCNEh5NnVVcFloZGVMNHVsbUNVall0NmZrd1FPZGhM?=
 =?utf-8?B?WUM0OUtNTnd6dEpMQ2ZrL1JaaW1EVWNQT2gwNzNRcEJzNTBKcVhlRndoeWJ1?=
 =?utf-8?B?eXljNGI5U08zU3FNd0xNZ0tiSzBIcUlralFnTit4bFRMbFNEZGM0MXNUOGp6?=
 =?utf-8?B?RElMRWtLVndnSkpNcEROV1lSa1NlRmh5ZFVHcHo0MzRmbFg2WTNRNXF3djZI?=
 =?utf-8?B?c0huTUowd3JuTGpXUXZDU2ZKcmpmMzUzaGhHbkxxNy9qT3NPQ1ZQeFdwYkxW?=
 =?utf-8?B?SmNOMlpZaWRKWXdPd1BlRElYdDlqNHBkVzdjd0srUUowbWEyeS8rM3NiQWJs?=
 =?utf-8?Q?K6VBUCPjCD+RWV1N80/RdEVY4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <432E49BB0E62B04C8823DA6BB54BE236@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	CX7hqy2sU8QD7Rf3VOqYtowpESkMWf94xWsJywpXCoBSUIULk92sSsJ4gOmpYqqe3QyVcXQ39OPAoUIuqrbhg5kLUa1+jsGVQtCtpt7qdkXITVcgRSyaWUVF9OvK3sbXlvZLEgSYM88C/6MiU5GwvNrnygsVbfMBCQ7dlUxGTWfWgVqhyhVXPY8UVQZmisM4WtfLp7dWlbE9ve7qe/3gtv2yaj9AKYEeRlsmk+w2T7Sz7fH5OF3fObJi5rx7fCdQ86cm5AlsL4ZOCjcd+PQJ7FlLeLwGT06rjYCnds7RI55srjd5ACwLPRPvQOn2vMnUKMPMbTxiR5yV8f3jvqJwIOF5LwELHSWYKhBYDs2F7O+E7O9e0ZXiPTnjuN7BsWUrZ2b/ipwV9aAoeeRZzhTDb0KpMyS12NfbU7f/EVBUEnQcGaOngYL+dNQRNLUvc8dgoa2TmxhaOiBKhWYbg8ECzF/xVqSowR4Ztdazc3kHPC/s0r2zGDmUXB17YMgKXRpO6B2WS2Mn2YSZKd99VGoTlA70FBmJOyuBom18IYD7fdDAsjwEf+Bf55X3Yb4gItOJPXtf8s6qi1eDr6NUz1K5QToZWPq1EpWaL35mdAszHdagJrhi+xwybE84Hkca1NCv3FCymKdBSvMfsN7/oBJWeA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c7ad3f-01b9-4d16-1228-08dc3e3f239d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 00:40:08.0893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOGttCs/bKib7f/6yDNq9XngDc7Qt4+BV5NWd3iip8pXOsZ/EX9JmUYdcIXGJdHPWE6sOjiISv1QLJZlqJ0bjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697
X-Proofpoint-ORIG-GUID: bop6vjA5siQnF_bRc8jDLsSFfjhE8ids
X-Proofpoint-GUID: bop6vjA5siQnF_bRc8jDLsSFfjhE8ids
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_13,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403070002

SGksDQoNCk9uIE1vbiwgTWFyIDA0LCAyMDI0LCBHdWlsaGVybWUgRy4gUGljY29saSB3cm90ZToN
Cj4gT24gMDgvMDIvMjAyNCAyMjoxOCwgR3VpbGhlcm1lIEcuIFBpY2NvbGkgd3JvdGU6DQo+ID4g
T24gMDgvMDIvMjAyNCAyMDo1MywgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+PiBbLi4uXQ0KPiA+
Pg0KPiA+PiBUaGFua3MuIEkgaGF2ZSBzb21lIHN1c3BpY2lvbnMgb2Ygd2hhdCBoYXBwZW5lZC4g
SSdsbCBjcmVhdGUgYSBwYXRjaCwNCj4gPj4gYnV0IEknbGwgbmVlZCBzb21lIHRpbWUuDQo+ID4+
DQo+ID4+IFRoYW5rcywNCj4gPj4gVGhpbmgNCj4gPiANCj4gPiBUaGFuayB5b3UgYSBidW5jaCEg
TGV0IHVzIGtub3cgd2hlbiB5b3UgaGF2ZSBhIGNhbmRpZGF0ZSwgSSBjYW4gdGVzdCBpdA0KPiA+
IHF1aWNrbHkgaW4gdGhlIFN0ZWFtIERlY2sgPSkNCj4gPiANCj4gPiBDaGVlcnMsDQo+ID4gDQo+
ID4gDQo+ID4gR3VpbGhlcm1lDQo+ID4gDQo+IA0KPiBIaSBUaGluaCwgaG9wZSBldmVyeXRoaW5n
IGlzIGFscmlnaHQuDQo+IA0KPiBMZXQgbWUga25vdyBpZiB3ZSBjYW4gaGVscCBpbiBhbnl0aGlu
ZyBvciBwcm92aWRlIG1vcmUgdGVzdCByZXN1bHRzLA0KPiB3ZSdkIGJlIGdsYWQgdG8uDQo+IA0K
DQpDYW4geW91IHRyeSB0aGlzPyBJIG1hZGUgc29tZSBhZGp1c3RtZW50cyB0byB0aGUgcHJldmlv
dXMgY29uZGl0aW9uczoNCiogSWYgb3BlcmF0ZSBhcyBkZXZpY2UgbW9kZSwgb25seSBhbGxvdyBz
eXN0ZW0gd2FrZXVwIGlmIHRoZXJlJ3MgZ2FkZ2V0DQoqIGRyaXZlciBiaW5kZWQuDQoqIE1ha2Ug
c3VyZSB0byBwYXNzIHRoZSB3YWtldXAgY29uZmlnIHRvIHRoZSB4aGNpIHBsYXRmb3JtIGRldmlj
ZSB3aGVuDQogIHN3aXRjaCB0byBob3N0Lg0KDQpJZiBpdCB3b3JrcywgSSdsbCBjbGVhbiB0aGlz
IHVwIGFuZCBzcGxpdCB0aGlzIGludG8gMiBzZXBhcmF0ZSBwYXRjaGVzLg0KDQpUaGFua3MsDQpU
aGluaA0KDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5jDQppbmRleCAzZTU1ODM4YzAwMDEuLjYzMjAyYjE3NDhkMyAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuYw0KQEAgLTE5NzcsNiArMTk3Nyw4IEBAIHN0YXRpYyBpbnQgZHdjM19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIA0KIAlwbV9ydW50aW1lX2ZvcmJpZChkZXYpOw0KIA0K
Kwlkd2MtPnN5c193YWtldXAgPSAhIWRldmljZV9tYXlfd2FrZXVwKGR3Yy0+c3lzZGV2KTsNCisN
CiAJcmV0ID0gZHdjM19hbGxvY19ldmVudF9idWZmZXJzKGR3YywgRFdDM19FVkVOVF9CVUZGRVJT
X1NJWkUpOw0KIAlpZiAocmV0KSB7DQogCQlkZXZfZXJyKGR3Yy0+ZGV2LCAiZmFpbGVkIHRvIGFs
bG9jYXRlIGV2ZW50IGJ1ZmZlcnNcbiIpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCmluZGV4IGMwN2VkZmM5NTRmNy4uN2U4
MGRkM2Q0NjZiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCisrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5oDQpAQCAtMTEzMyw2ICsxMTMzLDcgQEAgc3RydWN0IGR3YzNf
c2NyYXRjaHBhZF9hcnJheSB7DQogICoJMwktIFJlc2VydmVkDQogICogQGRpc19tZXRhc3RhYmls
aXR5X3F1aXJrOiBzZXQgdG8gZGlzYWJsZSBtZXRhc3RhYmlsaXR5IHF1aXJrLg0KICAqIEBkaXNf
c3BsaXRfcXVpcms6IHNldCB0byBkaXNhYmxlIHNwbGl0IGJvdW5kYXJ5Lg0KKyAqIEBzeXNfd2Fr
ZXVwOiBzZXQgaWYgdGhlIGRldmljZSBtYXkgZG8gc3lzdGVtIHdha2V1cC4NCiAgKiBAd2FrZXVw
X2NvbmZpZ3VyZWQ6IHNldCBpZiB0aGUgZGV2aWNlIGlzIGNvbmZpZ3VyZWQgZm9yIHJlbW90ZSB3
YWtldXAuDQogICogQHN1c3BlbmRlZDogc2V0IHRvIHRyYWNrIHN1c3BlbmQgZXZlbnQgZHVlIHRv
IFUzL0wyLg0KICAqIEBpbW9kX2ludGVydmFsOiBzZXQgdGhlIGludGVycnVwdCBtb2RlcmF0aW9u
IGludGVydmFsIGluIDI1MG5zDQpAQCAtMTM1Nyw2ICsxMzU4LDcgQEAgc3RydWN0IGR3YzMgew0K
IA0KIAl1bnNpZ25lZAkJZGlzX3NwbGl0X3F1aXJrOjE7DQogCXVuc2lnbmVkCQlhc3luY19jYWxs
YmFja3M6MTsNCisJdW5zaWduZWQJCXN5c193YWtldXA6MTsNCiAJdW5zaWduZWQJCXdha2V1cF9j
b25maWd1cmVkOjE7DQogCXVuc2lnbmVkCQlzdXNwZW5kZWQ6MTsNCiANCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KaW5k
ZXggNDBjNTJkYmMyOGQzLi4yZDM5NGM0YWQ3MzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQpAQCAtMjk1NSw2
ICsyOTU1LDkgQEAgc3RhdGljIGludCBkd2MzX2dhZGdldF9zdGFydChzdHJ1Y3QgdXNiX2dhZGdl
dCAqZywNCiAJZHdjLT5nYWRnZXRfZHJpdmVyCT0gZHJpdmVyOw0KIAlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCiANCisJaWYgKGR3Yy0+c3lzX3dha2V1cCkNCisJ
CWRldmljZV93YWtldXBfZW5hYmxlKGR3Yy0+c3lzZGV2KTsNCisNCiAJcmV0dXJuIDA7DQogfQ0K
IA0KQEAgLTI5NzAsNiArMjk3Myw5IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfc3RvcChzdHJ1
Y3QgdXNiX2dhZGdldCAqZykNCiAJc3RydWN0IGR3YzMJCSpkd2MgPSBnYWRnZXRfdG9fZHdjKGcp
Ow0KIAl1bnNpZ25lZCBsb25nCQlmbGFnczsNCiANCisJaWYgKGR3Yy0+c3lzX3dha2V1cCkNCisJ
CWRldmljZV93YWtldXBfZGlzYWJsZShkd2MtPnN5c2Rldik7DQorDQogCXNwaW5fbG9ja19pcnFz
YXZlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCiAJZHdjLT5nYWRnZXRfZHJpdmVyCT0gTlVMTDsNCiAJ
ZHdjLT5tYXhfY2ZnX2VwcyA9IDA7DQpAQCAtNDY1MSw2ICs0NjU3LDkgQEAgaW50IGR3YzNfZ2Fk
Z2V0X2luaXQoc3RydWN0IGR3YzMgKmR3YykNCiAJZWxzZQ0KIAkJZHdjM19nYWRnZXRfc2V0X3Nw
ZWVkKGR3Yy0+Z2FkZ2V0LCBkd2MtPm1heGltdW1fc3BlZWQpOw0KIA0KKwlpZiAoZHdjLT5zeXNf
d2FrZXVwKQ0KKwkJZGV2aWNlX3dha2V1cF9kaXNhYmxlKGR3Yy0+c3lzZGV2KTsNCisNCiAJcmV0
dXJuIDA7DQogDQogZXJyNToNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYyBi
L2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5jDQppbmRleCA1YTVjYjZjZTk5NDYuLjhhNzJkNDAwNTM1
MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5jDQorKysgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2hvc3QuYw0KQEAgLTE3Myw2ICsxNzMsMTQgQEAgaW50IGR3YzNfaG9zdF9pbml0KHN0
cnVjdCBkd2MzICpkd2MpDQogCQlnb3RvIGVycjsNCiAJfQ0KIA0KKwlpZiAoZHdjLT5zeXNfd2Fr
ZXVwKSB7DQorCQkvKiBSZXN0b3JlL3JlLWVuYWJsZSB3YWtldXAgaWYgc3dpdGNoZWQgZnJvbSBk
ZXZpY2UgKi8NCisJCWRldmljZV93YWtldXBfZW5hYmxlKGR3Yy0+c3lzZGV2KTsNCisNCisJCS8q
IFBhc3Mgd2FrZXVwIGNvbmZpZyB0byB0aGUgbmV3IHhoY2kgcGxhdGZvcm0gZGV2aWNlICovDQor
CQlkZXZpY2VfaW5pdF93YWtldXAoJnhoY2ktPmRldiwgdHJ1ZSk7DQorCX0NCisNCiAJcmV0dXJu
IDA7DQogZXJyOg0KIAlwbGF0Zm9ybV9kZXZpY2VfcHV0KHhoY2kpOw0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5j
DQppbmRleCAzZDA3MWI4NzUzMDguLmFiYmY0ZDc1MWE1NCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1wbGF0LmMNCisrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMN
CkBAIC00NTEsNiArNDUxLDkgQEAgc3RhdGljIGludCB4aGNpX3BsYXRfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQogCXJldCA9IHhoY2lfcHJpdl9zdXNwZW5kX3F1aXJrKGhjZCk7DQogCWlm
IChyZXQpDQogCQlyZXR1cm4gcmV0Ow0KKw0KKwlkZXZfaW5mbyhkZXYsICIlczogZGV2aWNlX21h
eV93YWtldXA6ICVkXG4iLA0KKwkJIF9fZnVuY19fLCAhIWRldmljZV9tYXlfd2FrZXVwKGRldikp
Ow0KIAkvKg0KIAkgKiB4aGNpX3N1c3BlbmQoKSBuZWVkcyBgZG9fd2FrZXVwYCB0byBrbm93IHdo
ZXRoZXIgaG9zdCBpcyBhbGxvd2VkDQogCSAqIHRvIGRvIHdha2V1cCBkdXJpbmcgc3VzcGVuZC4=

