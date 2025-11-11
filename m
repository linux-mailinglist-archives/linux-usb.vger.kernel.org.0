Return-Path: <linux-usb+bounces-30304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CBDC49DAA
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 01:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC251188E9CF
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 00:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07D2189B84;
	Tue, 11 Nov 2025 00:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIbvlIYK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CAE1624C0
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 00:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820527; cv=fail; b=n9Yx5uadxc8CeiY1F7vclvEmmAAW6ooQWyxir+M0F3I3G6gcPXJAG/wqpOuStoxZ7Xu9ImufKjAQTeagfI4QP9wDMFldtjaCZLXxV7+i8Tlmw6u6Axpk7VU8/HQgnPu4jSBvltcxh2olLpPanefP6L2WGcVWDOkVfNM1yFayl7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820527; c=relaxed/simple;
	bh=rwxajYDEPs0RSKqaTuvr1ohXqLcyb6K2ONVPLzuKkn8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oTCEcIvCoWan0Ijfr5lODayZbO9xWljVYmfQBUgtXsAvje+SEc5CpPk/YJhIbw9iNwmRUzBc9v+vM8T1Oxr+sNrscKuX9APV8JAYmKHajd69llmCEtGqYUbB53uX6ZRCO+hsoewp3a58jU7XMtdzYtWku+iu8OCLXM9mEAdOZxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIbvlIYK; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762820525; x=1794356525;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rwxajYDEPs0RSKqaTuvr1ohXqLcyb6K2ONVPLzuKkn8=;
  b=KIbvlIYK6QkSyfzul12m8rQxVYfrD8fw9ToLtiCv157l4V9TaTLGNNVZ
   uDhoqjVD81bANdIhI8QXqS1qoFczyCrPggJgZqNxhTJasqRX708tgJWJX
   incud8gd/jVm1+B5NeQxeQsDsayfAfJBqwyEj8DK29j9XroWufESfJ/B3
   7dpuw/TSe3mK9HPqKih+XALZoXjg2pcVD8eGJ068NgaMR2rpCjQOOp9pN
   MkCjrJtRNkC/O7cCHaGchBHH7WeNTdxUlXK1tZWEAis+lWUCfPAoC4+FF
   ElrRejikEX04weAsuchmqbNotxhnypWsIKk2fDic3P5T85IlCHkIXtmGK
   A==;
X-CSE-ConnectionGUID: SeSWdhTYQ9OQBuyRB8ebbw==
X-CSE-MsgGUID: 5nYYUrYmSnK1VwZ5dKPbIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75563319"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="75563319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 16:22:02 -0800
X-CSE-ConnectionGUID: gcpI60+3SMWaEiqoZIms6Q==
X-CSE-MsgGUID: fjFz95KzTk2xlDdOTVyC/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="193067629"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 16:22:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 16:22:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 16:22:01 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 16:22:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ov2Y9juCE0ltoclyUQ4W56Eb56tmst+L5OzhwcDmpSKxDWO+cLRnqlX2Or00Uc//74nKoD2A8k0CI3XObMs7QooBA/t3o2vKeGTzY6X896/h40tpdsxBYiCrO0uOX0mZtGvjmglzet5rTEjAWS/1oOUEMPoacdpO8ESelQh4w1J3LeAGRHcVnkze4kufEE+8wQ1HmvJXBqFqXVZb8V/DoJim0zmsIvYQTcbgsromSFh8vqzMGpPHR23NZ62rjsKyiWobFrQmcsvWAOwxBo6KhLFAhKf51do1Z/ChauuS4hRx3a+q8zKqXoe4wT1SuJI53Hhf/usN6vKNgC3g6nuL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO5ZcVnLbzC5aCPMyU4xKY4hImGoozllSPfqRYStn54=;
 b=l2manwhGL6nNUjsWo4UvTOeI/4wRGnwKwDk9j6WY2aF/1kfHfIDGrHqiveId7EuP3dUMTZAQdTgfNFjakqDOpv661UHcW7KBcehP3mz3/ZzREndz22cOfBUUWutrGt127AwymFJQ+jnYZeQ/AW3Y1hhooSxVbrwr39AyGMZnxNunMxqxXv+g/3PUbvkrzPgH45DrAXLFIAy632YuRleNdQC+LmhX+xXbBnHIlnrjzIzit6OZmDpQLiupoJfaSU+mYc9meWbcW0ePM9RL4Yv63UMK3Yy9stQ8/fiscMlPr1VJXA3bvFg9TdBsEvAlylCCiUKFcXIR5XSIJonuNhjCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5985.namprd11.prod.outlook.com (2603:10b6:208:370::8)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:21:59 +0000
Received: from MN0PR11MB5985.namprd11.prod.outlook.com
 ([fe80::8719:7f03:49ed:939a]) by MN0PR11MB5985.namprd11.prod.outlook.com
 ([fe80::8719:7f03:49ed:939a%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 00:21:58 +0000
From: "Pathak, Asutosh" <asutosh.pathak@intel.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>
Subject: RE: [PATCH v5 0/4] usb: typec: ucsi: Add support for SET_PDOS command
Thread-Topic: [PATCH v5 0/4] usb: typec: ucsi: Add support for SET_PDOS
 command
Thread-Index: AQHcSa0ASJciFAKHykKLN2VMTojETrTsT8WggABevRA=
Date: Tue, 11 Nov 2025 00:21:58 +0000
Message-ID: <MN0PR11MB5985A404B77A3A2CB3E96D2E81CFA@MN0PR11MB5985.namprd11.prod.outlook.com>
References: <cover.1761773881.git.pooja.katiyar@intel.com>
 <MN0PR11MB5985412F8014513916F7F4FD81CEA@MN0PR11MB5985.namprd11.prod.outlook.com>
In-Reply-To: <MN0PR11MB5985412F8014513916F7F4FD81CEA@MN0PR11MB5985.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5985:EE_|SA3PR11MB7534:EE_
x-ms-office365-filtering-correlation-id: 6d77270f-1791-458e-2c1a-08de20b853e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?2BH86i+e6NHWmbLzyGBSNzsgW+I47/S8Htng5Qp3Kj0Tp2KMm6ueBSdDPf5l?=
 =?us-ascii?Q?dwveMQcoTa4m5+4tvZg6VGJVb27Dp9AmFdMoIQNRpAlgDnb2EZ33jjkIU5kW?=
 =?us-ascii?Q?nb9M5xWsRa42CAIG5wy5ybcOv13TvAsr6x/tAnAuzrNzPvWfA0kCfx455Gt0?=
 =?us-ascii?Q?iu8irPTX2XHjRDhVTwpeFakhEqhAeAYwx4IuLfg/YEomPAqo+UqJ95LfKf2r?=
 =?us-ascii?Q?x615vdkmvzLeJiyj+tnNQfHVg1BUj/uoNPIVjpSdO9wCp62TLareu+tYd7It?=
 =?us-ascii?Q?H2oia8NLOsJWj2F3JoUdrQlL8CB8T7rmf7i+eknZ+3TcMw7zyHy04AJsLjqH?=
 =?us-ascii?Q?o+h6mrjFhbJ4v3lAhgPAcrCA007feunYOL/97kVJbcAXDQEC+aedhra/fw5+?=
 =?us-ascii?Q?SzcdTQAJrCW8NaWwoeHACo53n++S5osYw5NNV42K0NNl3/vDBK6mrSwVNuZ3?=
 =?us-ascii?Q?Z65xbe1U4O54LftL58CFQ8YVDlLzA0sAQWtmy1ZamxAg0nkTAh4BVMbVRCEW?=
 =?us-ascii?Q?G4ccLW9V5Qk67RSijiy/elB2LH+wbGaYyMduUy8zTvvd2R06/ZxaORo0RTaE?=
 =?us-ascii?Q?mdbq4ukSTv+LhkfgKGZZtXwkZScYSmE/eJu5VzQ9aac2HSUs4r4ozOOeSt7N?=
 =?us-ascii?Q?qS89UEWQ05P7h7Dl8/UxbWav7ocZTAbyUhYK1AUW0eaAf1G6xY1K976gtqzM?=
 =?us-ascii?Q?pWbzd+KNjckfabfUwSSRsbeujKQoQypLTdTo6t/vTodlTEg8RmckKuRmKHGD?=
 =?us-ascii?Q?JJPMyEgjJ+Vu0PZNOsw/WnDTkV77BYAGmWqIa4FUsAgacJ7pAqfqT07J2yJK?=
 =?us-ascii?Q?fFoQ4h5gqYLEDDao6KQ48DTY2fHB1xlctS21Yz8/VNm6MqsntMGxjFFLKKwl?=
 =?us-ascii?Q?CvHEkYYYZsVCH6EUUo83u+H6Plax9ylcPO3WvC9kPNASUFxWhjcRymXcur88?=
 =?us-ascii?Q?fsDpBiwi46juloMfQI1pyqDSR66po3OI4lMmzN5FhVcfaZcqlDgZ37cMYpi/?=
 =?us-ascii?Q?kumkREkwLZ0iroEsLjRKBhoBSPpRLRu9qFZCQzuDUkV9DO7rDL59K9ZKnw6m?=
 =?us-ascii?Q?51NcsGkWPPQd4efA/J3BCs4SIdkJATbDTRgCtbWpDMszcpyxSMUAU96xhjup?=
 =?us-ascii?Q?hrIQ8TnV4hJDgTwJ3enWqScwxOLWPOqVO3Nv5Yw8MNQnXOZ9jECW6jZ5UCZv?=
 =?us-ascii?Q?CE/dfsNLXuoQjskFstbQMBkfK7HDoOhxxwonwCi5w6u2DLG1Cuq2iQcFiX88?=
 =?us-ascii?Q?re1E3MF7vDUFPcub2sO7aZ1X76AU/FaWyN0iV5tbjdYX4FSR+DsikIWksJzY?=
 =?us-ascii?Q?wYJSoevQLwaGouKdWazjRuXJRmpyUSjyHsPW6IulxY3pCbFHvZja0hG5mFLk?=
 =?us-ascii?Q?3Mh+z+j0/XilHHfItxZzaR02Ekuxxth1jfW1iq+ZWsfgelIaoGnDMMrs6Hj9?=
 =?us-ascii?Q?GtInR5lQOdFVQRYr0/nviOCUUO1UMb+R2IFzgTJF9Q1cfZy61Pzid9voSvFf?=
 =?us-ascii?Q?uBePCJ+BoXTAEsfIw0LSo+TpBAOpLxYVKgoc?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5985.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XpBRSOz2aTD0FagDW4zOI62xYn9IZN/4xuScqdI9FFf0bIYiARKXbYZovTTg?=
 =?us-ascii?Q?PcndvZX9TWPZs0vu6U+n36m1a4SzsGGJTpecsAGA1vJ9zcqE1PRH6nZNYf25?=
 =?us-ascii?Q?Ub/HLqjbOIY1AmU93wN6KxEcOpXn++tQlFDkeKmmmEHai1Fvc+3V7yIKf/jq?=
 =?us-ascii?Q?I6w05f+MjRlb7dvNRYU07a97zLjll6BsO3nygwU+uvAU6HxdU9wsBhzp/lh7?=
 =?us-ascii?Q?zRIzh3hKbwwlx+ej4DV2KT1zIwz+JGw0+KukM+EIJY9sjNMEeJkmmm96hy2I?=
 =?us-ascii?Q?GW7TeH/al12ybgw4dp+fA2xH3Ov4NZs34Rv9qPAPob6TguEep/p2avJDiToO?=
 =?us-ascii?Q?yJ2qZu26C2HgQdGUjR+JwhQsbiouqGxNGxyqz+NPD80yDFpFfgv/N6ia++K1?=
 =?us-ascii?Q?gL5nmX2Kl9euaHmZFOvrJ+15mxAdcFqXncfftkBQuzWzM1V44YqpUEEEO6Zx?=
 =?us-ascii?Q?Z2aFHvv6k57qAGtwKsVLVqc+m4oaVWOm4gcRTp3eVtXBGPMdgn8uShSSa7HB?=
 =?us-ascii?Q?rhBjdPyZaBDD1f0dFUU+JfLbEBzVAZmoM3oHulL/d8ZTjR7tbiScCu966iui?=
 =?us-ascii?Q?5NUXRDDo8e/Xm/8kPljBRP9Uy2M3RYprHtvYnTpUZKP+HpbGZLAma0Ebue6O?=
 =?us-ascii?Q?GdAm8WJpBWr32eq1pakGEvwIHtbxHwf3J/jrCW+q0gpqTZFH03Ju5PrTJPXM?=
 =?us-ascii?Q?n+PFmHNz35NnN45IttVD6uwV2x+a2DDce0IuPDxda7cuVpFjVoXEeF+TMwOW?=
 =?us-ascii?Q?loP6p4oQBYiu4iq5/p12l9SFydLcHfHOldAmnVqynTLfvOXxWj/SN0t5f3a0?=
 =?us-ascii?Q?7f0Bm5vpI/o+sSud00z/qm7fN+1T5so1giC9Qj+Q9Cz3seBj2NWvbYG9ALp2?=
 =?us-ascii?Q?wK7AESiiMSc3/Jh9/drKfUkBoXSwV89HkDUizgrEEsfwxhQuqRXNw6azYGRm?=
 =?us-ascii?Q?eYIXRNRRvMyF9Z69HRVqxtao2zKokdR+n5fkGTyWoM3FG1AOc3WdDZr8cBCg?=
 =?us-ascii?Q?+ZYQqd7M4ztc7vaupp4xAxBZ4kKmqOcuyLbS8u9s5POLymp/4UnsjzzrC7Sa?=
 =?us-ascii?Q?xgDzG8odd3rNsflFc6bA3YOpG5kUMTUzA3GbTpFI7q8H4ZFyzwon7ZNt7gEm?=
 =?us-ascii?Q?8RDNZ3xOewgofhpC3fZWue16l5mCfzhof1pfqEJs57gTdLSfxrVmaZcXKv8L?=
 =?us-ascii?Q?pny3pjjnvQAYvOwZY9nX9ewcn/bokOR9UcNTpo8J+/tOkmUGDxl+wvVgkAqQ?=
 =?us-ascii?Q?/rWE2Zsz0vBRiddl/rjBMGSF2mgXZO3oK/rSoeBbXMU16ATqk+odfDNhCSl4?=
 =?us-ascii?Q?avuQpY2zl7JJEbJS8/vuy/ZC1wozQ9j+vE1y7DOL/7a/KbLymkH3q+WU7mcl?=
 =?us-ascii?Q?oLEKKSJbrXIvt/EXptAltBXhoqj3ol9n7cJ2xFlYYirYyzosH9r6gn8yrZ+c?=
 =?us-ascii?Q?WUdcCnC0ktIIU9TqLNrmjF6KGSzlDJYsUrTwm8vygdGhLTYQgQf/eUnRVZsL?=
 =?us-ascii?Q?Irmbz9BjUGO9ZLIajBYbOy7xA+GEO5PFHY4mWWfiyo+QIroZHGzMbY1fheoI?=
 =?us-ascii?Q?9TGRR8QZco3NqFMAEZorHy9OLxmDwYAMyMgc6ta/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d77270f-1791-458e-2c1a-08de20b853e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 00:21:58.5887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPWxW5AgdkDuvkjHtnoLaw1sx7aswlV/RruivrxKsabJnQ5tek0ASSgGw6/ehZVgInDo7QOjaSXhFgn0IiNlr5nsIPpch3mVGnw2YRyxlqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
X-OriginatorOrg: intel.com

Hi Greg,

Could you please take these series of patches into your next upcoming relea=
se?
These patches are rebased on v6.18-rc3

https://patchwork.kernel.org/project/linux-usb/list/?series=3D1017784

-
Thank you!
Asutosh

-----Original Message-----
From: Pooja Katiyar <pooja.katiyar@intel.com>=20
Sent: Thursday, October 30, 2025 7:49 AM
To: linux-usb@vger.kernel.org; gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com; heikki.krogerus@linux.intel.com; Kat=
iyar, Pooja <pooja.katiyar@intel.com>
Subject: [PATCH v5 0/4] usb: typec: ucsi: Add support for SET_PDOS command

This series implements support for UCSI SET_PDOS command. It provides inter=
face to send message out data structure and update source or sink capabilit=
ies PDOs on a connector over debugfs interface.

It also updates UCSI structure to have message in and message out fields in=
stead of handling them as separate parameters.

Changelog v5:
- Rebased patches to v6.18-rc3.

Changelog v4:
- Fixed build errors reported by kernel test robot.
- Added changelogs.

Pooja Katiyar (4):
  usb: typec: ucsi: Update UCSI structure to have message in and message
    out fields
  usb: typec: ucsi: Add support for message out data structure
  usb: typec: ucsi: Enable debugfs for message_out data structure
  usb: typec: ucsi: Add support for SET_PDOS command

 drivers/usb/typec/ucsi/cros_ec_ucsi.c   |   5 +-
 drivers/usb/typec/ucsi/debugfs.c        |  36 +++++++-
 drivers/usb/typec/ucsi/displayport.c    |  11 ++-
 drivers/usb/typec/ucsi/ucsi.c           | 118 ++++++++++++++++--------
 drivers/usb/typec/ucsi/ucsi.h           |  22 +++--
 drivers/usb/typec/ucsi/ucsi_acpi.c      |  25 ++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |  11 +--
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  15 ++-
 8 files changed, 172 insertions(+), 71 deletions(-)

--
2.43.0



