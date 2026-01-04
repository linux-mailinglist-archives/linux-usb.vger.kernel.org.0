Return-Path: <linux-usb+bounces-31893-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D3ECF0F20
	for <lists+linux-usb@lfdr.de>; Sun, 04 Jan 2026 13:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB6323004636
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jan 2026 12:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEA2285C89;
	Sun,  4 Jan 2026 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Ho9FtXUQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012047.outbound.protection.outlook.com [40.107.75.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371F57C9F;
	Sun,  4 Jan 2026 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767530671; cv=fail; b=TntlJC/nOrUV8ewDrid8G44QBXtxSPwUaLK+nAg1QhfJf0mKmHynqDMvX2tsW88WnzFajUstQilTpwtmMThb67aNxNTNTYjOhUfKf9oO2GN1c0Vz+Mbk5tuGtMMP+GxMCrxvy2KHorLNU/6Gt4FvCBE0v/sg8m6fMr7hKkTJJ1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767530671; c=relaxed/simple;
	bh=+m3mENJBopyXRnZW10R2pzULv+F5agWT17AMqfjGvUs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lscj18pREzcw3BPqWB9v0ehSC/JW+k+9UevVcXcUVdk98Igx96IJAVgv8ngM3KQxZo/Bl2wUQH0Mw3AEtdF+r7g9O7hJwOQmVcyNnrgzyaCi/jOeQbG0XXJ318HGegnD9cXA/XLXK1u7kP88IpeIkFDXxvNhupuFa2RsBdTh6Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Ho9FtXUQ; arc=fail smtp.client-ip=40.107.75.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXv65wzaw8rz0wW1bQvDjadbK1aA2YkrPZiGHAgZYLoquDADLQFYZc+1ntwG6Imwz9R6AvWUWmWpp8EZldd+jxxcrAaegFsQkubKxY/v4TsolMsKMHpmxd28neFWo0iOtV7V7LC+ZblSt1GDvRdvEotD00Kp33XyGSICGfquHR+vzRkR6FdP0/gr+KqGjrM1+utpttTlscZ9QltsagSsFHZfkLgtAUwNf/+nK7o0h+I8nAhPpg29Z+p7+3eVw2M6TxI8I0ibcGVBn5hvjJ5543j2uMiPzEAbWu2MHnDRji9gL8T7njagxgCtRTvDIpQpL1A1wEQyKgloLLSbhqfOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m3mENJBopyXRnZW10R2pzULv+F5agWT17AMqfjGvUs=;
 b=CGatKax5SkIHUdffv4LAD+VmiBrs3NGXABDV0KOKPYKUVjQDfE6i0CR+XnSs6xNYId5373CS+dhIY/5n7WklPDY73AXIAGjCDQvHnH4kKoLpfZSwXAOJxfJVtVObbWm/3z1hK0wHlwVc3I3OWQyS7LTsQXl4rrqASwn2iooy4/JMlSlL0px9rJsURLsRgIXR86iD7RAyMU5lDxyLyOwW7OXbgXxfoNsfImUrOkKoRbpbLq4FlCEnjEIas3yI4M6VWgCr+zEWtAzPDGiByd8qlhnTW/ehbL1IXfkT3/JRi6C2bBANlNvgL+Fu/NXGDAbqgYZBmmQphvzdu9EIzkRrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m3mENJBopyXRnZW10R2pzULv+F5agWT17AMqfjGvUs=;
 b=Ho9FtXUQZkhlLYJeEQYNgCz31gPQ+KrflZ+LhRZZqXzCfZyL3Fk9Ug0tjurSFCxCB892vChcXVhtDRoez/GjuwNsBhI1LtsftBv9tRJbnNpZQtrFUbKwZwoQ9ALu/1CgFsNkbtj7gAWj4nPKP+u0Dh0PLM1kwS+/oF7W5decv72nZPUVMg63YQAkvid3y5JAZ9STNBy8/B+2mvMRYQ66c3VJ5x0vdZE00j9jefDw0/HoSqiC7ptitJE+4O+o8Bo1yvt7e/9yd2e1qcm45z2pZBcaQ0r1U13J35YLzxrY2Qqsx1zYTv5TINJyn9ZXpTcbaExuxH6xmqjOedXe5KfTow==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by JH0PR06MB6978.apcprd06.prod.outlook.com (2603:1096:990:6d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 12:44:25 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.9478.004; Sun, 4 Jan 2026
 12:44:24 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Consultation on the issue of digital headphones freezing
Thread-Topic: Consultation on the issue of digital headphones freezing
Thread-Index: Adx9d1oMYEJvjzUWS462ZgXY544fRQ==
Date: Sun, 4 Jan 2026 12:44:24 +0000
Message-ID:
 <TYUPR06MB6217B105B059A7730C4F6EC8D2B9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|JH0PR06MB6978:EE_
x-ms-office365-filtering-correlation-id: aae5c5a5-67cc-4e87-49bb-08de4b8efdac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?QTljMnVIZ05sdTNyeFUwc1FYRy81Z0ZXMDdSbXlYcFowZFRqdFpVazk2bGg1?=
 =?gb2312?B?V29ra3duck9xV3pUT241VWdkQldib1doeFgzYnNIcDNzenZIK2Jhbzl4MENp?=
 =?gb2312?B?YzFzb1ZDYS82STh0MWVTcVQ5ZXo0ZWk0Q0Jmc1EvUFpxUTBYZklnTFoyQ1FS?=
 =?gb2312?B?WmpUem5sZUpPTFRidzhEVGtoVFAxUzNCZHNuZ2I2SmRidEYzWFluc2crT05y?=
 =?gb2312?B?bHlyV1dCalpVMk9xRnFid1NRb0F1MWpSSFMvWGRQdnU2Mnd2OUtSaVJ5Nith?=
 =?gb2312?B?NVRtUkh4cVRra2MwL25VZWtEdktWTDFEbkZ5Z0hOc1FVWWZkMkowMGRLUU5D?=
 =?gb2312?B?Mi9rbFNjOXI3RGRSbFZIZlBpTEhySGR3VS9abE5TMUs1RlQ2KysvcVVzNVZQ?=
 =?gb2312?B?cHFHczZ5Y3RCNm1zK0xLMzhvRm5LQkJscjhaTTV2WkFJSjE2cXFKZEw1MDg5?=
 =?gb2312?B?b3J5ekh4Zndtci9HWHNUblZNYWxvbE1PZkRUTmsyMVZVZzc4cEZmQ245Y3Za?=
 =?gb2312?B?Ly9EdTh6RHJhZyttMENVNWI5UGZtY1dDTDZ5R1F4RkJqZ1djRGdkWnlDcTFO?=
 =?gb2312?B?SGt4RUxDTkdicnpsQlRHMmkvVWFiS2s1WlQ0L3ljd2dJeVl5OWVQZXpvY0ZL?=
 =?gb2312?B?U2E3SFI0UTF1L1VYYnM0N3lTeFhBVlR5c2xISHJKbTk5ZlU3STA2TXg0R2ZZ?=
 =?gb2312?B?RHEvbWpJZ0QrZVZjZ1ZKNVVKbDVCWUl4Tk9aVldmOFN6dndPenNsOTBHS3hK?=
 =?gb2312?B?WWwzbEtYTHdRNlJ5WXgwSW1IV3dvUXNrUmxiRGxyVmFnMFFSQ3JlWS9GS2R4?=
 =?gb2312?B?NjF5QjFRSnBSVEl6MGllVWJoS1Z1UktYVjU1bUZGTUdrVEk5UUFpN2RHdVIz?=
 =?gb2312?B?dXlLZlpMMy9KS3BJcnhDQm9GV3hUS0dmR2JORUd5aTk2L2UyU255VUZFM21L?=
 =?gb2312?B?RWdxS2EydGU1QzhyYWJhOHVwejZTV216Nm5nbnM2cHpkU2lkczV1M2t3UTM5?=
 =?gb2312?B?N0hkekgyZWtjL1NtMnNFcGxzMmpkK3JUNDBYMnR2cDZCcG5iS2NIRGZrQ083?=
 =?gb2312?B?ZTkveWtTaWR5M25wWEdJd0RTWUEyZE1LalM1bXBkM2dtRTlVVHhIWTlNdlow?=
 =?gb2312?B?cGtuaXJkaXFJamJtdjkzWFlSNFFLWXM1ekNUdTYyeEJFcFFocmRENGlQMzA0?=
 =?gb2312?B?MVk3K21Hbk50Yk1vZjlYdjJFT2xBdFlHYUJoemVhM2VpVllQS0ZleDhVSUZz?=
 =?gb2312?B?YXgxNXRLWjFva0NvSnJ5a1paWEQxTnZtVmVEeHQxNnZhUFVERUdNZG9vNVF3?=
 =?gb2312?B?K0k3NEt6Rk9yYlQvRnhBTlZVQWZYdGc5UmYvZHdxbGJTT2V2b3JRd2hWVm5W?=
 =?gb2312?B?TEJRU1g3SisrMVZXZXlvdXdRT0xSQ0hyYUNkdC81Y24zZVFuL1c4cmoweXhB?=
 =?gb2312?B?MzY0THU1U0QrRzJWZVk0ZDNSMDVseThrbURyYjc5S3hMaXpXSi9XMXBzUFky?=
 =?gb2312?B?M0taYnZtd3VhbzBGc1Rza2tpQWVSVGV4aVlSeDZnWmhEUkJwendOVGNYZ3JC?=
 =?gb2312?B?US9UWGlXVDk1Vno0QWJ4eGErTHAxbjZiOVlkUUdERHFzRmlWcFJiZW1Xa3JU?=
 =?gb2312?B?aHVVQlVkOUpaZ2U5enBad1BkdisrQVA0NDZhaEIyTlRYSEMzeWJLSkRiZ0Fm?=
 =?gb2312?B?dUptTTN0Mkp6eGROVkN1UkZmWDE4amRPYk1qVU15cm5Jd01TS0FRMDhGejhy?=
 =?gb2312?B?T094ZFY4Z3hLR24zRzJzNlAwZjZDRnhUMnY4MHd5elBDL3ZIU1kzcGxBb2pE?=
 =?gb2312?B?SmpNRkVuTCtpUzFHaWhVRExxL2IxZ1pYOTNWTWU0cVRHcHJwMzNWTmV6OWhZ?=
 =?gb2312?B?bjZqRTMvNFovNjVTVEVkcG5aVXFTMGpPTFpreGpmMnd2TUdHSTl1eUdyc05R?=
 =?gb2312?B?MG1QMUVHT2Zud3hSREE3cCtIb29mZDFySDNVRDZPNXBDMlpOQkZoYTFoMFhm?=
 =?gb2312?B?WHAyRnlSVHFzTXZmNzBIS0NiTWp4VnlPOUMvcUt2Wlg5cmJjUW9zUjljZUJh?=
 =?gb2312?Q?qUwJtE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?dkNUdXZ2MStiUXpuajQ5ZTZvR0tDNEZmakszcXg5MUxsSXlZbHFHR28yVS9x?=
 =?gb2312?B?S1cwcjdMdlBkZGkvMXlWVXpUWCtGdmZPMXVyOU4wZGNvRHZydkJlV0xKclFG?=
 =?gb2312?B?NlVwYXRzMjFzY09XU1dValVscXNPbEQ4bTVKbUZwcDlvdU94cWRoS2U4VFVS?=
 =?gb2312?B?aHNMRWp4SU5tTG9ZRzhXLzh0bFFoN1lFYUdjVmEyUVlOUm9GMXYrZVJhVzFC?=
 =?gb2312?B?WTJ4N3EwYlgrVVBqV3ZKRk04Wm1OK2x5bTF6R0M5MnNmVXFpcFZ3M1NqRjJo?=
 =?gb2312?B?Z3VNTnhzaGtzU1djYTZWVURWQ28rMlVsNG1YMUw4bVFyY0VoKzBrUXBlbktq?=
 =?gb2312?B?NDJtZDRKay80dXczMmh3aHJRNk5tcGtBRkxpcWphQ3NTQ0lSOEZ6T1M1TjBo?=
 =?gb2312?B?UGtuSHY0VDhiM0FhQlZBWWZ2Ym5hR2V4ZXMyTThKeStNMEIvMTQrQVB4RWdk?=
 =?gb2312?B?V215WlkyRXNuK2VjMDdXZlZOTGlIQzBkeDlER1k4S2lWQjNENTB1SGd0ZEFv?=
 =?gb2312?B?UU9la2JlaEJXN0JqbzRtQ3VLL05aSHY2Z2lUUSs2cVg4L09ML25iZENFU2NI?=
 =?gb2312?B?K0VZbkF2WS9FUFdaYnBWQVd2dmREMGlBT3Y1K2hPeldjLzBOajYzaFY2bFZ5?=
 =?gb2312?B?YllBdllSeVpiSlpjY3lGdmZSZkxRc0tqY2s1SVNPUnAyWFZrMlJkcHJxcnlT?=
 =?gb2312?B?TndJMHhWdWtNK0JxeklhbmF5VEJDN21xNU5mNXo2b2ZmQVI1RnBTUFV3U2E5?=
 =?gb2312?B?SDNiNlBHUUFMQzZKbGN0Vm1ZcGM2d1p0eUJpcnZsWDV4NFZpNTlaSXVYZDBT?=
 =?gb2312?B?YVg4blNQQm81ZVhCNHpac3ZndEJrRzNmbjZ0cVJnTWwwNDBKSTU4NlBvV05C?=
 =?gb2312?B?RmFXeGQyUTk3NWxqRlVTSXc2bFdzN0U0b25zUXJucXI3dnV5RlNEZnEvUjNw?=
 =?gb2312?B?NFE2WGFlb2wvTFdyMWN6cGg5VlJ3SGNEWUhoNGJBVjNiZ2p1WUZwSjNFRE1O?=
 =?gb2312?B?cDl1cWhNc0w2TmtPbXVjTmlraDhwaWxaTHlpLzAwdmh2dVI0bWJFVTJ1cFFU?=
 =?gb2312?B?cG5OUS9raHNjQWkyUUJTTXZkQkZPMjV5Q3BRbWVpMFdQT3Z0YTNnY1VKcnFJ?=
 =?gb2312?B?eE9rNUtFU1lRN1UvZmExdEVvT2ZTL25XeXhnVkZ5U0J4TzRlak1xUjczTU8w?=
 =?gb2312?B?M0NzRkJJSjFxM3hLd2ROWTFmL2pncW1GbUlIaWJDZ2VmcDNHOE9SSTc2dDls?=
 =?gb2312?B?aW5OVVlwMnpCMi83NXh0czJxZ1R4blcvTUhoWllYNFhXMFFqTG51d2FvNHdX?=
 =?gb2312?B?azNNRVI2a2IwcEl6eU9SdnVZRkZKeEZ5Rk5udVlTcFFPbXp6YjAyZXV6M2Jx?=
 =?gb2312?B?QlduN0w5ei9TSWowZ1hETC9FVEVEVnhnZ1lZdGdoSmNKeS9LSWxnazE3aFpx?=
 =?gb2312?B?VFBENXBPRU9UNVNEclV6MUpiUzh5ZXJ3bDVsOXlhd3N0a0ZHdkpaaHh5NVho?=
 =?gb2312?B?aHI0ODZtVitEUkpETHk4b2VCNXh2UEJUWWJkWThTMXI5VW9aRzlXQU1xM2hR?=
 =?gb2312?B?Z3BGb3RqekVlYU9pQno5akwyWERmaGhuV3NmVWp2SVF1dmx1dFloTmJwUXE1?=
 =?gb2312?B?bVI2b0ZXVGFCZlVEYkh4NEZDUldWam14NjFyTFYxQWJISkFOQ0RrU2NJb2Nj?=
 =?gb2312?B?UW51QmgvS3ZMcDNYVk9kUVFFY2djMUJYK3NvellETk9sWE9FbWlIMkUrZzVi?=
 =?gb2312?B?OFZyZnNEd2JYTkhObVJaVzcrTy84bjdlaFJqUytiaVpOQ0QvRTVVa0tiWWQy?=
 =?gb2312?B?MHJZbVpGdkdlREFkTVg3QU5IOENVYW8vQVJyOGxoMXE3QUpQNXZ3anlwd3Z3?=
 =?gb2312?B?UDdLMHVUM1VnbU1DbENkY24vRWljVFRNaWRiaFFRYTI1ODFVTlc0bjlwbVcy?=
 =?gb2312?B?amFUWlppUm93dnJiYU1XWHpiazBIVC9BTkx3RVM5V0lLWDZwdGJDRmJoaFBJ?=
 =?gb2312?B?b0VuSkVHbmdhdXdqWnNCSEdrenpYcEQ2TjREMTYycFc1enRYaWlSR0l3aURN?=
 =?gb2312?B?UExmdGZSVzdGczZBdm11RmZlUDhKY0VIUzZjQkZzUWxaQjVHaG56b3ZnR1lU?=
 =?gb2312?B?MDBjaHdSalZITlRTZmZPT0xVenk3ZVJ4UGFIS05saFNHN1Eyb3BlZlE2THBp?=
 =?gb2312?B?UmRLZC8ySDMyZUtrNVYwT3BCR1hEclA3cit5ckVsVHRrclhxZ3BPSkpxeTQz?=
 =?gb2312?B?eWcwUGR6VFk3TXA0Q01RQ1YwZ1JBZWJBRndySGd6NFZZOGpKTHVsTVJZY1Qy?=
 =?gb2312?Q?ebqcmii9VtFkGuM+Lg?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae5c5a5-67cc-4e87-49bb-08de4b8efdac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2026 12:44:24.6165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oM1oj1w9ZgOYzBwUTTChsRt84+OPOT/nbPQhhqQKpbToDHPjei2EAVuMQ9WVoQq4ZcKyONeevue1H/0Tam+b9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6978

SGVsbG8gbGludXggZXhwZXJ0czoNCg0KSSBoYXZlIGEgcXVlc3Rpb24uIE15IGRldmljZSBmcmVl
emVzIHdoZW4gdXNpbmcgaXQgd2l0aCBkaWdpdGFsIGhlYWRwaG9uZXMuIA0KVGhlIHN0YWNrIHRy
YWNlIGlzIGFzIGZvbGxvd3M6DQoNClsxOTIxNjUuMTA3OTM3XVsgICAgQzBdIHhoY2ktaGNkIHho
Y2ktaGNkLjMuYXV0bzogRXJyb3I6IEZhaWxlZCBmaW5kaW5nIG5ldyBkZXF1ZXVlIHN0YXRlDQpb
MTkyMTY1LjEwNzk0Nl1bICAgIEMwXSB4aGNpLWhjZCB4aGNpLWhjZC4zLmF1dG86IEZhaWxlZCB0
byBjbGVhciBjYW5jZWxsZWQgY2FjaGVkIFVSQiAwMDAwMDAwMDJkNzU2ZWFiLCBtYXJrIGNsZWFy
IGFueXdheQ0KWzE5MjE2NS4xMDgzODddW1QxNzQ1NF0gdXNiIDEtMTogcmVzZXQgZnVsbC1zcGVl
ZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2ktaGNkDQpbMTkyMTY1LjIyNTkwNF1bVDE3
NDU0XSB1c2IgMS0xOiBkZXZpY2UgZGVzY3JpcHRvciByZWFkLzY0LCBlcnJvciAtNzENClsxOTIx
NjUuNDQyMjI0XVtUMTc0NTRdIHVzYiAxLTE6IERldmljZSBub3QgcmVzcG9uZGluZyB0byBzZXR1
cCBhZGRyZXNzLg0KWzE5MjE2NS42NDIxMDddW1QxNzQ1NF0gdXNiIDEtMTogRGV2aWNlIG5vdCBy
ZXNwb25kaW5nIHRvIHNldHVwIGFkZHJlc3MuDQpbMTkyMTY1Ljg0NTg3OV1bVDE3NDU0XSB1c2Ig
MS0xOiBkZXZpY2Ugbm90IGFjY2VwdGluZyBhZGRyZXNzIDIsIGVycm9yIC03MQ0KWzE5MjE2NS44
NDYwMzFdW1QxNzQ1NF0gdXNiIDEtMTogV0FSTjogaW52YWxpZCBjb250ZXh0IHN0YXRlIGZvciBl
dmFsdWF0ZSBjb250ZXh0IGNvbW1hbmQuDQpbMTkyMTY1Ljk1NzkyN11bVDE3NDU0XSB1c2IgMS0x
OiByZXNldCBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDIgdXNpbmcgeGhjaS1oY2QNClsx
OTIxNjUuOTU4MDMyXVtUMTc0NTRdIHhoY2ktaGNkIHhoY2ktaGNkLjMuYXV0bzogRVJST1I6IHVu
ZXhwZWN0ZWQgc2V0dXAgY29udGV4dCBjb21tYW5kIGNvbXBsZXRpb24gY29kZSAweDExLg0KWzE5
MjE2NS45NTgwNDBdW1QxNzQ1NF0gdXNiIDEtMTogaHViIGZhaWxlZCB0byBlbmFibGUgZGV2aWNl
LCBlcnJvciAtMjINClsxOTIxNjUuOTU4MTY1XVtUMTc0NTRdIHVzYiAxLTE6IFdBUk46IGludmFs
aWQgY29udGV4dCBzdGF0ZSBmb3IgZXZhbHVhdGUgY29udGV4dCBjb21tYW5kLg0KWzE5MjE2Ni4w
NzA2MjNdW1QxNzQ1NF0gdXNiIDEtMTogcmVzZXQgZnVsbC1zcGVlZCBVU0IgZGV2aWNlIG51bWJl
ciAyIHVzaW5nIHhoY2ktaGNkDQpbMTkyMTY2LjA3MDcyOF1bVDE3NDU0XSB4aGNpLWhjZCB4aGNp
LWhjZC4zLmF1dG86IEVSUk9SOiB1bmV4cGVjdGVkIHNldHVwIGFkZHJlc3MgY29tbWFuZCBjb21w
bGV0aW9uIGNvZGUgMHgxMS4NClsxOTIxNjYuMjczODM1XVtUMTc0NTRdIHhoY2ktaGNkIHhoY2kt
aGNkLjMuYXV0bzogRVJST1I6IHVuZXhwZWN0ZWQgc2V0dXAgYWRkcmVzcyBjb21tYW5kIGNvbXBs
ZXRpb24gY29kZSAweDExLg0KWzE5MjE2Ni40NzM3ODhdW1QxNzQ1NF0gdXNiIDEtMTogZGV2aWNl
IG5vdCBhY2NlcHRpbmcgYWRkcmVzcyAyLCBlcnJvciAtMjINClsxOTIxNjYuNDczOTQzXVtUMTc0
NTRdIHVzYiAxLTE6IFdBUk46IGludmFsaWQgY29udGV4dCBzdGF0ZSBmb3IgZXZhbHVhdGUgY29u
dGV4dCBjb21tYW5kLg0KWzE5MjE2Ni41ODU4MDJdW1QxNzQ1NF0gdXNiIDEtMTogcmVzZXQgZnVs
bC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2ktaGNkDQpbMTkyMTY2LjU4NTkw
MV1bVDE3NDU0XSB4aGNpLWhjZCB4aGNpLWhjZC4zLmF1dG86IEVSUk9SOiB1bmV4cGVjdGVkIHNl
dHVwIGFkZHJlc3MgY29tbWFuZCBjb21wbGV0aW9uIGNvZGUgMHgxMS4NClsxOTIxNjYuNzg1ODUw
XVtUMTc0NTRdIHhoY2ktaGNkIHhoY2ktaGNkLjMuYXV0bzogRVJST1I6IHVuZXhwZWN0ZWQgc2V0
dXAgYWRkcmVzcyBjb21tYW5kIGNvbXBsZXRpb24gY29kZSAweDExLg0KWzE5MjE2Ni45ODU4Mjld
W1QxNzQ1NF0gdXNiIDEtMTogZGV2aWNlIG5vdCBhY2NlcHRpbmcgYWRkcmVzcyAyLCBlcnJvciAt
MjINClsxOTIxNjYuOTg2ODM2XVtUMTc0NTRdIHVzYiAxLTE6IFVTQiBkaXNjb25uZWN0LCBkZXZp
Y2UgbnVtYmVyIDINClsxOTIxNjYuOTkwNzQ0XVtUMTcxNzBdIHBjIDogeGhjaV9pbml0aWFsaXpl
X3JpbmdfaW5mbysweDAvMHgzMA0KWzE5MjE2Ni45OTA3NTRdW1QxNzE3MF0gbHIgOiB4aGNpX3Np
ZGViYW5kX3JlbW92ZV9lbmRwb2ludCsweDg0LzB4YjgNClsxOTIxNjYuOTkwNzYwXVtUMTcxNzBd
IHNwIDogZmZmZmZmYzBmMmQ2YmExMA0KWzE5MjE2Ni45OTA3NjNdW1QxNzE3MF0geDI5OiBmZmZm
ZmZjMGYyZDZiYTEwIHgyODogZmZmZmZmODg0MDgyYTdjMCB4Mjc6IGZmZmZmZjg5ZTRlNDNjMDAN
ClsxOTIxNjYuOTkwNzcyXVtUMTcxNzBdIHgyNjogZmZmZmZmOGE2ODlkMmMwMCB4MjU6IDAwMDAw
MDAwMDAwMDAwMDAgeDI0OiAwMDAwMDAwMDAwMDAwMDAwDQpbMTkyMTY2Ljk5MDc4MF1bVDE3MTcw
XSB4MjM6IGZmZmZmZmU4ODEyMTJlNTAgeDIyOiBmZmZmZmY4OGZlYWFkMjEwIHgyMTogMDAwMDAw
MDBmZmZmZmZlZA0KWzE5MjE2Ni45OTA3ODhdW1QxNzE3MF0geDIwOiBmZmZmZmY4ODgwZGQ2MjAw
IHgxOTogZmZmZmZmODhmZWFhZDIwMCB4MTg6IGZmZmZmZmU4ODNkZWJmMDANClsxOTIxNjYuOTkw
Nzk1XVtUMTcxNzBdIHgxNzogMDAwMDAwMDBlMTFmN2E4MSB4MTY6IDAwMDAwMDAwZTExZjdhODEg
eDE1OiAwMDAwMDAwMDAwMDAwMDAwDQpbMTkyMTY2Ljk5MDgwM11bVDE3MTcwXSB4MTQ6IDAwMDAw
MDAwMDAwMDAwMDAgeDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjogZmZmZmZmODlhN2RjZmM2MA0K
WzE5MjE2Ni45OTA4MTFdW1QxNzE3MF0geDExOiAwMDAwMDAwMDAwMDAwMDI5IHgxMDogMDAwMDAw
MDAwMDAwMDAwMCB4OSA6IDAzZjI4MjIwZTI2YTBhMDANClsxOTIxNjYuOTkwODE4XVtUMTcxNzBd
IHg4IDogMDAwMDAwMDAwMDAwMDAwMyB4NyA6IDAwMDAwMDAwMDAwMDAwMDAgeDYgOiAwMDAwMDAw
MDAwMDAwMDAwDQpbMTkyMTY2Ljk5MDgyNl1bVDE3MTcwXSB4NSA6IGZmZmZmZmU4ODI1M2VkYTgg
eDQgOiBmZmZmZmZmZWU2OWY3M2UwIHgzIDogMDAwMDAwMDA4MDJhMDAyOQ0KWzE5MjE2Ni45OTA4
MzRdW1QxNzE3MF0geDIgOiBmZmZmZmY4OWE3ZGNmYzYwIHgxIDogMDAwMDAwMDA4MDJhMDAyYSB4
MCA6IDAwMDAwMDAwMDAwMDAwMDANClsxOTIxNjYuOTkwODQxXVtUMTcxNzBdIENhbGwgdHJhY2U6
DQpbMTkyMTY2Ljk5MDg0M11bVDE3MTcwXSAgeGhjaV9pbml0aWFsaXplX3JpbmdfaW5mbysweDAv
MHgzMA0KWzE5MjE2Ni45OTA4NTNdW1QxNzE3MF0gIGhhbmRsZV91YXVkaW9fc3RyZWFtX3JlcSsw
eGFjYy8weGRhMCBbc25kX3VzYl9hdWRpb19xbWkgMGZhYzU3YzAyZjA2ZDAzOGQwMTVlNTcxOTM5
MGY5YjNlZGE4NmU2MV0NClsxOTIxNjYuOTkwODY1XVtUMTcxNzBdICBxbWlfaW52b2tlX2hhbmRs
ZXIrMHhkOC8weDE0NCBbcW1pX2hlbHBlcnMgNGUyNmUxM2UzZjc3ZjNmNTNmMDBiMTI4NWU0N2Rl
YTkxNjdlYzNiNF0NClsxOTIxNjYuOTkwODc4XVtUMTcxNzBdICBxbWlfZGF0YV9yZWFkeV93b3Jr
KzB4MmVjLzB4NzY0IFtxbWlfaGVscGVycyA0ZTI2ZTEzZTNmNzdmM2Y1M2YwMGIxMjg1ZTQ3ZGVh
OTE2N2VjM2I0XQ0KWzE5MjE2Ni45OTA4OTFdW1QxNzE3MF0gIHByb2Nlc3Nfc2NoZWR1bGVkX3dv
cmtzKzB4MWM0LzB4NDVjDQpbMTkyMTY2Ljk5MDg5N11bVDE3MTcwXSAgd29ya2VyX3RocmVhZCsw
eDMyYy8weDNlOA0KWzE5MjE2Ni45OTA5MDNdW1QxNzE3MF0gIGt0aHJlYWQrMHgxMWMvMHgxYjAN
ClsxOTIxNjYuOTkwOTEyXVtUMTcxNzBdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMA0KWzE5MjE2
Ni45OTA5MjFdW1QxNzE3MF0gQ29kZTogYThjMzdiZmQgZDUwMzIzYmYgZDY1ZjAzYzAgY2VlNzc5
NmEgKGY5NDAwMDA5KSANClsxOTIxNjYuOTkwOTI0XVtUMTcxNzBdIC0tLVsgZW5kIHRyYWNlIDAw
MDAwMDAwMDAwMDAwMDAgXS0tLQ0KWzE5MjE2Ni45OTA5MjldW1QxNzE3MF0gS2VybmVsIHBhbmlj
IC0gbm90IHN5bmNpbmc6IE9vcHM6IEZhdGFsIGV4Y2VwdGlvbg0KWzE5MjE2Ni45OTA5MzJdW1Qx
NzE3MF0gU01QOiBzdG9wcGluZyBzZWNvbmRhcnkgQ1BVcw0KDQpUcmFjZSAzMiBhbmFseXNpcyBy
ZXZlYWxlZCB0aGF0IHRoZSBjcmFzaCB3YXMgY2F1c2VkIGJ5IGVwLT5yaW5nIGJlaW5nIG51bGwg
d2hlbiBjYWxsaW5nIHRoZSB4aGNpX3NpZGViYW5kX3JlbW92ZV9lbmRwb2ludCBmdW5jdGlvbi4g
DQpJIGhhdmVuJ3QgY29tZSB1cCB3aXRoIGEgYmV0dGVyIHNvbHV0aW9uIHRoYW4gdGhpcyBvbmUu
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXNpZGViYW5kLmMgYi9kcml2ZXJz
L3VzYi9ob3N0L3hoY2ktc2lkZWJhbmQuYw0KaW5kZXggYTg1ZjYyYTczMzEzLi4wNGFlMmNiYmE4
MzggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktc2lkZWJhbmQuYw0KKysrIGIv
ZHJpdmVycy91c2IvaG9zdC94aGNpLXNpZGViYW5kLmMNCkBAIC0yMDYsNyArMjA2LDcgQEAgeGhj
aV9zaWRlYmFuZF9yZW1vdmVfZW5kcG9pbnQoc3RydWN0IHhoY2lfc2lkZWJhbmQgKnNiLA0KIAll
cF9pbmRleCA9IHhoY2lfZ2V0X2VuZHBvaW50X2luZGV4KCZob3N0X2VwLT5kZXNjKTsNCiAJZXAg
PSBzYi0+ZXBzW2VwX2luZGV4XTsNCiANCi0JaWYgKCFlcCB8fCAhZXAtPnNpZGViYW5kIHx8IGVw
LT5zaWRlYmFuZCAhPSBzYikNCisJaWYgKCFlcCB8fCAhZXAtPnNpZGViYW5kIHx8ICFlcC0+cmlu
ZyB8fCBlcC0+c2lkZWJhbmQgIT0gc2IpDQogCQlyZXR1cm4gLUVOT0RFVjsNCiANCiAJX194aGNp
X3NpZGViYW5kX3JlbW92ZV9lbmRwb2ludChzYiwgZXApOw0KLS0gDQoyLjM5LjANCg0KSSB3b3Vs
ZCBsaWtlIHRvIGFzayBmb3IgYWR2aWNlIGZyb20gZXhwZXJ0cyBvbiBlZmZlY3RpdmUgd2F5cyB0
byBmaXggdGhpcyBwcm9ibGVtLg0KDQpUaGFua3MNCg==

