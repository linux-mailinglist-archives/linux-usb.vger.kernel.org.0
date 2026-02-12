Return-Path: <linux-usb+bounces-33321-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMXyLQugjWnv5QAAu9opvQ
	(envelope-from <linux-usb+bounces-33321-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:40:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 736EB12BF37
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E0A73036E9F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DB62E03E4;
	Thu, 12 Feb 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NuE6Op3d"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DC3EBF1B;
	Thu, 12 Feb 2026 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889218; cv=fail; b=ETweT8UG3B6eHM4h/Jgw+dAWwn8zFyRIgaGXudMp4dgbMp5vb48HE+xs3L9cAbD3S/juCkwHYywN9XYemVzCE9e1fVvvgSOAzJ3UUPmhfej9RTHrlMpu3TrDWGbUf5/eHf+rCl0rIfke0AAaKj0I48/axZuxqSmbm8EFHmN0O78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889218; c=relaxed/simple;
	bh=nHTJ/7qMGK7s0GBLH++qPa9yUkun0z5n5rBWd4Dw6OA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SHdaTUFMXOK+7xA3by9qnU9N8+QqXOJ3XfdVMI5AN1W8UV0eRgkpFsAEHp9DFdWp9AQcT0wOBDrYsloLQk+kPLMC0n+nYEEiBJ884j7WeAOjvrA3yXPuNr+/q9TrSwh9Y7mT0BUPQSdO3JYiMRFSVqqKaw7quNUzxaD2Wc/17y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NuE6Op3d; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=co9/79SsIUr2cMFglg5E82mFqT+iFRJyLOUuhONOhQLOO2GZGadt4L/6jJ9srY1qWpj106m3opjxyLi61EE7kypBXWksuC9lwuWiL+Oz73Rl+6fQ1PybDYZtDtTQlnntLGieySxtJvEn+G2YKS/jqW6DbpG2i03xVbjS2/TH151tFF60n1e+9V5r92VEgGCwjGOsXHNOlq2//JFOyJEuU5kVDTaGmfQ6+KUuEwXBasjfFbiGKLiv/tdCRkUfUapfC+PvEkLvedpSqGVaaUIUWWj3GY2NO0QvW6oOJ6lWaX5YhXfmHAU/v6AayR/SZj73UEpQuxR4wne0/drc1gWybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h5TUZnEG/BI+1uXm37th0V8IxdcXKdHZAa2axIPAg8=;
 b=XUoC3G1ddNGoWOz0tbW2Y6g0MtDEOZyngR1Q4CT/aY8gMQG45eF7iItCjasE9P5H+RupVDruwWFBKENUQiTboJPMUmGZl1/KKQ676nb/fRqxPblRgWWWQqx2XnN18nsK0joUjw6zXK2nhOhnV18UocPZjjIPWJsLxAjuoiqdsBnQ9BaGRcRp/+b6mOq2b9M/Ky5r0+haPPGYa6arGfpbJGBSRjiRWYCo/x6sTdpNxdUBw8ZYAZk4fprlAtrd9SwOEVyzsf6aVVsU+2ogSH1SfeNdUuIajCINUGjOBm/1LNpGxXTYjyCdWT/igKIXsAerDCtlK2BTPcm6Kzke54NYYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h5TUZnEG/BI+1uXm37th0V8IxdcXKdHZAa2axIPAg8=;
 b=NuE6Op3dmggAulr+R+5F6pGu+/L7q2gM8Y6Zn79zOyor0Ri20/D0HxOkOIXtzZf2hKlfRjM+6Ox1JHhPiMnDUV1urVRUhXgWI6y7XSrUAbVlsr0iHt1lnKouk20Ey1leQkJNzxOuRBwtPp3fzgkWeZZhr7W1sGGERqLKSa9fNIU9tZ3v7ORC90pfo2fs9Q/g29dZPD8JeaCGSSXpnW0eXwoIQU8yzak5RNnmxs1c2kOh+jrF+Gu/hA+FpKb9EpvBuPzY4etKc8yRxg/j0Ga9hnSexSoPRpZ5OeXiJZNmIe0Qt2o1Da24UObuW34VZW6gWhZhELsq0LY6EiF3Oe3miA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GVXPR04MB11667.eurprd04.prod.outlook.com (2603:10a6:150:2c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 09:39:07 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 09:39:07 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 12 Feb 2026 17:40:27 +0800
Subject: [PATCH v5 2/3] usb: dwc3: add needs_full_reinit flag
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-2-ff04a75ce221@nxp.com>
References: <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-0-ff04a75ce221@nxp.com>
In-Reply-To: <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-0-ff04a75ce221@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770889241; l=3958;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=nHTJ/7qMGK7s0GBLH++qPa9yUkun0z5n5rBWd4Dw6OA=;
 b=Y4ky4uIfrF08KQSGm+2BewCb+IP1BMwd3l5keNWmxbzatsZC8VKE1YIWfMmgwt1wQgSXdzEAa
 mOry4wWEXZoDLKGP/OCkjGRxI6CmrfWfwDmh8AeHxnzSl6BNgFjCEow
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GVXPR04MB11667:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bca73f6-8b0d-4189-eddb-08de6a1a9154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmU5U083M1BxNVRxamhVUDNHY2doRndKSjUyZHN1QjVWWVd2QkJDOWl2b3Zk?=
 =?utf-8?B?ZHA0V005V2VPUWl0UHlLOEhoMzlqNlAyKzFReEh2VkgybkVUWU93MHZTbzIz?=
 =?utf-8?B?ZU51eTEwUnlUR0pocFRia1ZtSmIxYUVOSUloeGhQR1crenlrRG0vTkpxeVI3?=
 =?utf-8?B?R0pmbHlxWEV4Rk01RmJkUWpRUEhVUTRMalNGOU0xcWVoMEVKUmpMUDNqcUFT?=
 =?utf-8?B?aVpFaU5GS2p1L2tCUEt3a3hGU3ZMVzI1RWNyM0Z6NHpsam5TYTFyRWpCTnN2?=
 =?utf-8?B?b3N3dk0veGoxamlKUXlwZ21SVVZYVnFMQS8rMk9GekMzcXFyaTA5MHFWMlNL?=
 =?utf-8?B?QkdxZE5qUWpZeDVwcUkyd2prc1R5RUhaMHhHRHVwM0lDazZYcWphOVlWUWpH?=
 =?utf-8?B?SjJSYnNEN3NhUjFJQnN6Mmt4NGorTHdmNW9CWWFTRG5ReG9HQUl6dm9RdHJD?=
 =?utf-8?B?NFE1TnEvRU9WQnFiUHBuRlVaNFFQeERtRHdPb3FKZGFwYnNiSWNDOXRIZVNV?=
 =?utf-8?B?QldJdTFsVDJQZTc4WlVGeU0yMjJQcnNSTytiZ2dXUVZwVFNzdmlpWUNDcXZP?=
 =?utf-8?B?bkpkdW1oZDhRYU9CYUl2QlVOWDYwajVGQThsZjR1TWpjb005ajk2U2lzN0dv?=
 =?utf-8?B?TjlKWjE1K1FjNkt4WHlGR2xGQ2lXUTVKTnVBT1RGU0ZWaURoT0R2MnNnVFRJ?=
 =?utf-8?B?Q2VIMDFEMm4xbmFmMzFNeG14em9Rd2kyeVo5ZytPbjNHc1J1VHUyWDJEV2tn?=
 =?utf-8?B?bUh3TDJoYWwzSENUazFoRXU5QU0wbjA5ZGFJYkFIZWdNRVlLZ3Z4T0cwTlRQ?=
 =?utf-8?B?YXBjSm85SFZvSTQ4YnJrZm9sQ3RKc3VMR3cvVEljVFdrZm1KLzVjS20wdXZK?=
 =?utf-8?B?WkdqUURrSlZWaWhCVHA0QlRCN3BwWjhLT3N5ME85RGdXR2lvWndLb21aTFVU?=
 =?utf-8?B?OS9jajhFRXBLUXVlMmNwd0tvUU9GZXFGbnlNZGZGVWswZWNUSWVjdDJVSnMx?=
 =?utf-8?B?SzVtalhNM1FjOXoyMlc3amVueks2cEg4MUhOYUFRSkJWRjFTRzBTZUlHSVQ0?=
 =?utf-8?B?T1lrdllGMElHV1VzTzJoTkx5clMrM2k2WnhJVlhpRTNSVTAwMjV4TGdXcE1r?=
 =?utf-8?B?aGgzRkxPYk14Rks3b2FzTnNnZ3ZCYTNiRDg1ODlFaFNMY2JxcndtQnRmdWNS?=
 =?utf-8?B?aWNpTTEzU2VrNkorT0EyN0VMc3dnVDVkWGpzTlBUclFzdXZqZ3BhYzVGRDBo?=
 =?utf-8?B?ZFcwYk53WU5jQStvVkdEZWZlR2ZzYnJTMjhBTFp1Ulp1QWxZSjVOZC9HWlQ1?=
 =?utf-8?B?bU1XMGlDd0dUbmJTSVducHI2WmtTVDNmY09nVEZTYit1aXlDQURjdDl4cVYz?=
 =?utf-8?B?MzJOYzNPcFdMMm9YNzd6SDIxWmd4NzMraFFLTUk1bUJadGRydnh3a1FDS0tC?=
 =?utf-8?B?TmVGMU44d3NZSE1ZRS94bExLTTI4eGtRczNLVjhFMCtKKzE1cXdOOXdQcGNu?=
 =?utf-8?B?OEJhdzVFUXJraUt2UkpkNGR2NGpZSVZPWmxXeGROL1ZMaXh5WGx4R3RtT2c0?=
 =?utf-8?B?czFnTTlIeVYzS1I0czYrSjFTd3BkR0FNa2d5U2lBNXBBRFFvOVVyWVZqcXR5?=
 =?utf-8?B?WjJub0NaR0I1ZTRPbndxVFc4QmZuSUUvNDkrNWh5bG50R0Qrb0dKaFVNa0Mw?=
 =?utf-8?B?ZXpUeHN4ZC9heTlWNUxzOWJSVUtYem5vRlhQN1huRGV1NUt3ZnA2Sm1LUTNz?=
 =?utf-8?B?aGtIUC9ZRHdzUC9IbjIrR1d0d2JuT1l6Mk1TQVRNRy9XTEphU1BiTk1ISm9H?=
 =?utf-8?B?T29WN2VTdzdCVEhZZkNlVFV4KzlFSmgwaE5IVjFJbTZleGJKUHNNakNxRnBL?=
 =?utf-8?B?ZWlvSHJmN083eG1ZNDhBYnA0K3NHQU9IeUlpYmJkUFJEK3lTc20vTUxrUUFl?=
 =?utf-8?B?bEI4eW1kUWpZR3VocHd4Y1QzN0FneHQ4MHFBaElLWmNIYTNYb0oxWXRCOGVQ?=
 =?utf-8?B?b24ydDZzaTFaYU9mZDY3QTdmYUpDY01PaWd2aUFiUURxbU9RaWcwOHJWc1ky?=
 =?utf-8?B?d1NWcEU3WjZFY0dKMmlKeUhZNGpOci9KTXIxa3J0eUVWY1JNNlowNFJ5dWVn?=
 =?utf-8?B?S1c5M1RGQnpzZFVFOVB4Smh6RHVCbEVIWUdHYVNDNk1TZ3VKQzduZENYbDBr?=
 =?utf-8?Q?aafFH7/UlCD5wXB6Uvibuv+uPY8KzrceHAHPUw14P8D1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFdNeFd4Z1kybnN6UjZRNG1EYmEvK1Z1R0htVjV2RmJpOWJDbTNWN05aWmor?=
 =?utf-8?B?a2EwSW1BQmVRbEtKZ29rZWJBYjkrL2hkdE5CbGphbWpkTFFEZVNZYys4WFFV?=
 =?utf-8?B?T01YV1J6NjV0MDRFbjBIMWY4R2o2ckhpVmFnVVMzMVJhVm9WTWx3VG5yT3B5?=
 =?utf-8?B?endMZDNUUExpWHZ0ZC9iS0padC9MNThieGNBZ3JQZFNpWUpKQUtIWUJ1d0FM?=
 =?utf-8?B?ekh2MlBnNWJaVWw3Yi9RY2dnZysyMDN5bEc5RTBqRW9LN1VrcXdDRlNpV0cx?=
 =?utf-8?B?SXlkdFR5REVQVTJxb1ZGQjRpTWcxM3BuZGhzQUozSDl4Z0E5VUdRYzd6VStn?=
 =?utf-8?B?elN4M1ZaK2V5T3dRNmlhN0lTYklWVmJvZnFleGRLYzhIZUNMV1NqSXpBRGpW?=
 =?utf-8?B?cHI5ZXdSb1pZcUJiNXRDVGg3aTRBTHFaR002K2VLN3pZZll1NWxzTkZ1SUxz?=
 =?utf-8?B?YTZnUThsRklrUHNsNWhsQ3ZXYlRTV2luejM3bFJyVWVRMjhTQjA0YnpDWE45?=
 =?utf-8?B?NlZpdWxaVWNrMldVcXpuaDlOaXBMRnJDOTMrVTlYd2lNWFc3TkVUVFdkT0J6?=
 =?utf-8?B?c1d2dG5aRnBmUC9OekdBZjh1dlA5YWlOcmV6ci9pZEwvV2dJc1R5MjhyZHpl?=
 =?utf-8?B?NzFsamg5cTNkV1gzaXp2RUEvQTZZekw2Ri96VlRWcFFyVktJTWsrb0NRYmhD?=
 =?utf-8?B?TkhzVUFJbVhGKzJIMy9mTXBLcFJod0ZTMU5JMmgwYU1JZTgzcXFOQW41WnJJ?=
 =?utf-8?B?LzhXV0hlcXY5NVU1ZUxMdk9rTXZSbGR4OENTSkp3b283SHBRdTZOVTdvMEow?=
 =?utf-8?B?TWU3Tm93aGJPUllubFBlc1hFSjdIc1lwcUV5Sm9sMVJTYmlFQkk1UzFaMmpS?=
 =?utf-8?B?OG9RbkZFaFM3Uk9keWNwQ1NxQnVIeUVBK00xNW1UVVFnaENlNHhUK2pQWko0?=
 =?utf-8?B?ZFg1ZDN0TnFEU1ozWksySXQ2UTdlQnVhUWhjUFpwRFZQM3psTlR2REt5dFIy?=
 =?utf-8?B?eTZUV3ZFTGRQYnV2dnpEMXlhUnNNY0ZUMGV4eDVsOFA5UHh2WDROUzUxYVkw?=
 =?utf-8?B?NVovRXROa3ZpVGNzNG9SVWM0Y0RiS3loR2hqbUl5eGFNK0hDT3g5aERyL3pE?=
 =?utf-8?B?YVpSaUxEZnRJOW9ydWVDVlZKSkZ6YStzT2Y4eDRidCtCUllIVXJ4emxDY1B1?=
 =?utf-8?B?Z2ZQTnZWVmYvWndvK3FjUngrTGFaMW42YXR3SlpGbmVQWjUwbHE1SFV5bnJV?=
 =?utf-8?B?bFRidUtBbmQ4L3BvY2s4dFF2aXZNVG43UlEzRkR5bXFHdHZvSW10aTRMbDh5?=
 =?utf-8?B?aXpMbEpNd25qNFJEcy8zb2QzajdoVERPK1FtQlFXOEpRRk5yRlRVblNqWExZ?=
 =?utf-8?B?RmpZOTh1Wkl2eUNmbjdVSXBJSS9oMUhpV2VoR21iT1l3dFpuRGhINjk0STBL?=
 =?utf-8?B?ZjJqd3k2eUp3WjV4UnhCaE8xamRHa1FNNWtqSkh5UWJDQlhVVmxlT1VUZkFh?=
 =?utf-8?B?Ny9KV05hMWdEUzhrSXUwNGtRMmxQTkxXVmxLK1gySHQvRDE0amZNMWZOVXZY?=
 =?utf-8?B?a0VEMWN1MVlxZlliSk1WcEtiSFJiWkVHZmVuYllkRnEzQTdTZlpCZkJxa0VL?=
 =?utf-8?B?Mkl3SXpCRnQ4RXJKNkVvK051cHhlNzdtNjZxVG1jQkhHeVYvK1l5NDdxcUhW?=
 =?utf-8?B?RmFxb2VwRW9pYzROWmpXVUtFRlJ6ekFuSy9EZ3hoY2xNWEl1RzUwbU0weGo2?=
 =?utf-8?B?MjBBdkJVV1VZaWpjRXFpRmVSNDF3Um12azk1UWlaUFpreDYwOVRPdjNPcE1R?=
 =?utf-8?B?NGVhYkRYSm81TnVGeEM5ZGYzMVl6Y21hL2RiQjlVTThxMFFHVHZuMVF1c2JS?=
 =?utf-8?B?MGkvU0dEOVRPOU9DWk1CSFpEYVUvejR1VzlNNFNsSFJxMmRwdmgwK0dnalNv?=
 =?utf-8?B?a0NrQlhOYTliTm9ISktMSVRLRzRKblhnTWZ2cWsrdmNqb2wxQSsyVE9yWFZm?=
 =?utf-8?B?THdMZVA0cDRDNUg2b2JIZVh0TFRxU2lKdmlmTHhlZFBIY2Z2eEdtK2ZpMllv?=
 =?utf-8?B?dEdXZkEzdDVGb2dYK3AyTUN3enZycmJnOTlLZHZ0V0FpelZkaXBOSkRoZXdm?=
 =?utf-8?B?aDNoMFhGMXZNdmI1YjJFRkhDOEcyU0xQNzlBb3RxU0JMZUdIZzJwd1BJUHJ5?=
 =?utf-8?B?NWVvSDV5dTV2Rys0Z0Q4cEs0UzV0L1M3TjdCN3JvdkF4M2w3ajJpZURkZ0tY?=
 =?utf-8?B?emZMaHpMRmwzdkZxTWh2WU5GNm8zYmlZMldWL2lpY3JTTEU1T21oQVIrSUVH?=
 =?utf-8?B?LzJISVplREh5Y1Zoa1MrU0doeTlDQ0poaXQvV1NzWSsrZDlSVzBpdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bca73f6-8b0d-4189-eddb-08de6a1a9154
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 09:39:07.4878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5fcjeC1ojlV8SH9csHwIlxKw8diHTgZP5yO4yWt1iDSyLVLA3oDX5DgYxN7JdtdPuicwH1l6NkULKTfko8p/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11667
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33321-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 736EB12BF37
X-Rspamd-Action: no action

The current design assumes that the controller remains powered when wakeup
is enabled. However, some SoCs provide wakeup capability even when the
controller itself is powered down, using separate dedicated wakeup logic.
This allows additional power savings, but requires the controller to be
fully re‑initialized after system resume.

To support these SoCs, introduce a flag needs_full_reinit for the purpose.
And the glue layer needs to indicate if the controller needs this behavior
by setting a same flag needs_full_reinit in dwc3_properties.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v5:
 - no changes
Changes in v4:
 - also rename core_may_lose_power to needs_full_reinit
 - add R-b tag
Changes in v3:
 - no changes
Changes in v2:
 - put core_may_lose_power into dwc3_properties and check it in
   dwc3_get_software_properties()
 - rename may_lose_power to needs_full_reinit
---
 drivers/usb/dwc3/core.c | 9 +++++++--
 drivers/usb/dwc3/core.h | 3 +++
 drivers/usb/dwc3/glue.h | 3 +++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 161a4d58b2ce..cacc4ec9f7ce 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1675,6 +1675,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	u16 gsbuscfg0_reqinfo;
 	int ret;
 
+	if (properties->needs_full_reinit)
+		dwc->needs_full_reinit = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
@@ -2479,7 +2482,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			dwc3_core_exit(dwc);
 			break;
 		}
@@ -2542,7 +2546,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_gadget_resume(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			ret = dwc3_core_init_for_resume(dwc);
 			if (ret)
 				return ret;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a35b3db1f9f3..67bcc8dccc89 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1119,6 +1119,8 @@ struct dwc3_glue_ops {
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
  * @usb2_lpm_disable: set to disable usb2 lpm for host
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
+ * @needs_full_reinit: set to indicate the core may lose power and need full
+			initialization during system pm
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1373,6 +1375,7 @@ struct dwc3 {
 	unsigned		usb3_lpm_capable:1;
 	unsigned		usb2_lpm_disable:1;
 	unsigned		usb2_gadget_lpm_disable:1;
+	unsigned		needs_full_reinit:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index df86e14cb706..d738e1739ae0 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -12,9 +12,12 @@
 /**
  * dwc3_properties: DWC3 core properties
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
+ * @needs_full_reinit: indicate the controller may not remain power during system
+ *			pm and need full initialization
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
+	unsigned needs_full_reinit:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\

-- 
2.34.1


