Return-Path: <linux-usb+bounces-33899-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Lg4A9+WpmnmRQAAu9opvQ
	(envelope-from <linux-usb+bounces-33899-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 09:07:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A71EA8D8
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 09:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54EC530BAD5B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 08:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842B8386C17;
	Tue,  3 Mar 2026 08:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="SdjnSdsA";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="jxZWJnQt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com [208.84.65.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5146F38644F;
	Tue,  3 Mar 2026 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.84.65.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525115; cv=fail; b=gEgCAyHF4iW4MSAY4c+NjtycsxBGY7QY+lrQaDsEGzbFgj40bSTwFhcLTkX5XHut9HySw1VAFGy3DTIf/9gnJntVHO3kKr7fkjB+aYTKKdyQBMftqupmce1xK+Ux7xW2HWhUB6nOagvQEpHbBv5bPM5dn+FxTbKh8Eib/QGNSuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525115; c=relaxed/simple;
	bh=2vGJvuPMzcGZuwWN6EVB/hQYYfs1rkvqy0Q4rG3pP5g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nhOK6htIzdplJtw27CpGNxID6ib4fb3nRfKrsO4v5/wnZpRAA8v7YWGc3i4Ql531+iOwsDK+yYxICWxUDOSg/0HXACpAxtg1rxeCFM3LHYo+zMljHRA+cgq7xGMeh+aID2tt4iRP8NqycXDYYSuKHtiPIZoE/CRVibyKHSIXja0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=SdjnSdsA; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=jxZWJnQt; arc=fail smtp.client-ip=208.84.65.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
	by mx0a-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6231Hogl1055584;
	Mon, 2 Mar 2026 23:34:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=2vGJvuPMzcGZuwWN6EVB/hQYYfs1rkvqy0Q4rG3pP5g=; b=SdjnSdsAOy4q
	UneuwaEezms9m6c8q1RfyXXoPF9YZoUhuQusJ6fZneARK6Mq3tS0ReN9hyD7Fzui
	Qx9k88XJrsGx1kNgaQhP26eUvd1rylT+0hFjSw5T+arVW7ieaSPN+0Z6ipMbD28r
	QQMMgx3gqG62yf5Os6b1JhdrNETMTMvKKz3RyZO7I/X+GrO8mZI0HVuPcBxRQrfm
	mE2fmOQZtDPJYVdIw83e7iWBHvZ5uhCZaRah10A8c6yymYqprXcrWlQllcfl98rU
	9Lks0LHqEK8Mz5KMuVFbnDjyzGR9U+I9VNE6KIDZF27CCI6vJPLeeoxI4dCuWYsV
	FVR9mdbhyQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	by mx0a-0014ca01.pphosted.com (PPS) with ESMTPS id 4ckwssu75h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 23:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR2y+bMqy9RXWFm+/WtL+14fDqpXSLDV9u18pw2x6JljqonRYNYtRHSd6eRRXDKbsLxEjPdWJHRge7FbYdir9D39g29zAgGhfK8F5/8w0kyNFMg284djMqFoBwANxuf7REU6ZtAVtVT3rvThA851cGgeFWLKAbfsVmxO/6/TdHbzqKatG49V7YSoQUDBhS7cz4vsfaZyRKbW3qPZElaatLAQuwhDre8LL2qMZskAtl5zJ8iTe4N6f5ARhdEtj9TCKxrQ3f1jcCtZNRB1LpB5ipT4F8SSbh/51gn9Q5ljuQs4QuSf0Us60om5N7e2FF1vw9NVmKzdNsvuaxhkp30v0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vGJvuPMzcGZuwWN6EVB/hQYYfs1rkvqy0Q4rG3pP5g=;
 b=qmha62T45kxz7Ovk8H+NpSv/0bUEkWrYoOffxlg3Dx73IB8UXfAeDcCZ2WjFNKhyRJGDRbVXQVClHHOuBuBl25ua44I0mnZvGPPEn5gWGuu8usWeUAdKkcjUJKP8DkBJRHXE9hoNHpDRithyyKzNdMlyG+pQfP/Lxz5tNSJYu/Ig8MhJTGJ8gdU35UL71rP0w3RJjv7iuefTDw8ktCCu/jjE46W4DfruB8vnYP5lF/rrhOABrEL9EWA9RnKuKiXcLwvFs0+GeOOds0C0h4mDApc7nY6wlr6MbDoz3pYMrUDk6nbQL7N61Aj0n4DSteuim06328yw2RpHbb4AbpsQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vGJvuPMzcGZuwWN6EVB/hQYYfs1rkvqy0Q4rG3pP5g=;
 b=jxZWJnQt0PPWdWIyBjIga741WL5raOgYcmJXym2uBpuanD+gq9DzUMESvIRV4CXqcwFaOsovrclhVXwV0bppw2iKgnhpKZuwsAgvP/x9m+YALSe7snpzCl8nMWVUlpZiUMa4cQjzeFXVbf7vBJli4jmaHkB0tfRi2zRyb4Vye5purtWYMXOcZ+Yo2UzEBDoljPIYaYayjk5DFJ/QTn+9HZtpEG3IoNOf85BoBeLTx4HMx7dnN8v9DPa1bbbOczkJQ5tZXaUz3G9Ww53XYWIoK5IdCDh9humwLY08pPQWrdnsF9qUI2bzqs5yzoNK3ii0ZKm7XjZMVIfKVXvu/IBf9g==
Received: from PH7PR07MB9538.namprd07.prod.outlook.com (2603:10b6:510:203::19)
 by SA6PR07MB10983.namprd07.prod.outlook.com (2603:10b6:806:43b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 07:34:55 +0000
Received: from PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe]) by PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe%7]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 07:34:54 +0000
From: Pawel Laszczak <pawell@cadence.com>
To: Peter Chen <peter.chen@cixtech.com>, "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>,
        "rogerq@kernel.org" <rogerq@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "cix-kernel-upstream@cixtech.com" <cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH 0/2] usb: cdns3: USBSSP platform driver support
Thread-Topic: [PATCH 0/2] usb: cdns3: USBSSP platform driver support
Thread-Index: AQHcqfE1a3W1H1W0+kyrxldUiPBBWrWcabwA
Date: Tue, 3 Mar 2026 07:34:54 +0000
Message-ID:
 <PH7PR07MB9538DF65B6E13761C630615ADD7FA@PH7PR07MB9538.namprd07.prod.outlook.com>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
In-Reply-To: <20260302030339.324196-1-peter.chen@cixtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR07MB9538:EE_|SA6PR07MB10983:EE_
x-ms-office365-filtering-correlation-id: 4392a9ec-20ae-4d44-4913-08de78f75d39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 Ceo26tvf5wbPdvaSAfQ1FxIVyevsyJZAG24mcMCvI/5KDSdfwCkZ9Nrrp+ZGruwz8bxZ1LxTFb/1iEi7zaOFnMOfTNIhgpPWXXR423fbaPcE4OOXWwM8tbVxH3bAuzOSMjZ+nBPMT2p5xf+4lR6ruizJHW9R0yXRuIJmOM13hQA75K9MhGd8VXZ/bfly3tZaK5omb6RrJgpoHMGD5EGeC5l8pV8ZAnJqszgCLQ+tk+UFZ5KgCKAyY1nm+1tauvz7bZGpeQSx2mZW0WQujlrDkon6RF+eSiTyEouy0R/N3ZXyBOQ0qcSkM2iu8+sVVZoWfFNy3SghoBWshD0JEdR8w+u+UCRcvcAROj923Ehd9Ur69dJyFOjxe97xioeWf18V0eORZ+PWKlRgVGybuSGmZ0OlFiyshCFlHW6G6Ws4NhlmkV24SgiWfoBDQPj7bHVBx1OXwg+s8vBk/rlxSO8c7aU3ADk/NzbTr8boMg8bGzg/mc/f+ib3SFZ1BgXrD9IVl5mDyT2ikdNYJGDoXJD6SjLvxe6QDoZwDSWnwZTvzRitPoMYn+5rIhzDrRf27Jdd/yFH0TKWIlxJ5pXAY7x7hp+1qQZIwmaoAkT6m8DZqu81bSLzPdz7ObpkUdUiZsxo488W0EXs8amKq4AlQUEnQB/1Kvklb9oUbosZEeVlhSeN5loUd9K+XfR1m0dLO+jAEL+fjP8HTzE1Xu6FGtxjJE9rr1fR28Jh7HoCJKN3czqKSzXtUaQ46WMYNFfDAIPRwLtLZswGN7Fmi0wZn/TTQQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR07MB9538.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGhSNXJTa1BJR3pvWFlIemxVUlBVWUxTYUkzQWdPOXFGYWRLbWlwZlBFNGpN?=
 =?utf-8?B?VU1xaURqWkJac0oybXBlVTZUUlVDT1NwVXg1RE5Xd0JnaHdUZW0wajdxZHVJ?=
 =?utf-8?B?aUxhQ2NZUTREOUczL3JYTW9sV3ZQSTZ4REIyZ1cxZGFhT0hVZWZ1RThJVUdL?=
 =?utf-8?B?QXcyMm9lSU1ESHVKN3NhUkMwZ0NOMm54YWtIVVFzY3czeEdzOHVUYjlQTDB4?=
 =?utf-8?B?SHhNNmFGMGRvWlcrZ1VPM3JrUEl6ZVlnb1BaY2RGeTBXelkvUEI3bElGc2pG?=
 =?utf-8?B?ZUNITjNDSnB1V3ZqK054MlEyWXhLQkxSdVU1Smdmb0JiYVFBTWVhZkpIdS9S?=
 =?utf-8?B?TEVoSWg3U2pUWUhWOVgrRmVQcGx0eUU5eTBWMXVzaGZkTkpjMnFwbG1PdDA3?=
 =?utf-8?B?YlBYTW9YWHczM0xsQ0tXNm9YT3FLN05CUUZaSkJMbm1KVDM4VUZ4N3g5bmNG?=
 =?utf-8?B?R3JSUVErY3h1Um1IVE9nRnlvNnFvSUFabktYTmdSamljZERMeXBtZDNldHE5?=
 =?utf-8?B?Ulg3VVBQVU9LN1hYNEhnd2NDK0xsRlNFL0ljL08zZk1xcGNGZmhHUGs0MXF5?=
 =?utf-8?B?WUFnU0JtV1M3TW5lcGgzZlpIYVVsbEI5bjd2dzAyTVVZMVpON1VDb25QclBp?=
 =?utf-8?B?bWNTemNCZ2REdWRLbllBVThNNTA3cVFmR0lBY3dCNXBOM004elZUQ0RyNFRJ?=
 =?utf-8?B?UmRvNVdaN2RWemU1SFM4UUZYT3N1alhKODA2ejVnNUxqaWU2RmxEbVNzTGR0?=
 =?utf-8?B?QVNVVDBIL0prRHk0Z3ZqeGc4YytsRThFTVdzK25EK0phVEdjK1prL2xQUCtC?=
 =?utf-8?B?Y05lc0ZjUDhKVXRSa0czR3czK0RLS2gzcGs5U1AxYm9sMVA5Z2tuUGgzTkE3?=
 =?utf-8?B?a1J0WmRudGVDZXE3Z1oxSDJZVEQyZkJ6Z3EvazJ2b0hleFdmR1ROM2xvb0Va?=
 =?utf-8?B?R2plMnVSV2YvNmluNlVjdjNZQkMvOVZudkhxZ3lLWVBEQmRBU1k1ZWRveUhG?=
 =?utf-8?B?Skl1anFiVDhPY0NKSk9tYU9qTThqL0xKcVdPMi9GejdWV09GUnBUTGpsbkds?=
 =?utf-8?B?elVLRnZzbGlEVTVlUllpWHora0pvSndoamNQaUp5STJ6cGsweWxFMmVXN3la?=
 =?utf-8?B?TW1VdTBvSGl2RkJIeHhNRnNKcG4vN25TKzBlUVRWcmRMbTlZWGR2VEdobkx3?=
 =?utf-8?B?Kzd4V3QrNUtrL0E1YzFlWFpIWWYyenNEQzhyN2R1b0FydXBwTDRTRHNiM01w?=
 =?utf-8?B?L0RvZnpPWnd2b3lBektVRUZEL2I4OEFJK3ZJeHNrMzRXNUdWV3plNDAyZzFj?=
 =?utf-8?B?NFFTREY5RmNQQStkUFk0OVJWdVU2SUxObG5neWZMajVtTjdEbjh5VzZhUkw3?=
 =?utf-8?B?TGlkYU5XUFM2c2RZNysvT2lQV05GWklaanI0Y2tFYkZEZU1SS0x3cG5UNWtV?=
 =?utf-8?B?LzRKdzkzUkFJVW03NW5SbDd3bGpteG00N3N2K1JyQlpwbVRHcy9KTlhqV1hS?=
 =?utf-8?B?VG83ZTRNWkVCWE92bGZnZmFqWEdaSlFXYjhSRnJxSjFiVlhoaTliTmxpUFNp?=
 =?utf-8?B?M1B0eEd6QzNYYWM1ZGhSMUZUMFBIZE9IWTNCcXJNRFlvaHRNeWd5MTZqMndH?=
 =?utf-8?B?czBGbkQ2SVVnTUMzWk1tV0xJQTFnZy9mcWdFaGdBcUNBcGg0ODBzOWdjMnM0?=
 =?utf-8?B?OG1JU1N2b2VwcUlIaCs1TlVlT1lLZE5kdHI1QTZ5eEtsRU4rVUxqQmlCNW5v?=
 =?utf-8?B?OGpHRVpmQmp3b2hMdlBad3ZLTXpEcTE5RksvWHJEOWZ0b295TFFKT2loc2x1?=
 =?utf-8?B?MUFCSGMrbG1Zbk1tQktrNVZZZ3kybE1NVGpQK0RWclFIaHJtSEZYZTBtQWxT?=
 =?utf-8?B?YzZYU0Q5cEN3MkFDNXRkY1dVVFhTNlJaTXlyeEozcE83UnRmUnREenJpWk00?=
 =?utf-8?B?aU1wLzBnU1Z4VGxLKzF1V3NZbEhyQlJxWXd6eVdFL0F0c0xLdHNETlBZdWJu?=
 =?utf-8?B?Tmw0VlJLOXhFcVVyRDliNkJzTHdWb0lGb0g0emRRM2hSQjlqYkV1NlJMUFJh?=
 =?utf-8?B?WTZlcUc1Z0didUQ5YzRIYTl3UWJrbDRyQ2l6WFpIbDVJV29xbHlhSXdIT2Mz?=
 =?utf-8?B?aXpmNndjRXQrTGVBU3p5WjhKakkyUzFrSTlGcXEyZ1RmTW13eVlKckFmQ1BE?=
 =?utf-8?B?YmV2ZTkwd3o3KytFMktIL3pMdWdqU0drM1dVSW04cnprRGJjWERDU0JqOVZF?=
 =?utf-8?B?cXlpVkV3ZlVqZDNBOGx2dFhwTFJjSnhBazRWcFBpcVdDR0lSNWJpdHV2dTdQ?=
 =?utf-8?B?TXhLeWs4R0lwY0VTZDczc0FNSmV2a3kwVWRTRmVIS0ZsQVlYYnc0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	AFePS/IccqvBFD/qCH+0Djw4wOUfyd9DBtlxN3HVsDUrLkVt3ynFyBmBB/zAGuPeFzmU2/iI8oyY1L5CMnjCia1vxEMSYJwRAtiDWw8z4WLkJQhvG7YL1fFgopbKa4VypkY1EG9kXHzpQ8b2p342doWzO2coyMeA7mpifnRTQ1I0+Yn97OeWdDgnA5kGpVIqAN3k9za67Gi/ff7bvJ5jtkzCzyrm9ytvb06/0n8m4VdVfP95NpsWcrpp3ruwZoVbU+ALRvI610WUFp6P5ZbfGWIfHVK3LSfTT6W59ORgCZDvqqT6nw8gd6M05fVTZRWyuqHS0xIbfyoYYvq0GUgrRA==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR07MB9538.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4392a9ec-20ae-4d44-4913-08de78f75d39
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 07:34:54.8889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWcyZHOEBDqAhKZoWdtBzI17sK7SFFq9y+fAE/DwRZLmSWQIZjD8j+ox5N6wIL/fhldAA8895IZbybtP4a4k2YeT2nyVwWT+BLxzHxe61y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR07MB10983
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA1MyBTYWx0ZWRfXw/B9dYjX2UJw
 QJrRZ6wy+8g3sqiaosXZPOCaJXvnYPbmYOD7Sa2bKQhMxDALqf2QXyS+t0ZAepGlOGLWexoUYz5
 SHo3ibKt5qAOCdoyN+hxoaffCj+VVDw5kOlHPQYT5Nepv5A+9cQnlHbb7wBS0r033c3jR50ydHn
 nHcsa6EM9nmMG5YLMJqoF5wdALViNYcpxDy/xmPggty/hyasFenNTOaRonCC6CDZl2ievlY82SU
 PI+7tLjodgzpq53yQ+N58/Xsi40n0bHTUFn00znxShKwpiTg+8j3Kjc34QYnvasPjvNyapGwJIv
 tBJtafk1crAMEyU14wHrURu8w4W63aiI+155NkkMUNkP9tp98WHzmrnFzs8yeeS6zCO82wTCmjP
 8g1UbTvSh00LQSh5Ql93jm6fOLpD6jmCfuaaWJ0X2AEzQJQ8Utd479Ww/itX/DilnnoyyLJnO10
 33zRk99H1abiKU2wyqg==
X-Proofpoint-GUID: 6BajW-tHcFJzi0IdislY6WvZYaw0mTCm
X-Authority-Analysis: v=2.4 cv=GJwF0+NK c=1 sm=1 tr=0 ts=69a68f21 cx=c_pps
 a=nAh4yJc8K/mwxcjpRfPwJQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=jPItpJ3sizTKmla2ehJN:22 a=SmgygtgI23aBTAO9HgUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6BajW-tHcFJzi0IdislY6WvZYaw0mTCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030053
X-Rspamd-Queue-Id: 555A71EA8D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33899-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,PH7PR07MB9538.namprd07.prod.outlook.com:mid];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[cadence.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pawell@cadence.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Pg0KPkhpIFBhd2VsLA0KPg0KPlRoZSBDYWRlbmNlIFVTQlNTUCAoQ0ROU1ApIGNvbnRyb2xsZXIg
d2FzIHByZXZpb3VzbHkgb25seSBhY2Nlc3NpYmxlDQo+dGhyb3VnaCBQQ0ksIGNvdXBsaW5nIHRo
ZSBnYWRnZXQgZHJpdmVyIHdpdGggdGhlIFBDSSBnbHVlIGxheWVyIGludG8gYSBzaW5nbGUNCj5t
b25vbGl0aGljIG1vZHVsZSAoY2Ruc3AtdWRjLXBjaSkuIFRoaXMgcHJldmVudGVkIHVzaW5nIHRo
ZSBDRE5TUCBJUCBvbg0KPlNvQy9wbGF0Zm9ybSBkZXNpZ25zIHRoYXQgZXhwb3NlIHRoZSBjb250
cm9sbGVyIHRocm91Z2ggZGV2aWNlIHRyZWUsIGVnLCBDSVgNCj5Ta3kxIFNvQy4NCj4NCj5JbiB0
aGlzIHNlcmllcywgaXQgcmVzdHJ1Y3R1cmVzIHRoZSBkcml2ZXIgdG8gZGVjb3VwbGUgdGhlIENE
TlNQIGdhZGdldCBmcm9tDQo+UENJLCBhbmQgcmVmYWN0b3IgY2Ruc3AtcGNpLmMgaW50byBhIHRo
aW4gUENJLXRvLXBsYXRmb3JtIHdyYXBwZXIgKHNpbWlsYXIgdG8NCj5jZG5zMy1wY2ktd3JhcC5j
KSB0aGF0IHJlZ2lzdGVycyBhIHBsYXRmb3JtIGRldmljZSBhbmQgcGFzc2VzIFBDSSByZXNvdXJj
ZXMNCj5hbmQgcGxhdGZvcm0gZGF0YSB0byB0aGUgY29tbW9uIHBsYXRmb3JtIGRyaXZlci4gU28s
IHBsZWFzZSBoZWxwIHRlc3QgaXQgaW4NCj55b3VyIHBsYXRmb3JtLg0KPg0KPlRoZSBjaGFuZ2Vz
IGFyZSB0ZXN0ZWQgd2l0aCByYW5kb20gY29uZmlndXJhdGlvbiBjb21iaW5hdGlvbiB0ZXN0cy4N
Cj4NCj49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj5BTEwgVEVTVFMgQ09NUExFVEUuIFN1bW1hcnk6DQo+PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+U3RhcnRpbmcg
Y2RuczMgY29uZmlnIGNvbWJpbmF0aW9uIHRlc3RzLi4uDQo+VGltZXN0YW1wOiAyMDI25bm0IDAz
5pyIIDAy5pelIOaYn+acn+S4gCAwOTozNDo0NyBDU1QNCj4NCj5QQVNTOiBhbGwtYnVpbHRpbiAo
U1VQUE9SVD15IENETlMzPXkgR0FER0VUPXkgSE9TVD15IENETlNQPXkNCj5DRE5TUF9HPXkgQ0RO
U1BfSD15KQ0KPlBBU1M6IHN1cHBvcnQteV9jZG5zMy1tX2dhZGdldC15IChTVVBQT1JUPXkgQ0RO
UzM9bSBHQURHRVQ9eQ0KPkhPU1Q9eSBDRE5TUD15IENETlNQX0c9eSBDRE5TUF9IPXkpDQo+UEFT
Uzogc3VwcG9ydC15X2NkbnMzLW1fZ2FkZ2V0LW4gKFNVUFBPUlQ9eSBDRE5TMz1tIEdBREdFVD1u
DQo+SE9TVD15IENETlNQPXkgQ0ROU1BfRz15IENETlNQX0g9eSkNCj5QQVNTOiBzdXBwb3J0LXlf
Y2Ruc3AtbV9nYWRnZXQteSAoU1VQUE9SVD15IENETlMzPXkgR0FER0VUPXkgSE9TVD15DQo+Q0RO
U1A9bSBDRE5TUF9HPXkgQ0ROU1BfSD15KQ0KPlBBU1M6IGFsbC1tb2R1bGUgKFNVUFBPUlQ9bSBD
RE5TMz1tIEdBREdFVD15IEhPU1Q9eSBDRE5TUD1tDQo+Q0ROU1BfRz15IENETlNQX0g9eSkNCj5Q
QVNTOiBuby1jZG5zMyAoU1VQUE9SVD15IENETlMzPW4gR0FER0VUPW4gSE9TVD1uIENETlNQPXkN
Cj5DRE5TUF9HPXkgQ0ROU1BfSD15KQ0KPlBBU1M6IG5vLWdhZGdldCAoU1VQUE9SVD15IENETlMz
PXkgR0FER0VUPW4gSE9TVD15IENETlNQPXkNCj5DRE5TUF9HPW4gQ0ROU1BfSD15KQ0KPlBBU1M6
IHN1cHBvcnQteV9ib3RoLW1fZ2FkZ2V0LXkgKFNVUFBPUlQ9eSBDRE5TMz1tIEdBREdFVD15IEhP
U1Q9eQ0KPkNETlNQPW0gQ0ROU1BfRz15IENETlNQX0g9eSkNCj5QQVNTOiBtaW5pbWFsLW1vZHVs
ZSAoU1VQUE9SVD1tIENETlMzPW0gR0FER0VUPW4gSE9TVD1uIENETlNQPW0NCj5DRE5TUF9HPW4g
Q0ROU1BfSD1uKQ0KPg0KPlRoaXMgcGF0Y2ggd2FzIGRldmVsb3BlZCB3aXRoIGFzc2lzdGFuY2Ug
ZnJvbSBBbnRocm9waWMgQ2xhdWRlIE9wdXMgNC42Lg0KPg0KDQpJIGNhbiBjb21waWxlIHRoZSBr
ZXJuZWwgYnV0IHdoZW4gSSB0cnkgdG8gaW5zdGFsbCBtb2R1bGVzIHdpdGgNCm1ha2UgbW9kdWxl
c19pbnN0YWxsIEkgZ2V0IGVycm9yOg0KDQpERVBNT0QgIC9saWIvbW9kdWxlcy83LjAuMC1yYzEt
bmV3LXBjaS1wbGF0LXN1cHBvcnQtbmV4dC0yMDI2MDIyNysNCmRlcG1vZDogRVJST1I6IEN5Y2xl
IGRldGVjdGVkOiBjZG5zX3VzYl9jb21tb24gLT4gY2Ruc3AgLT4gY2Ruc191c2JfY29tbW9uDQpk
ZXBtb2Q6IEVSUk9SOiBDeWNsZSBkZXRlY3RlZDogdWRjX2NvcmUNCmRlcG1vZDogRVJST1I6IEZv
dW5kIDIgbW9kdWxlcyBpbiBkZXBlbmRlbmN5IGN5Y2xlcyENCm1ha2VbMl06ICoqKiBbc2NyaXB0
cy9NYWtlZmlsZS5tb2RpbnN0OjEzMjogZGVwbW9kXSBFcnJvciAxDQoNCkl0IG9jY3VycyBldmVu
IHdpdGggbWluaW1hbCBjb25maWd1cmF0aW9uOg0KQ09ORklHX1VTQl9DRE5TX1NVUFBPUlQ9bQ0K
IyBDT05GSUdfVVNCX0NETlMzIGlzIG5vdCBzZXQNCkNPTkZJR19VU0JfQ0ROU1A9bQ0KQ09ORklH
X1VTQl9DRE5TUF9HQURHRVQ9eQ0KDQpSZWdhcmRzLA0KUGF3ZWwNCg0KPlBldGVyIENoZW4gKDIp
Og0KPiAgdXNiOiBjZG5zMzogQWRkIFVTQlNTUCBwbGF0Zm9ybSBkcml2ZXIgc3VwcG9ydA0KPiAg
ZHQtYmluZGluZ3M6IHVzYjogY2Rucyx1c2IzOiBBZGQgc3VwcG9ydCBmb3IgVVNCU1NQDQo+DQo+
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jZG5zLHVzYjMueWFtbCAgICB8ICAzNiArKy0N
Cj4gZHJpdmVycy91c2IvY2RuczMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgIDQ0ICsr
LS0NCj4gZHJpdmVycy91c2IvY2RuczMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDMw
ICstLQ0KPiBkcml2ZXJzL3VzYi9jZG5zMy9jZG5zMy1nYWRnZXQuYyAgICAgICAgICAgICAgfCAg
IDQgKw0KPiBkcml2ZXJzL3VzYi9jZG5zMy9jZG5zMy1wbGF0LmMgICAgICAgICAgICAgICAgfCAg
MTQgKy0NCj4gZHJpdmVycy91c2IvY2RuczMvY2Ruc3AtZ2FkZ2V0LmMgICAgICAgICAgICAgIHwg
ICA0ICsNCj4gZHJpdmVycy91c2IvY2RuczMvY2Ruc3AtcGNpLmMgICAgICAgICAgICAgICAgIHwg
MjIxICsrKysrKysrLS0tLS0tLS0tLQ0KPiBkcml2ZXJzL3VzYi9jZG5zMy9jb3JlLmggICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgKw0KPiBkcml2ZXJzL3VzYi9jZG5zMy9nYWRnZXQtZXhwb3J0
LmggICAgICAgICAgICAgfCAgIDQgKy0NCj4gOSBmaWxlcyBjaGFuZ2VkLCAxODQgaW5zZXJ0aW9u
cygrKSwgMTc0IGRlbGV0aW9ucygtKQ0KPg0KPi0tDQo+Mi41MC4xDQoNCg==

