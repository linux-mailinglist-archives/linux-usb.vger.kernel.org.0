Return-Path: <linux-usb+bounces-6901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C285FDA8
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 17:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48419B28E4A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 16:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5EA151CED;
	Thu, 22 Feb 2024 16:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="2FFFx5dK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=seco.com header.i=@seco.com header.b="JOOZZdXO"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2109.outbound.protection.outlook.com [40.107.8.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640491468F2
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.109
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708618112; cv=fail; b=rKnGz+Wigc+Wtei3dXuf1imw4PQ6r8CMS/TybYQ6XvNw6PzUfJBSOQnoXnqe5ithEHX8KbfnxKkvttHqS6AD8JPq2d13kUAaLdz04g8gv0YAQx4ohYM6h34GzXbPNVvoIVR+6n1bBf5R4OOXFoI7XYrAREH+H1t48auaFZJ4ziA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708618112; c=relaxed/simple;
	bh=06SRLTYOFrDPXnJ0fem2bhSDWk2q3Uv18C4EjhbrSDQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UuvyRJsQtgYyeys0oQxukm4coV93lKbZgQT1nGPjF3ebzKGNzd4bO49Oo7xkbmenhi2wnbWtqFAPIsqZcC7G988iKqzHEIxbz23sosHQq6qCzRKLclsPXu1J4BmHkwSGyslMl0eAQpENPLtZKj/jxFi2EGvwGPXgIkoDuXggDlM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com; spf=pass smtp.mailfrom=seco.com; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=2FFFx5dK; dkim=fail (2048-bit key) header.d=seco.com header.i=@seco.com header.b=JOOZZdXO reason="signature verification failed"; arc=fail smtp.client-ip=40.107.8.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seco.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dg+L2qUG4dcXoQu0Xe09gmydI/TE8FAfrx6ohVtTea9pmnhWkNwHjwdH0k9wUW2QbIkuyoQ4cr+T4Y3Bd1kcwQrYlPk2nH0t1VvnFpq8o15sRG1EVg3/Hce94Kqv5AQBE7ZTWk7XybTUTV35UNr/Nc/9tvGDaVRx554N5y2pV4IUCHAeEhSHfIA2V0AdeAwr3K2roGkRirqtSWoeegk6VC3SWqxLgEh4ir9BIsjeZKBOVYmStkNjCfoOGATpCui43RSLpEM7L7aQjzyCf4MvGv786D4m0P4l/BzWFy6Aawd2DtV8h4ZNwEwSA+if+ZdhtU+fD2uGoV0j2mmtRzC2ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQr7XwZCSMswEl4eOpjZ+AgkmsrJ2VXn9gUSgGHjjWA=;
 b=hrkTPPGQYxCcNQPpafxOyg9NamZrSXWy7b7sRkcB/6XtmdM653nE8cV6Iy1yw35dX430bMrxOl7FSwMGBI/GJ7LARN6TrKXjqbFKQjGqV16p4YilCra5V9R3eSMxmf6ZPkdFVwx4gv6gb3UQHYBK/5xrO3xnxwayVNPrf/dxyS3eRlQug6r7g9uo8HgPtdEUS56qf3SNX0I+IWdqA6Mu0DsCMo9ZyChe3FPS2vDimEe5FkQrFp9KqblM/h3a2Nf2FFHTeOyjv2ArmXE8HFPH1ACwSo0PO5kIw2Ntf7+MpjHSdyVK8293qQwpAPDQ4RsX5VhlA+I8Ji1jd7t5OrnC1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.84) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQr7XwZCSMswEl4eOpjZ+AgkmsrJ2VXn9gUSgGHjjWA=;
 b=2FFFx5dK6nTk9ZffIm9aGsFV7bqX+UbxsVmwehc/Fq84LLq2crVAF0rf3s3vTLiZ3ILzcUMXuJEx3V9a6qSbaeI1lda17hn/HX7FdhZVSG+0eFo8azQMvdXdGKNBBcJbtshfg5OOAWvd7Iup1gweeSHhYOR7sLLAwojn5LRe4EBNdSWQvpltfEaI+5VCGUpr64P5IRrHmUSyyG8/2KRQ9Y/dSl7+8J7n6uCEm8jb26yry6zau0hRKQ4QZWZbmPcAWBoimkWCiUGbB5Q1yBWpBpesWgChm5IBxcb+lcyP7JYSglTZq68douvxGAnFyCeztsYeEpBJmkDsg01iMIPrNQ==
Received: from DU7PR01CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::9) by DBBPR03MB7449.eurprd03.prod.outlook.com
 (2603:10a6:10:20b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 22 Feb
 2024 16:08:24 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::8a) by DU7PR01CA0021.outlook.office365.com
 (2603:10a6:10:50f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 16:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.84) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 22 Feb 2024 16:08:23 +0000
Received: from outmta (unknown [192.168.82.133])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id AC9A420080F8F;
	Thu, 22 Feb 2024 16:08:23 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (unknown [104.47.11.41])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 9419C2008006E;
	Thu, 22 Feb 2024 16:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcMn1vWCwmLKw7naeNV+EJxZq7JkhGsVn+Gjg48YOZJPb+Lhbvle0IGX6VF1PY4geDMUN8b14wUZdWqTT852PqNI7I7oFkJxx90RlQD5+BrtucxrGpFp/omcv7QyhGcKTuwvHbRXbsGr1DLNdBuMrBJARwFMI64UzipbaqvTFAo86yqQC2EWlCkge5CwMJXml6zK7MGCyY+x7RnaxyXdANV36PuFuIqxrrZ52sraeXXoQp82yvMxTjBzfq1bsAxBVQerShTYp2akuGl73Tvhk7R925r8oP6GgFqOEIj6hGEqi+Wt/yHSA8kktnQgioKo+PrNvUp7eZtCuULK7prP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nclP4TljM7cfYzYhYrQ12+ATXAh0saTcYI5hOqHp788=;
 b=NvcnPlvtUcyFL6Pp3fDTnDLoxajSealOU9yvk0Z8rQwHbT/Eix7qbaX7nTGOgTju2WpBDTOqRxIwmmTayXqbKc7Sgsy2+dfCusNiC0ab89B6ZJKhMXFF6ynSJoLbESPcC0gcoI81FjxI9LWHV7J8F3UdgdeRzlZOAHxZ5yZ7wWid1A6I6VL1+1Eb8ltEdlCMeiCuwNZ8a16GB336B9+NZjYioz8LL7s6Ugrp04xbdX/NaRh1AMGi5pclRdhc/j4TwPnandiG5F00bR6S1burVJmycRgh8kVtupyAjXzQFG0/EH63LwRZAdFyFLjSZ5HpEQEik+p4fUi5QJKWwcUsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nclP4TljM7cfYzYhYrQ12+ATXAh0saTcYI5hOqHp788=;
 b=JOOZZdXOKqa6LmlwZc/wr+zA0sfBuNfvpmDQh53IABOviTThyKmU/JbeWuWaseBrLE54KaASRKuzcIfHJDFikAoBw82kjQIEUtfdGn6bT6f+r7KorM5BMblGlAg0xvA6jmKMCgF/b5fH4eGXALPrLxSSE4/Y8cFynHZFyHwfQ0qgGyKG0O6awDjobBjt/onRHUbTygQpRq4TH9+G7Cci0LELDw2I4RbdbylO9BklAEZV7lV/vVIDbL4RJqlbdAxXdHzi0l87q2oJpH9/9JM/rJJ2u1FEUFNuhabL2S+9PjZd5WKb4ZsU/R49X6V9O1GSOCIimbLbO1ghppSfrsWjAQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 16:08:21 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::9529:5f9c:1795:a94c]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::9529:5f9c:1795:a94c%7]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 16:08:21 +0000
Message-ID: <d53efc6d-2683-4674-96c4-03175802289b@seco.com>
Date: Thu, 22 Feb 2024 11:08:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: usb-next tree has patch applied twice
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-usb@vger.kernel.org
References: <3469745.QJadu78ljV@steina-w> <8339216.T7Z3S40VBb@steina-w>
 <2024022254-tiptop-sublease-6357@gregkh> <22194332.EfDdHjke4D@steina-w>
 <2024022208-macaw-phrasing-9357@gregkh>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <2024022208-macaw-phrasing-9357@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB9PR03MB8847:EE_|DU5PR03MB10263:EE_|DU2PEPF0001E9C0:EE_|DBBPR03MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e80365c-6042-4712-e427-08dc33c07f2d
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hjxOugclmwUuw3YSJSJk888FITb5FqFRFGq75dLDvwnmWDCBv36ceymQ52DBVMpJOVYq1K+O7gGKmKuXNTQCAnDlI2BdF8556Th/37/6TA+cKFeICCJo46Yh9feKHtO6+xyHI1/ii7cfw01ztQogLojF7c5KgrpJ0g/ARKO12OdjQ2vQjnTLYLWdZKMsY50rHoPOeuC4wzN97MflFM6T3DFamOocY+MFe0bZgAzFEp0fce6LB6Ami48znMqj1wMVLadSz2d49KePWvMDbqYo9iW5y5N3cTh6Wm3s4jm1hnG3Nf9xwRuAcfp30xcFmwiaJrb3Zd8jG+8n5751XuFNyWOD+OpER77R3C8ducow+4klK7iYZlfKRru5MYxglwVt6ThscU7AY991xpMiWa5BAk3Gd0p6/V5+jwizL9eqm1rgxPa63L9xu5Qgxfo2rjsVULTnBP+a3dx7rzcfc+AaAghoWSDbgO6K4AByVe7mMxDfkpO8du03NbyjxpMl7uRs69VVJ63/yoEMbWSWOnbz1qdqryXVoPsd2eTBpDW4X2U4avSlua9NxOiAnzRJgYe8N/LKJi0de90eI46oaJvheArTLhEVgSYpttb4lvZz2xM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10263
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3aa205f4-99c2-4e67-ac73-08dc33c07cdc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JhUPXkygjcBr3atLJ+SgJ/YvZ0GszKduovRJenslTyF76SMGhFEyOy73L5VdmWQm5hVqeER5a7gcml/mdVqAfPPjBEx9FxnJaAcgjDq/vTsoVtWDCh8+tjWCMqci0hZEr/OuDei5dtufAWiO3jeai2P8IQaprEJxcC2t4aLNti0zEY7FG6gIKYHelA8WWkeODPWgRYD8VQv8AxrwJSQ0k5cgDUcHyxBLDgAwhz8/UxZYX/FbGInCsu60ubw9kkX/zNS9pAiLjmqmyWj/EruOhi1rQU/ejkbd+EZkMZDo0fS0XhtgQ8y4/C8uX71fgXBLNOWPF8K7Vdo2GL2ISjYOuqhCSeDfjf1mxb67lCsVj9dYf5Sb/w55WTa3xLIzJ0zAqvRdKaaxMFesFRAQ4gHwdxjse5ay1/v3Ukw2wAvo3SR34/AHURM5IjQtwrjRYnz8xmiV9CFH+CJJZ7Ko5dvIUZZnCC2OVHt4myxuXKmTnAI7Qmejh6vK/2iE+3d8ILK2vEO8Vd9xao3jbpCb1kX9tamvNXxdHenNrI8jeGXX4zyD5lMDfFywM8BX9a2f3ITl5YYrczUv3Fe6hV6mOjyptLTcZKEYFDhftZlo0M7xGRYCWRXc7bflaD8ObVXnf+wmv/D0SNSOiSZVZ3icZgzqhg==
X-Forefront-Antispam-Report:
	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:08:23.9281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e80365c-6042-4712-e427-08dc33c07f2d
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7449

On 2/22/24 09:05, Greg Kroah-Hartman wrote:
> On Thu, Feb 22, 2024 at 02:46:46PM +0100, Alexander Stein wrote:
>> Am Donnerstag, 22. Februar 2024, 14:06:12 CET schrieb Greg Kroah-Hartman=
:
>> > On Thu, Feb 22, 2024 at 11:16:59AM +0100, Alexander Stein wrote:
>> > > Hi,
>> > >
>> > > CC'ing Sean as well.
>> > >
>> > > Am Donnerstag, 22. Februar 2024, 08:47:28 CET schrieb Greg Kroah-Har=
tman:
>> > > > On Tue, Feb 20, 2024 at 04:29:04PM +0100, Alexander Stein wrote:
>> > > > > Hi Greg,
>> > > > >
>> > > > > on the usb-next tree [1] the patch 'usb: phy: generic: Get the v=
bus supply
>> > > > > has been applied twice:
>> > > > > * 03e607cbb2931374db1825f371e9c7f28526d3f4
>> > > >
>> > > > This is from the 5.18 release, from this email series:
>> > > >        https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/=
v1/query?url=3Dhttps%3a%2f%2flore.kernel.org%2fall%2f20220425171412.1188485=
%2d3%2dsean.anderson%40seco.com%2f&umid=3D65610ef7-cec9-4349-9da2-5479da31f=
7a6&auth=3Dd807158c60b7d2502abde8a2fc01f40662980862-b44e4424759ff89719033b8=
aec4852f55b694453
>> > > > from 2022.
>> > > >
>> > > > > * 75fd6485cccef269ac9eb3b71cf56753341195ef
>> > > >
>> > > > This is from a newer series:
>> > > >        https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/=
v1/query?url=3Dhttps%3a%2f%2flore.kernel.org%2fall%2f20240123225111.1629405=
%2d3%2dsean.anderson%40seco.com%2f&umid=3D65610ef7-cec9-4349-9da2-5479da31f=
7a6&auth=3Dd807158c60b7d2502abde8a2fc01f40662980862-bd5a1c24e9d7496c10f251f=
b9eff5b0c1af1baef
>> > > > that I applied from there.
>> > > >
>> > > > So how did it apply cleanly twice?
>> > >
>> > > Apparently the series from 2024 is v3 from the older v2 one. For som=
e reason
>> > > only patch 2/4 from v2 got applied before. v3 seems to be a rebase w=
here the
>> > > apply went unnoticed but the patch is again part of the series :(
>> > >
>> > > > > causing my board imx8mm-tqma8mqml-mba8mx.dts failing to probe US=
B phy:
>> > > > > [   11.006720] usb_phy_generic usbphynop1: error -EPERM: could n=
ot get vbus regulator
>> > > > > [   11.017817] usb_phy_generic: probe of usbphynop1 failed with =
error -1
>> > > > >
>> > > > > Reverting/removing the patch fix my problem.
>> > > >
>> > > > Which patch?  All of the ones in that last series?  If so, why did=
 it
>> > > > apply at all?
>> > >
>> > > In my case I reverted 75fd6485cccef269ac9eb3b71cf56753341195ef from
>> > > usb-next, because that very change has been applied with
>> > > 03e607cbb2931374db1825f371e9c7f28526d3f4 already.
>> >
>> > Can you send a patch that resolves this all properly?
>>
>> Which tree shall this patch apply to? usb-next?
>
> Yes.
>
>> Shall it revert 03e607cbb2931374db1825f371e9c7f28526d3f4 from v5.18
>> or 75fd6485cccef269ac9eb3b71cf56753341195ef from usb-next?
>
> the "unique to usb-next" one please.
>
> Also realize that there was multiple patches in that series that were
> applied, can you check the others as well?

That should be the only one.

I replied to the original patch [1], but I guess I should have also replied=
 to [2] ?

--Sean

[1] https://lore.kernel.org/all/39a17b10-c66a-432e-b4ed-012374dcbe20@seco.c=
om/
[2] message id 2024012811-rounding-foam-3366@gregkh (not on lists)

[Embedded World 2024, SECO SpA]<https://www.messe-ticket.de/Nuernberg/embed=
dedworld2024/Register/ew24517689>

