Return-Path: <linux-usb+bounces-6120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE184EE94
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 02:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E656B1F27E8B
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 01:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145D6A34;
	Fri,  9 Feb 2024 01:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fqw5xI0t";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hJsKJwL2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Fkfu9opn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DF7136A
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707441908; cv=fail; b=dQUNXQ5tdtMMaJz5SMKV7GEZzjQ7tdsZnGxWdMnSLewN7XgWNqbDT7G/AiCtRRNoBqAKlxcXjmi4gKzsXghHfG2fKNEN8tfn6y8ZHBnrpgxvK8Wa+C8c3TMa/KBjDFMrRsPemSWSVLwEv6gyYengn8WwzObnKUlrHKo3Kapazdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707441908; c=relaxed/simple;
	bh=zxlywAmwD8AIXC+xIIccIMiHVhopWuJxIeiVNOLJ57o=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hN4DjgGovZrOuM0LqXk+SVBYxJgrShy2QQFHBRNWJwqNMtrlXA1RmWPZvtz5rBG3VzQ5rK3hESgnPMrfXsoYkZLeyuOZatVg5pyMK3ELOxeiLGPq3iUXd5eLVnCZUnxjoEnt0MRZ1MNCVMBrrZBSnHQmG7cjz/xm2A8SOidmF8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fqw5xI0t; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hJsKJwL2; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Fkfu9opn reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 418NBKuZ007864;
	Thu, 8 Feb 2024 17:25:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=tMYN
	mf179B4tV/Zgdzsdc68+6FU4UtFhhhmU+GxuiKo=; b=fqw5xI0tVdF6F+FXGreY
	/9LN2euNIHRsFvUjvj3X3v9tHwJLq03jdvcguOTNrtAmrU6Ojj44WZMAjk2pgmGh
	dPNPbApTBvND1QNNJTFBW5aQvCe999FhfTDQGpJCUFt3iJupDlIsW90un8c98tj2
	Na8NGltkyNDr4WfqIQsHMJVL8g7WLicmcInA8D4oj9J+nxZaZG+6NYwZQgJp/YUu
	9QaZJg0XKEbspjs/QqEH0YoRKk0HwKItgax2JfL6N+c3t+WJRar2nQhmlaEDIkup
	GVPXBg8KBu7+iTg482Rm+dwWjY/fUSvWoLwRYPJdEaF1jiGvG7jdokKrYNR5Wk7R
	kg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3w1n9w9hkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 17:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1707441899; bh=zxlywAmwD8AIXC+xIIccIMiHVhopWuJxIeiVNOLJ57o=;
	h=From:To:CC:Subject:Date:From;
	b=hJsKJwL2zcYFtO8k1JDRt7pn8mqitAWx8G4rs0t8FfSdvHfeqQfjCTiWaX7D9VUzD
	 yELp6VtXqIHn/6yLfQuSr5BlPh5DmGuoKCbPOOUAY/KlI0eaJTRMc02tTEOuNpDUzO
	 y8FljMOQM9NVte+shbmlHFWt/hvGZRBF7UXmgcx7lPoVM7lCCn/hcdYPhO2Ni1fepb
	 srBBXwVJY7BUpL2IvLenLcsBDFYRddOn7jCujHNCuZUG5RCUhW/ofGh8+oDPCPhoHR
	 8KPY/zXjRVaeRhTbk/j28BDEkP3QbyaEdz35ICEFb0GxCK+nzZ6/kRvG8yM3MoAdD5
	 YeYfIBFM716pQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3520F40362;
	Fri,  9 Feb 2024 01:24:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 01B29A0062;
	Fri,  9 Feb 2024 01:24:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Fkfu9opn;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7C9994054C;
	Fri,  9 Feb 2024 01:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5bb7fDK+MXF++M94xnEkLQPUzGPIiV6X5kmA5WXr/0g2gRG8PpJ9LDLBDBXrfLcN7yc5eC17Y6sqkSL7HuraeWB69F2eDinan5T32fpJAkdJew/xC3aTw+YiHRW3+kscbCMMCf+jJEByyhNoMiteXDlRj2CFVlG9AlUOrhVuQQ6MY9TTnwaBUxZIryI7ZAb+qD4k8ndHlTN/9v7UDtCJ1/wDF1Qb9pbOJ8bmzT0S02xg7NX7HSbdyZqjwBOtwc3TdGQpS89/Ql9Ie6PKmSFGNeF6j0LxAAdWOPe1zbJnK8tfDmeeXaguj85jzZHiVX2FFmhhUysLmajEPgEflxulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMYNmf179B4tV/Zgdzsdc68+6FU4UtFhhhmU+GxuiKo=;
 b=Jc8J2LC1Tucz9991iDuzgw7UOTdCosftiHtHm5b0NZXUSWbPyCeBzkxnyt3WrjpncJtNox9/iz99yBCYzB1pMI0MnNpkJ0FeZXijxagc11E/UGy4fyOioW5k7c5CYPBK75vM9/AvrNZAX8aAfVrZR5J5AeYItZoGVDpQFvyKjr0bM6WjwvCSSxvkYmzh6fPEnHbru+QGoAcFvRhZoZEEg+ciTKKFROuCdJoBEiSn2ipRgobxPUsOgOd/DCEmBu60+1YvudB82TfP1nACq+TgX6RTj1H7fo2ek7ZbLje+04g7ypGCBw8nw3RvcV8itrwgFtVVFEi+/rNCmQELYJDBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMYNmf179B4tV/Zgdzsdc68+6FU4UtFhhhmU+GxuiKo=;
 b=Fkfu9opnJ/XDSaujj8mnePQOtMA+2Sab0BtKe0dccttdaK+vsxKCDSL5hfUJ9DEfoBH+/2NyEVoLz/cfA65EGpKDo6ffrAYzFGLJDZDtBNw1mvcZN97ZfzNHP9djCaITnu5FozoqNm4eKh4FVVR6D4Dh/C9WFBHw+zkWWmBCToE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB9162.namprd12.prod.outlook.com (2603:10b6:a03:555::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Fri, 9 Feb
 2024 01:24:54 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7270.009; Fri, 9 Feb 2024
 01:24:54 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Manan Aurora <maurora@google.com>
Subject: [PATCH] Revert "usb: dwc3: Support EBC feature of DWC_usb31"
Thread-Topic: [PATCH] Revert "usb: dwc3: Support EBC feature of DWC_usb31"
Thread-Index: AQHaWvbI0vndRAl0XEWVNoceMCPwlA==
Date: Fri, 9 Feb 2024 01:24:54 +0000
Message-ID: 
 <3042f847ff904b4dd4e4cf66a1b9df470e63439e.1707441690.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB9162:EE_
x-ms-office365-filtering-correlation-id: c5734799-2e12-4cab-ab9b-08dc290deb75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8n7GClVoQht/Zstt6UhFk2sdi0Q/V0FU+z515No7llN+MGbv92mu4ysXYGW9eLnQIJWiIueJ8adipamw/eOtPsk6MewM3dUM4jc4JmYi4mi7Mk19JbKRQk0KldaMZ8VQ2Pk6M217uKu3aeR7Qf5Ls9ct6kDLRZEU86hbMItWQySlEPXiQw3kYbIM8kkD74G2PVyxvHe4gwuadQnJIghw/5wzpuc9xF8q8OKdUZhbF6aI32v75dvT0gKYx2aC7tfmHz/LzlXrYtb/1+m3UCyabS3W+Vt6AxUANxoZ/i2mZmHUtNzDbEl42V1xecmkYBPboccEXmJA/KODHxCxrT/bRwZeh+JR/rCyJvwCr+/a8+bvauapfEM/5YsZ3AZa2HnWJxdRHRttfLtT1Ry4O0oW2U5+NBVSqsWvkSAMtQLJuQaaDWY/w0xHquAXzeiWBkwJpNrSinccaU01f+FubPHixA49A1MNaIZHI19zARv5UFLjRzjPD1Nn3ek1cETZ6ELkHbSfBsMVDvTBUQdOTfm0oiWMQxV8PgjzdoCMNZZa9Y3AL0dfAsYFUmrpb1coEhKmO03u8Oscw+j0aYpEZysFIZlhRRF3+OGd3Z5JSrE3dojbXKRwHcsEGQfK5F0q1cI9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(478600001)(83380400001)(110136005)(4326008)(2906002)(8936002)(66476007)(66446008)(5660300002)(122000001)(316002)(8676002)(66556008)(64756008)(76116006)(2616005)(66946007)(38100700002)(6506007)(54906003)(6486002)(6512007)(71200400001)(26005)(86362001)(38070700009)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Hy+JBNzhTX6f1IumJuNKX5IPUx/+z4xD7D4wQDJT8ITGamhFJVPNfv4Crw?=
 =?iso-8859-1?Q?YFJZfWnGqBIU6c/lno5PzzpuNSFbqqasF5lZLi40CdKXH4ftUxlBeRrF4B?=
 =?iso-8859-1?Q?97UzdAfvLAcvIxoYUxXPuM0wUzBjSHH0ePxNQAgQ/6anmMrNYrnnEZ//oF?=
 =?iso-8859-1?Q?P32sbLelBOp+VthfDrZam3XlU3x2ZxE9yOPzIQT3V+kwlL7OI6/pu38nUZ?=
 =?iso-8859-1?Q?noCO7MLyvTveWajTYEUyKo+Cxnqcr663kGNPqf71+M1r0OdtlLplhy+3tF?=
 =?iso-8859-1?Q?zZ+YwzCR9bug5/Fm2udBczpRzMgoWVgF9ZrihTtNytQ2NuPd3v/TaKWRUk?=
 =?iso-8859-1?Q?D1wkXCAWCYlGK8/Dose5eLL+T7W/gBShHO75fki8uIHg+fXzDOqE9mOsKg?=
 =?iso-8859-1?Q?lJ39gxS+Y2X2w1XRx+ZX0ANEsELoRDwBBm0KXPpbI8ApJpLCadM+GTEq5I?=
 =?iso-8859-1?Q?XNA7QligPAHHONKdr0LXWgyEn3z6dwsQfjgQ3OKtGUvTI2qOtbd85KOMM5?=
 =?iso-8859-1?Q?OOgHZsusnz2UY1cRCMNR0IWMqmmHCvWAfQHehpz6yPxQtw9z1GyI/Xz7Zm?=
 =?iso-8859-1?Q?NxGaWOvGCmL2J/DgDp+pj5rb5KSNKzFH72ugj6hJQFqMSNaQDDHtF9fF3Q?=
 =?iso-8859-1?Q?HxiczYg4tLiiMogDC/ZAGNjt9YdRZSVghxinW55Tg+x5GZRePyG9w2ArCs?=
 =?iso-8859-1?Q?iH2t5oyw7qxUy5xbvxc7swSn71h0qtgw1w3BxDJFKA3Iz7ra/8c/Qo8g6V?=
 =?iso-8859-1?Q?AtfYGpZOVYNeRARmqJcGK/B2GDzOasOq2KenCzjcTxAK93bFHCxiHxKWVr?=
 =?iso-8859-1?Q?0lS6p9IPLZJ6tQatiCHakag9pJpAKOoMVPQYHHJWqH9ThdOg1ppxnkQIio?=
 =?iso-8859-1?Q?YsLg8jXgJmyjukCRi871Pr4PvgiPT4pl3GuSzVKIk9NPyvAfHTdAH2AvVh?=
 =?iso-8859-1?Q?mTBdw22QWYI5+9VB8w5Y0n5ke/1m+uITTbrWPrbcF5LXsfeOwGLsgaruMj?=
 =?iso-8859-1?Q?1PHALaZPouIAC3Wd/bP7JWH3K/o6lmz0+mU0gwT7ZT+VxX1wbQbAjKXUaL?=
 =?iso-8859-1?Q?PyIILfAU3wz1pceim/I3EgMMnog6wBolIyJdfxijbum0jbc/ILu3DMZn0P?=
 =?iso-8859-1?Q?0kzlL2A56puwkVXmbLjs7f5FlcOGObRV7oj1YNULSBE0TIjbksCdbnYuOg?=
 =?iso-8859-1?Q?27NkQVTvyvQsQ6iolG8tTMYPfWrMxWpbAb6rOHYJh8DnuFCdSwfiliEjOa?=
 =?iso-8859-1?Q?a6ARneRi1Ng/ZoLc5cGFU3RLYmruWYm7Z55pD4Ukakn9hXyHGQqrBtUceD?=
 =?iso-8859-1?Q?9z/4Fbb8HCEP0ouhU25tYR123jd19iUJUMrGU90Lf6R3MCrXsznX+W+W11?=
 =?iso-8859-1?Q?8BCx8s/TEyhd/awrWb5J6oCK952wCGezNgtzzK3qIvmRSeNqsBRWGoP0pT?=
 =?iso-8859-1?Q?frX7fF6nraxO5qb2UTlbozazojIMB68xifklLMZaKY7RZzbsGEkgUP1wyJ?=
 =?iso-8859-1?Q?X749G5dIdAK6mr091IxWD5gmtdrH3bqIuWdVhyd8UxHPzTCw4cUOwNVwu0?=
 =?iso-8859-1?Q?rte4GW74eBTn7jmSfw/JSi+Gv3ZjHP9kxqMg4cL9RauBMsSrkPtEFAKwuj?=
 =?iso-8859-1?Q?clleXgKqV0XRJ/70BeR2UMJK9MmdfWR+lF?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2W5R4cUqeD/faeVnK8Jj7dw9CASb5V8DXdkZuqRvagcCVZVQBrT9KWfoGrUIQ8YR4tR1IqDtEmFrgtCSY2Knc9j306RNUzIbSDcfMqeN0aB3AYeVhjTwyAzteRkL7mNgFU1QjmxaBKLcp7Rp88gQRsbxWmlbvZKeZQCZFTBwTMK5oqJmysumO8eMLypnTxiknVJljzqr0IlHGKSxsHxWZicvomCUbYRsbd0EWnCEezjyw0NieVFen+R8e8/OmP5pHRbppHhbINH9f/NZVSecq/MIcfq0BGSRCeWWsIbcmUzoUhtdCdiVruyoPU2JRwppvrbludUAeU12CpbS674EeHVmWLB2oEgBw+jLPSrIPFHDHs1o+llISWVkQzlyId3BZldCl/EmHdcmdLWYSKbjNY+Qr9MJBoZuePKW4XrXioQIvowoVJyimAWL5Ef+jI1Um1vWqE2WoohNwv6gU5Mpvthtpzg+Fsy0lKT8nIC+Bm0sKXPK4HuhEs6ugKi+2Pn/jHIe0af1NOd5d+PZ5g5jo0x7hSuu/l/KHFpqB2T18TOrG+PoscaQSCYv53k7J9V52rX81gkRB6ptXW3GPiIskjcBsr8pCSJ0tKtyLB+4TX3A6O8E/EE3I6lcOZGlQRx7UFhR3DMeQaqjacdc81rO+w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5734799-2e12-4cab-ab9b-08dc290deb75
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 01:24:54.0899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lw3Umppn+HrzgUYLx5gVHDk2/FsNmrhsQs2pks5J2Hri9bVr/c+DAvS11BxjJXfiEuvJZIhzqOkWPsLzcfIiMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9162
X-Proofpoint-ORIG-GUID: dvbYTVKhukyZmClF3w3J10Ux4FJdTnnC
X-Proofpoint-GUID: dvbYTVKhukyZmClF3w3J10Ux4FJdTnnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_13,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402090007

This reverts commit 398aa9a7e77cf23c2a6f882ddd3dcd96f21771dc.

The update to the gadget API to support EBC feature is incomplete. It's
missing at least the following:
 * New usage documentation
 * Gadget capability check
 * Condition for the user to check how many and which endpoints can be
   used as "fifo_mode"
 * Description of how it can affect completed request (e.g. dwc3 won't
   update TRB on completion -- ie. how it can affect request's actual
   length report)

Let's revert this until it's ready.

Fixes: 398aa9a7e77c ("usb: dwc3: Support EBC feature of DWC_usb31")
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h    | 1 -
 drivers/usb/dwc3/gadget.c  | 6 ------
 drivers/usb/dwc3/gadget.h  | 2 --
 include/linux/usb/gadget.h | 1 -
 4 files changed, 10 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index df544ec730d2..2255fc94c8ef 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -376,7 +376,6 @@
 /* Global HWPARAMS4 Register */
 #define DWC3_GHWPARAMS4_HIBER_SCRATCHBUFS(n)	(((n) & (0x0f << 13)) >> 13)
 #define DWC3_MAX_HIBER_SCRATCHBUFS		15
-#define DWC3_EXT_BUFF_CONTROL		BIT(21)
=20
 /* Global HWPARAMS6 Register */
 #define DWC3_GHWPARAMS6_BCSUPPORT		BIT(14)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 564976b3e2b9..4c8dd6724678 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -673,12 +673,6 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *d=
ep, unsigned int action)
 		params.param1 |=3D DWC3_DEPCFG_BINTERVAL_M1(bInterval_m1);
 	}
=20
-	if (dep->endpoint.fifo_mode) {
-		if (!(dwc->hwparams.hwparams4 & DWC3_EXT_BUFF_CONTROL))
-			return -EINVAL;
-		params.param1 |=3D DWC3_DEPCFG_EBC_HWO_NOWB | DWC3_DEPCFG_USE_EBC;
-	}
-
 	return dwc3_send_gadget_ep_cmd(dep, DWC3_DEPCMD_SETEPCONFIG, &params);
 }
=20
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index fd7a4e94397e..55a56cf67d73 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -26,8 +26,6 @@ struct dwc3;
 #define DWC3_DEPCFG_XFER_NOT_READY_EN	BIT(10)
 #define DWC3_DEPCFG_FIFO_ERROR_EN	BIT(11)
 #define DWC3_DEPCFG_STREAM_EVENT_EN	BIT(13)
-#define DWC3_DEPCFG_EBC_HWO_NOWB	BIT(14)
-#define DWC3_DEPCFG_USE_EBC		BIT(15)
 #define DWC3_DEPCFG_BINTERVAL_M1(n)	(((n) & 0xff) << 16)
 #define DWC3_DEPCFG_STREAM_CAPABLE	BIT(24)
 #define DWC3_DEPCFG_EP_NUMBER(n)	(((n) & 0x1f) << 25)
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index a771ccc038ac..6532beb587b1 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -236,7 +236,6 @@ struct usb_ep {
 	unsigned		max_streams:16;
 	unsigned		mult:2;
 	unsigned		maxburst:5;
-	unsigned		fifo_mode:1;
 	u8			address;
 	const struct usb_endpoint_descriptor	*desc;
 	const struct usb_ss_ep_comp_descriptor	*comp_desc;

base-commit: 88bae831f3810e02c9c951233c7ee662aa13dc2c
--=20
2.28.0

