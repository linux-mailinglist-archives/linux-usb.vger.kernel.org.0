Return-Path: <linux-usb+bounces-18344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CC49EC0D6
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA9C4163C6F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0670A12E7F;
	Wed, 11 Dec 2024 00:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fpsQefxg";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bcOtHd49";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Oz5DakhP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C878494
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877191; cv=fail; b=djezTOXuCjoGiJxsMIvttAslRXkPjWnkdL81F30zOabogiEI3MpDLTxe2MsqLYtlNWp2ka0vcz/KdRPpyMyVtNrwR63+gju/gmyd6of2RnWecPQbcc/4otJQseuiNQgsED1U3YVvFx5ewHH8Rz5dJBq4kFgM1DS5SK8Jt6KH4oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877191; c=relaxed/simple;
	bh=eNPQS7YAFuGTnZWWNZ1K+cyIloyW0Vt7ZilTOurtZcg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f3ej+PcpaEBf7YzrDS9gbLC3+plCdT8T1G7kbD2ehsMi3g8zOTBIK/Pig96wbS53B8MXSuZXxRmhbwqrLtLaCTzC0GqoZOYUuCpmHU2yVna7v4b6ojoC0nXNZksKFdqAjK5A2gNkkY5NWwB4HzAz8bMT7O+5XosaJrjgR320OC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fpsQefxg; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bcOtHd49; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Oz5DakhP reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMtPgN000581;
	Tue, 10 Dec 2024 16:33:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=xuCBki1UO4LMooqwsg8Hep8k2cUvnVCOq2oaFig2Q6M=; b=fpsQefxgTgwE
	46N0HVhK4omRfufYekgc8L87U9jw3NLtC5Y6vcdRTbLGgGKUkx3O5zKom/GssZds
	i0hi/d17f8bzt9v2XeOagaiIxd9pg5btFbbKLp05AOANWNMZBTpt7zCUSJN0yLf0
	rgN30wOZsSZKjv6kVWFbxOpLYj7giknlnqOgxs3VOSJ2lxEOtkwiXqIU6j91Hf+1
	kUuKkbrLQgZpER1k4e3RFbJ3/cNB4woDjULi9bB/Ee3s78/tdxNKLbNeeEmhDxt0
	cFN8PQy+4BzPJ7fxg80ag2M2gxAGC5FxKRWu/mNbAML2N64OA6xcxkLsD1pJFfN2
	q7XaB2KvIg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 43cnvka17g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877185; bh=eNPQS7YAFuGTnZWWNZ1K+cyIloyW0Vt7ZilTOurtZcg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bcOtHd49Sn7XOxtOtcSf9iNEfWi6Uo5MXYgcwGSJy90yr9jSf418zQgN+45A/QPoq
	 hLJYFij0S19kbjY76BcBtwFIavUyjHpjsKZLX5zG7IkysFkrHSXhJMw//HzI1txNF/
	 RvMTg/GpQRFjaa+eGJqy8GLP3rxQE1NgF+IZUzP9u78x09igY1+gr7HXknv39azBcF
	 AMEsfxyAskUo5Pi4Yt838DK9hUS39+Atgpc0uJSnDGYcHw+5LJfttcY1roSwN54bXJ
	 diKJHAi2zo33rzzYljGyLuoCq/SBamHUUxj8SzYeUtV0BwyHYxSQ5G/Lt+/h7gERuc
	 ukf41hCSxHFKQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 323D4401F2;
	Wed, 11 Dec 2024 00:33:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D354DA0068;
	Wed, 11 Dec 2024 00:33:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Oz5DakhP;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 86BE0405DB;
	Wed, 11 Dec 2024 00:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TofFQLCzM0Hfc9KsOCMqHjmaY6IzZApsc6WUUiktYgB45gcwNTY+jGB8DPBTfazS5OgF5BZtq7+tQ0K6VugrXj5Rgb4UozOc8TrBTqzNeEMwb+9TZLAko3FEsfG5cPufnMxIoJxd5gpRNcxZsAkTqfazvX2eYmo6PG3eu5Aoc6gcFw5Acu1zOJJMZSn9QQtz5I8Dx2jb73Tu7HccC8+ztC36NZmCl22QYyGn9uz8FXpin14zy7B6VCmw3U1VGTA9tZHKB9go3WLbNpMLShv/5RfypmqUqQErqPRpF3GJQex/W8fnWzuh4mJ3D94cdGYL9DjQCqf+0G1Q4VWQpBcIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuCBki1UO4LMooqwsg8Hep8k2cUvnVCOq2oaFig2Q6M=;
 b=gxsamq9r6qtXWrmOak1yp9Altd58iDJnx+75yY8K34ZqhqkMBVFiuCW+02744YJca0JdIUI9VPkDQmK0+4H4h1Y/9doT87mk3rqROptxZPJdvd5hdfKjT6d74V5njpndmBVjMV/ARoCHF+0uLGDBrnOWU2n7+2hzqZlEqTPqrM9Z1S7wG70QSdQKsqnSv6ULJeBiMj5RlJ6qA8bUnick8Bb0+lkg9bzvQMOKME77sFb4Wg85NAW3oaaNzlxHeypIe6JiPzDysZLzerfn3aagQ4uLJ4l3ViThW0/ALG56tyWjftCQuXhWr0tUsvgMqhSEdfi9FzsTsULijzcuVHN7RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuCBki1UO4LMooqwsg8Hep8k2cUvnVCOq2oaFig2Q6M=;
 b=Oz5DakhPXA3apJb8p6BXhvhWpADZthsdoCj/37lxiqs3/USK6PucbkNad72mO1mQdksTSFBU9PtgLxO25h+CsQPLn+w9weOjJ3Y2cuJqGjvVN9nGTanTFlapMXw3QXbZGmltLLdG2QqmhgCXxa5m0Y68RM7ONojFBnXtamRuvHQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:01 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:01 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 15/28] usb: gadget: f_tcm: Return ATA cmd direction
Thread-Topic: [PATCH v3 15/28] usb: gadget: f_tcm: Return ATA cmd direction
Thread-Index: AQHbS2Q7EDIPBhWClkyDQZuGYREskw==
Date: Wed, 11 Dec 2024 00:33:01 +0000
Message-ID:
 <c22215f7925581684a13eae9a14afb47fb60c061.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 5f17f23b-240b-4fe1-9048-08dd197b5e7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZjW4rgQRENuTIS5+2jwVI8aRe7ZUVoLwJtSl0gfHI6aPdOvQoHAxCTEg92?=
 =?iso-8859-1?Q?AvFmKxUa5Oy8Onkp3y3W8c/NzZCmJEs+pUY77jTuaVQcTz0Z26gIzNaLjJ?=
 =?iso-8859-1?Q?ZlsWaygfjQjXTQtKFDkbOi4yoqnhA0kdMbFrYPawSbJatp/fxP5Oh/WMRt?=
 =?iso-8859-1?Q?KgIPYEH4fsUMwGwmdsEZ+O69O/F3PdPgAWliy+QfCFaYxb8UZ1LqvjyLui?=
 =?iso-8859-1?Q?Fjp/Z6DgMYX2lZn5+KZYopBXgLvn1p1o5+pQNsi0qYRVX6NdnXzn2toRTn?=
 =?iso-8859-1?Q?C4Mt78YKKS8hYd1BsxdLNkhKxSkmqNa7dAnIXOq4Y2zE6jWEypiD4nC8E8?=
 =?iso-8859-1?Q?fTTus91r5G6kfYy8fbtbBgSUZMsRAjtBXWQj38edXtW6LfooU4uaxxsTiM?=
 =?iso-8859-1?Q?mDQoBXxmg6m9XQtmyiwNJVulNhtrXdagogL8EwFyPEODItAUD89dkKwn3Z?=
 =?iso-8859-1?Q?Pv30oG670u49klgj7NZHAq3ZNEwlWCbQxsJoMe0BIGC2/p8rQw93b+PsvZ?=
 =?iso-8859-1?Q?hL9VG7kkNKnisVjAyBA/7hJtoE4dxmZr4sEUKaHmFTuOYJZ3gNZjqyddvQ?=
 =?iso-8859-1?Q?4girfRxePvbzvbMu6fGnlUOAyfXV3MkNs1HQyLVLQFZkEj6fm/a2GqSFE+?=
 =?iso-8859-1?Q?VoALf1cuaEczm0cFHxis5iYtaPfSIfwiVGs7sJp+N65ZzLAWGhCuTV0dRQ?=
 =?iso-8859-1?Q?QPlE/BoHC56qzzn8Oc+BvX++e7jDkschK5n2VoSmgOn8bRU1GWeEXlgSMp?=
 =?iso-8859-1?Q?Rn1onWN/+/EI0mmS7V5DSczNJ5lw4h4AhwYL6jpYza1rwL230vPzbMXseO?=
 =?iso-8859-1?Q?BPpAgNWsQRomkOHhGheUrYa7qbVSsFUPCz8Qcnz1LRg2by3tihmgoy+3Qv?=
 =?iso-8859-1?Q?yU+258RC4WlBCQnnnGpv66+NLahM+cC5s1L4q+mMZ1X6JPb966NCpnvzbe?=
 =?iso-8859-1?Q?uhiUnXzGzFlPgGHBJpIFvcaixK22/vP0Jkf7/raGpu2+E2O8KH79pJ5UIx?=
 =?iso-8859-1?Q?i+CMfKu60frIRuVn9T4RULzfkjpEsf2kJZ1HLuYGtScLg3cZK//5ywRo17?=
 =?iso-8859-1?Q?/WFzs37FMdYi7gR70qngA6Tsyt1ChGvRIbCZDXWb5b7fwkcR5zYAGXukAW?=
 =?iso-8859-1?Q?bkxFuubhDi+R2KP8TZxjvcfvJegkCE/jPR6YqoBKS7POAaD0mkAaCmsnm8?=
 =?iso-8859-1?Q?+skNSGSzMDkX3nFYsMSYpBOmeUuJsZQ84jkjwFgiOoeEFAn0Owym33dHLp?=
 =?iso-8859-1?Q?TReYDcqom7Ktvih+49ppnwB9h57jViIuhzbEaUd76RfBoziBJZlYgWBkEz?=
 =?iso-8859-1?Q?CBJhHPyVI8KA5BcdrUMw2tvr+dJYw+Dp9iFBVAWpsbROjucnvknYDrICh9?=
 =?iso-8859-1?Q?S5vENPygfyxkJSL0PXzo0kCvU5HEtktOqGjcEZFuAv+4R4a8lZWD7/xnzz?=
 =?iso-8859-1?Q?n7OhdKqY+IHq9iHtpv4JEnZUMiUMl+NzhOBPWw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?C+B1xR0ABdts2Tk98F5r1jO781zNTE8fzjuObiHvuqWzJ0q7E8z/8ePODm?=
 =?iso-8859-1?Q?CpFOrwNt/oEt/3PJpPeHB9lywuXjGrd6CSR20n+3S+l4C6kgw3SxdYqH/z?=
 =?iso-8859-1?Q?gR5cqKTIf568S/PbDuA4tRTWUD9944jhk9YFLS1CpSwTv0a6vdf3Q+Yf77?=
 =?iso-8859-1?Q?HwYhv+HCqFAa8I9+/0I2wFdtaPsmsIDNBaYYkmbyqFCJhHA+X9zkCN+NOy?=
 =?iso-8859-1?Q?m3Cy+wAZys4XnqMnDfoX9FWNf/BlmZUQ+vnTQ/zM/9/Vkm/fYUsInT1QGz?=
 =?iso-8859-1?Q?TJVitaj0rAU12W1xDV1kDCuTQ5BuK9CMg0MBB4jKuSqA5xF0lO7/t0kAvx?=
 =?iso-8859-1?Q?tPU1vemp9MbR4xUmNzz6ApV47CmrJJVkTXHduUHUteBGYuQwYsCym2EBI5?=
 =?iso-8859-1?Q?qhjArM/Ub4WtvlePzoLomS4LWHp6YB9hOnNidJErSobRCi6LRjilFyGZu0?=
 =?iso-8859-1?Q?O4v+JtLbhyMVSlVx4bT6rzBpO79vUBLB4XHKKYCIob5Kam7VdtkV2OMbHb?=
 =?iso-8859-1?Q?PlqrNo4000m9+GLeMYNxWCMsCUSA/Bn5TeX2jN4txUHHQ16YGXYB2c2epA?=
 =?iso-8859-1?Q?Y0HL3LX7K43KYk66AFNN3Qw0ZrixLlO3xvv0Yd2ufq0ncLFzDplst0HDnf?=
 =?iso-8859-1?Q?Ni3CNwpxQAtHaYNTPAHneyaL1m2mME66pqPsIQS2HWtvmJAqx+bsz4P6XT?=
 =?iso-8859-1?Q?hOgysuv7q/k9UwqrfIQz/BJhuAm8BU2dXdEtn/Z5hVH5UiZdunG9wfaMo1?=
 =?iso-8859-1?Q?prKhNRyLRMhy0kh8W5idiUrGX+vGaHmfsDFlTOuZIpiHE4Hfm7I+cJpnLo?=
 =?iso-8859-1?Q?uA5Ia7JmrAeYRI/WB23EmLuAvzRbWD3YTxTZwAWRDdYdUszkjnsBaK0Aux?=
 =?iso-8859-1?Q?pEsoFjx6Mj0E1FSjvhWjp8gC0TyVRHEy2KkURYSWB+IeL5jwR0TI84mKBk?=
 =?iso-8859-1?Q?yOlMMLu4E0JDhyUXXawr8E1qCtEvUsxvxcogeG0eoGLmLFnGqex52P9KJ2?=
 =?iso-8859-1?Q?FRqS+tgHqKES5E+hs4lr0wmJD36IZFsK0QODwIsZeSwiFGvsNHzcnHQkE7?=
 =?iso-8859-1?Q?8YCABtlympL7SB0dJPJV483rw2BlIJEyPGZAbBsATX3LHhsib2s3ZzLM9B?=
 =?iso-8859-1?Q?IiSmhFMMoMmn7Nn4QBLxLEybJDPNlOSzGWzYdNRUg6X6/8Qe1UuvPg4ZQx?=
 =?iso-8859-1?Q?G/hrfo9TdifS9nW5uKSZVWb1bOY0V+KfGQ2TEPATQ/cRw7jdmdjStqgMTl?=
 =?iso-8859-1?Q?1ccgr8QfNqQCOD6tKWwyZ6Q6qESuU1mLEXLMihzJW2/7jS/jUN6CVqAUhQ?=
 =?iso-8859-1?Q?EzAG2lW92T+zC6RjJNV4Na8e4VMpfREld6fZg/zh3omCK+KvFaJnTO4/C0?=
 =?iso-8859-1?Q?9IGWfNNSs5Ohxd/0fQHfcvTqh+kMKoeLexjOqlDm2h3UJRtlBxhVPotjIO?=
 =?iso-8859-1?Q?0kmMTSY/M6eYZVqum21eLvfZojALWRksfPdmHMIwDZdqytEHE11feydcIq?=
 =?iso-8859-1?Q?Hc6uFElP+FFwh/VuG2CioRM9d76GdjJqFbAeonL97LlWMdSOx5NCfAvkpe?=
 =?iso-8859-1?Q?tsSvIBu6zjEmixEEgJQqkqtFWFr56y2wnOCOJWNS30zdtIwOgljlZL8KBI?=
 =?iso-8859-1?Q?a31QNWxfJ2Nrc+iXzAE5yTe8P68uWTyfkgqHlOk20DIIpFDd+mmJjYAg?=
 =?iso-8859-1?Q?=3D=3D?=
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
	x9080WG5u/DdH6Oj4G68DpyeaMUMbZkVamPGvPwM3DKzG521OSXdDPnxI4eNGl4O5uFl5kOjz4Otrhtfasx0BhvUEsvbEMEe9HHzNYZAl5W/v/5cEwRbF9YUdapblyY8ssf9ei5qBOxPY7tVNmiqWO1pCvb2rJct35RKHpumicky41BLQh3t4WGEeZ5hOg8cN8zsjznfHOQBUy9L3IxypEpTT7E7w3VIt3T8LEtZ4XyhUrQlDlqD0HYhGMJ/4sxLah62yk+85OasopgnreL36StA1BZppRIjZNJ8XME5X/IpoEsmkLK+zUoxM19onlN8KkY/NXJONkRe/hIwxPEdmcDq/+BxO//+9opuWWpkVTDlNHhy2N80JxFlsg/LDBB9Lt1okCUJaO4c2AZ4wilHpXsmdUiBFXu1rPTOiR6h78+MBvn7MBOVx2FM9RVjL7Al/behSNA0nRUMgTDfyzUOt/FwZJoB3iWingckfG550rKHzhWr8cj+jGuUi82PCthRtkLvZMa4TInfdp74XSu0D8VuiOL86WQv+pkBs2yPC/p1il865MQiZJcVeYJOL7QIbqiqAp0gF/NTwqyw880/F8dXUmiLLz1RdXQvENOfAYi9lQkAIFrFpYkRmnHNbvdidBt0FPDt3PB8CvJfUqWDGA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f17f23b-240b-4fe1-9048-08dd197b5e7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:01.3154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: teLFPitY2fy53d5Nwe6Puv2yjnJ/Nyo/AKoHxgXJ7/fGTaUouVcMxt8s2ecp0SmdyAP1+QEL+5P1jsuUFi40zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=fNPD3Yae c=1 sm=1 tr=0 ts=6758ddc2 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=WVd88ziZsyrOexG4cEQA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: fs4Gn1J7Ttul4GxTWwRP7zS09_6Q6BBL
X-Proofpoint-GUID: fs4Gn1J7Ttul4GxTWwRP7zS09_6Q6BBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=717 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Check ATA Pass-Through for direction.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 50e6a41aaa82..f43fa964d2b5 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -877,6 +877,8 @@ static int get_cmd_dir(const unsigned char *cdb)
 	case READ_TOC:
 	case READ_FORMAT_CAPACITIES:
 	case REQUEST_SENSE:
+	case ATA_12:
+	case ATA_16:
 		ret =3D DMA_FROM_DEVICE;
 		break;
=20
--=20
2.28.0

