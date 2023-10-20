Return-Path: <linux-usb+bounces-2020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF027D1949
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 00:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 660E8B215AF
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 22:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269A6249EF;
	Fri, 20 Oct 2023 22:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ELqsoopE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kxdHKUeo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VklvibHF"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B431E51D
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 22:43:59 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1E21A3
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 15:43:58 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39KLWE2B029764;
	Fri, 20 Oct 2023 15:43:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=wx9iwuToZCCsq//N8UXpldQ6ZOzOx1zl26st0c5PE2Q=;
 b=ELqsoopEuxc620JTvwjfxw0E6IMZr0lS4twYA42CDzsK1kMGcqIr6WZQqCD6mp/7E0We
 1XS6ORDXJtnWXPL5Wkp9No/cQtSohyNFP8hUj/OEQe1vg43Orn3nSR1VQbmhciFet3cp
 mM6f4U0/EkqD6UWYYCN2wPsuCBks0yBxo2o5zmNgHEnqmI2rHZC2pW60eqQUAKfccH0r
 Jj591ZZ55k3xdfJbwJY7ZEdNC9lwiJkBL7tWDl67RmBHNKlG9VszCx5YRX53jjn4Alut
 x+QkNw5d42j25RgffyPWy8aZkAlS3v3JUkDFGt+/W4yV1UAY0Tzw/YsCVV7cjRigTlwT gA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3tubw3kux3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 15:43:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1697841829; bh=wx9iwuToZCCsq//N8UXpldQ6ZOzOx1zl26st0c5PE2Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kxdHKUeoqdnOkoXhC33HX1fHhelrAWRwU0nyJOhJxYPlQryzXU0Qy7z3DGPB21cT7
	 W+Lkr9G/NYmuXvoST2qvgpih5eX8sI6UVz0JZrk9nYmek5HNCntVU5wpBMc2Fv+wN3
	 s0AgqqMfWj0MFlkHR+kt0QUR2HFTDfZB9KL+nWbnZFx4BEtP5Z93drvgHr/Q6G1or0
	 kKJWdDTqonudSsbrqbuJSQKGFutJlj24sMr3qplFS0TtWuZBd2VZByYPBCgPAjSeFF
	 8WM1VjRWOdL7vq1wAyh3mY4j0W9O9lwQfrVJoKRq1mvMQE1rNDERt66fbigzSRMXhC
	 tJZYqI7hGcaEw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8554E40565;
	Fri, 20 Oct 2023 22:43:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 83A25A0081;
	Fri, 20 Oct 2023 22:43:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VklvibHF;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AEF3A4013F;
	Fri, 20 Oct 2023 22:43:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKtB1oyWkxDOB6k8aK4Jdu5U/vTPBvv1g/5UVeE+F2BV8I92I0nky2InLtnbjVto9JsMlvP9zDwMBZj6Bp5fn8kn8gyNFVzyHFudjH+GiFX5W9MZJ+9P3/ZB+z+qhu8ZRdtbO8CW6o0BDIiLyE/45RwY/BgNaed1ENHj0kiRgJQQrzH9akxn+QdmrsbNuW3WLRm9OXtoEJ7++rr3O8TALjBLsM2aYdUVmHptgxl5bbnMTy8tGlUTexeE8n6DVMPN+ZTfpMOfGHCFh+uXXZFGHoChWnwOih8iDtjkWWrJg0vG3IgsoGZSmMy7f1sIFSb8NlIgRCtD0fD6Lz96CianGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wx9iwuToZCCsq//N8UXpldQ6ZOzOx1zl26st0c5PE2Q=;
 b=KGDklBXyl4CFQDjuZzNRC7muybEM73kApcWvXlghjQOmDDa3yKychvBzL2379SEniOwj9LYQ0bmBeCXjj4AQPWfybiF/EH6SnSl2tY9grv0m2SlfE5igjABLPvBNCY20SZrJoYbWV2JruqDFo9CAaaXChaghncgMZXmnDLDypLh1zNzi9e3cu/A72WPpD5unfZ9eXUkdEWj2Y3eU40UM42dO7vGzHjEenBbhpPQm98GXyuza/cIbkdmk2La8R20sdMgNmU8Lz0A7ljF/WOG5Pou1uiQD4JKocS6j3zDwB7w+/iDO3kAQvfPk6y/5mcMLoZQWDG84tui+RKqyEU3X0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wx9iwuToZCCsq//N8UXpldQ6ZOzOx1zl26st0c5PE2Q=;
 b=VklvibHFZ4rc82E97xaoEQIw3x1ukePT7ZuTUad8+VUgc3AGiJ+bvxBWyxRB9vle3g6zcw0lMXvXBNTyaMyJU+1w/GCWMbdzqNbP7U6l7xIk9k+yMIhblipUHNKPgBizm4Fuvo0+xybKqJZgRQe69yrBBNjtTwh2EoqXLxA/Cp0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.23; Fri, 20 Oct 2023 22:43:40 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b63e:67e6:b5fe:a8cb]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b63e:67e6:b5fe:a8cb%3]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 22:43:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/1] usb: dwc3: let role switch handle initial state
Thread-Topic: [PATCH 1/1] usb: dwc3: let role switch handle initial state
Thread-Index: AQHaAL7XVe/PRjRjRkeuC1ZCgJjkDLBTTDQA
Date: Fri, 20 Oct 2023 22:43:39 +0000
Message-ID: <20231020224330.e4tddtcer3uv2eb7@synopsys.com>
References: <20231017055726.904133-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231017055726.904133-1-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DS0PR12MB6632:EE_
x-ms-office365-filtering-correlation-id: cb8e2207-62a3-4e16-efee-08dbd1be0167
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jp9l6auIpUsyKxuqKhKht+TSiFCywQRHAa9vbXPtBJaw2sYTW36lK6Dmbv6YMQRuXlodpjvN6C2scbL6Sg316DAKq/riaRB7RfWZboAONMmfVIYvr1cfrG0taVBN/OeRh/rSZ7EggTRUJbomGRgRIwkpUF/JMZ2mySEJMJX+rY35b3Z9g7ikvfM0fJCV8n9jhPoXpmukydV38r40EIH/B1M0cewHM840UQdPEDrn1Jbd94mUiMfS29LmcPRf2zhm+sjXqGaPedFwY4xkriGOK6f+YhfyJCRMIJkTpUicdGsxxEfVjqP+MpDnkuPcqvT5Gh13HW1xnKOj8Y4ekwarcehixI86PX8BQLjO55810D2ygX/AinhB6FNVxvcTpIvR92OZsemNHZDVre48FHZIPzmRsVJ+WgcpFfkpQfIauHu5Sk2vSpRP68BBxqJW2u9iEssTsib+Zk08raKryB9AMXmNr0ylrnSNEOKOZu31LHyddZ1AhnL+sdkD5XddBmGnzWP+QQ8A4yraD9lPkVCT5veQkGMpTJxJMRKse4M2qVc7Z9KD6m7PJvAFFhpSTFaPIkGQaiA/UerCHNZ9aM7rIVhCDccGFhknsokcVksjlvh1KkGFTuhc0nEDOpTMSbEt
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(38070700009)(26005)(316002)(38100700002)(83380400001)(66476007)(66446008)(8936002)(64756008)(4326008)(66946007)(5660300002)(2906002)(41300700001)(1076003)(8676002)(66556008)(86362001)(71200400001)(478600001)(6506007)(6486002)(54906003)(76116006)(6512007)(6916009)(122000001)(2616005)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SEFvSXRnR2lwdnR2bUtmN2NNNk1tWEk1Qk14WHJJZE5ORDBYVGlMVW8zcVN0?=
 =?utf-8?B?NHZMd3FyR0J1b0d2QVFQN3BvdDdPZ2tCMkUyUG4xQnArZEFYVWtmSjhRc3BT?=
 =?utf-8?B?SUd4Y2p6ZVhITThhTFI2ZXJONy80cWpuYU1kZGp6aUxtRVluVGk5bHlNSXc3?=
 =?utf-8?B?RVdla0djcWQzSDdPNHNYWlhWemRRVVExWDFmMUhVSkE1SitabW01ZjlLdFBq?=
 =?utf-8?B?czU0aHM0YTI1VmNWRW9NVGVyY0FEVUQvUGZ2c2xscmgwUVd0TE1NQjV5Yi9y?=
 =?utf-8?B?TkY0NzJuT0tNeFV1TXFmejMydUlxTDBRNWtRaHNheFlQL3JBNVBaWlhscTFW?=
 =?utf-8?B?T3dBYlROT3BiQWxYYnFVSkhzZnN4SE1wTHAzanduSjUyVDcrWVMxcytqSjJn?=
 =?utf-8?B?aDBjN3ZqSjh6U05MTnZQdnptazAxSTJoV0pRS1kvQkJBaVhmQVRta3ptZGx2?=
 =?utf-8?B?Vnkwc2lWaDZ0Rnd6MnBlMzR0WVg1Q2F6aFl4NVpBYmg5ajdVWUlycThZSFdU?=
 =?utf-8?B?Q0ZPZm9vMDlDdXB1NkR4Uml1aDVjNTZCVUEvYjVxa0JNZ2VqUjlERzZYZGtp?=
 =?utf-8?B?QWhvUUVyWEZQVmdMYjR0OFFMMDVacnQ0bWJSRHVKa1FrbnFWOXRaMjJLcGkv?=
 =?utf-8?B?bDlDUjUweFRubHlMdzJiaVF0MnJmazRLUEtqMEE1aUNhbU9BVHBwbU5DbndX?=
 =?utf-8?B?R2lBbW5KbTNVRldPd1FuQXJEbnpzb1pkRUZqa05aU0tHWnU0RHErdnZ0bXF4?=
 =?utf-8?B?V0U3N3pGaXBSVlcyVHlqNUE1VVJraXdRbHZadG1OMzNHbnF4WGlpTmhlSmZZ?=
 =?utf-8?B?TXJOSUNvUThWK0NjblA3UzBCRDgrWUFoYkdaRWoxV3JGMlRlYU1ucGdFUkx1?=
 =?utf-8?B?aUdhSmc2RklaU2lwQmV4NEFuaVFjdExWMUY1d3h1bE12WVNZZHMzc1NFYi9V?=
 =?utf-8?B?dGx6RjduWVFOKzg3TmJDZjRyY3FaeitoZm11bmJZTzVrZlZtSWhNTXd4VTVN?=
 =?utf-8?B?OEh5MUFFYUk3ek1YODVhVlgyVjdaakxyOGFhcHJEZVFlZStEeWFxQXAyN3dR?=
 =?utf-8?B?SWFpKzl0REFnWFZ3TjUyNFY3R08zOGp2ZGlndUdOdE5BanpwRzY1djBxYVVp?=
 =?utf-8?B?S1FXY0M0N094Q21oUGdHWStnNndScktxMlBocEhrVXNBR1MrQzdSWXFUNkpr?=
 =?utf-8?B?QlFYb3NSamhVdjFWRElhUXJiek1pUnBTVWRRT2I5SkhtMGNLVHVWdVk4MlI1?=
 =?utf-8?B?WlY1L0tFMmUzTmg5bDJISFhFYmdKSjZyZ3lBV0NDSmV1RVJlTGJJbnBaL3lz?=
 =?utf-8?B?d3NacHdOMml6Mjh0dmt3NEM0dWk5cXpJWFZycFZjUXN3S0lnbHFrRlR4RnR2?=
 =?utf-8?B?OXZCeENVVFh2WTZrcEpxN3l1NWJWRnlwbktNaWEwcThJVnhvdFV0YjlUWUNr?=
 =?utf-8?B?cW5LRndRVkwvY1NEUitrQVVycldqRU50NE1ubDVqY1RpVzYrczNRc3RxV2Ra?=
 =?utf-8?B?N2o3dDJLekYxN2V1WnQrSW40ODFJZXkyUWw2bTNubE4zaU9WQW0xcDVGSVR2?=
 =?utf-8?B?TUM3YngvZFM4L216cnlUQmoweTFVWFNBeUsvc1RRNWl6Q09GYTU1QjYvUjJn?=
 =?utf-8?B?dmM1alNHQkZCUjFPaERvQjJaUHAxTGFKY1JTZGxGemx5N1Q5aEVXOVF4eWo1?=
 =?utf-8?B?QzRqdTlrcEVHSklUUU0xTHBVVnlmcG9pVFNCa0Y0TzRpOVdwYlV3T3BjQmRy?=
 =?utf-8?B?RG5WWXpyaEkvSUUwS0haSFJFT3I0MWFibXBGYWZyUjZHWHBlNmMyTHdGK3JQ?=
 =?utf-8?B?NVBQN2ZlVWVHSjRvTlNoSDZ6eGpPVURha0tRUGNLQU5FYk5QVHBDUzc1QXg4?=
 =?utf-8?B?WFhxaGlTbk1BYktDZEpJMFJZb0VINFZGTXRWK2RyeVE4dmdpaWNPMFZJVWtD?=
 =?utf-8?B?TGR1bGR5Vlc5cjU4NThicitTMW9UczZpZjEzQXVHMWNtQm5DY0tDZ1FOUzc3?=
 =?utf-8?B?K0ZYbFM2RFE1V1V3eGx0OXp0TVIzNk5ic0l3ckl2TlR3Tlc2RVJhaHVFMGlH?=
 =?utf-8?B?K2hCN1gyeUgxckhWeG8ydFNRZXRDLzBLT2dQcitZcnM0cWNlZFlhODNuc2xt?=
 =?utf-8?B?WnlZTlB6aVkwTG0xb04wN0NyN2M2L01wVTg2blMybm81K3RNSFVJZFRYYVo2?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3F163E72D43D947B9419581CD88CAEC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	RJ0hUKFFUm7Lb34xDzZTKXxQTBVNlYhIF8HFhuD4yppqy9xpkw6v6VcwXSIyYiN7hZHSvfPYf4aO7gCtCJ2pKtj0BFlmfWnCwkkYtz+NTVUaRuDudYG9fvwCsFjRkSO8hHo3JkXl1XvxoiVhYvQIAxddGswvmOOk4pnsaMVoVvC6Jk96EQdDVCIn84DqzNUrPdrTLAoIYb0oIIMhv81jzJ4Oi1y/8n5M3KdLN3N3rc7ig31NNM3As4yFP5gB8Zrg0GXbXirJA7+pobZxsBdN6H1md2utf+9YvM+DWq0PmircSo2bnOCKDv2LKVsF5FYZR0c7Y9vEIonc7hu/7Q6saT3GhUu4Es4YagzO0hWVUEFd5GPSXXL6Of/tGUT0oPjzJmq3PmCE/s4au/Ik3eTh6sMf4TfEiyEcbKadGbVGXPY2talQkZDZ5M0bhCIaHAXPgZuaxxDe1vdCCgZW+KgzjpSUX/8vnahE/l2OmCmSPGNBXZpae7c52I54GVllR/B17jmOqryLRDELMLDqfp+Men26sIdHxWfnr6D+LYCJT5L7e7Nk38J0PUWIF0LPzws4bw3p5wtb9hQRfcbX7qiUh7TxM4AIXDejct8/ic0NlG9naJwYVVZSoDGFzzCqMmHWsHAnoA8PuLSm3vssnmrYI6CRoAt/bS+P7t3tQe5JvSokwIJhRQuPXrq20YbHBzQM+pvvygH6vgmO+J6BeoR1FCaGriv0uIbNq5nfNUHu+M3rMfzPZAbH4LJ96/2hk3PUK7NqFP3/gWLcDLT3XszTs48ag+Z6y/38QxFNrDhtO+kJhqfZzNi/jGJqB+Kuwek6AE5HoVk3f1bWwK8t+cdbcN29KSZlAwF5mLT8SAJb4JBM9Uaz1G4P3y4oWaIvdwQwEitEXVZoxM9JiGgwGiv8gQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8e2207-62a3-4e16-efee-08dbd1be0167
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 22:43:39.9982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ix0+TwG/n68oBRXNKCCfFs36BSjYzbevI7/TFgQcsoWC5L26bfp8jCwwK8theYyfI1ZvFvNX/z34FsSBcR/GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
X-Proofpoint-GUID: RoKbVbiHgNBg8kv5x1Ftt0QlqfQTzsnO
X-Proofpoint-ORIG-GUID: RoKbVbiHgNBg8kv5x1Ftt0QlqfQTzsnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=939 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310200193

SGksDQoNCk9uIFR1ZSwgT2N0IDE3LCAyMDIzLCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6DQo+IEZy
b206IE1hcmt1cyBOaWViZWwgPE1hcmt1cy5OaWViZWxAZXcudHEtZ3JvdXAuY29tPg0KPiANCj4g
V2hlbiB3ZSBoYXZlIGEgcm9sZSBzd2l0Y2ggZGV2aWNlIGF0dGFjaGVkLCB3ZSBzaG91bGQgbm90
IGNvbmZpZ3VyZSBvdXINCj4gaW5pdGlhbCByb2xlLiBMZWF2ZSB0aGlzIHVwIHRvIHRoZSByb2xl
IHN3aXRjaCBkZXZpY2UsIHRoYXQgc2hvdWxkDQo+IGRldGVjdCBhbmQgc2lnbmFsIHRoZSBpbml0
aWFsIHJvbGUuDQo+IA0KPiBUaGlzIGZpeGVzIHNpdHVhdGlvbnMgd2hlcmUgYSBUeXBlLUEgcGx1
ZyBpcyBjb25uZWN0ZWQgYWxyZWFkeSB3aGVuIHRoZQ0KPiBkcml2ZXIgaXMgbG9hZGVkIGJ1dCB0
aGUgZGVmYXVsdCByb2xlIGlzIHNldCB0byBub25lIG9yIGRldmljZS4gSW4gdGhpcw0KPiBjYXNl
IG9ubHkgYW4gZGlzY29ubmVjdCAvIHJlY29ubmVjdCBnZXRzIHRoZSBjb3JyZWN0IG1vZGUuDQoN
CklmIHRoZSBkZWZhdWx0IHJvbGUgaXMgbm9uZSwgd2h5IGlzbid0IHRoZXJlIGEgbm90aWZpY2F0
aW9uIHRvIHVwZGF0ZQ0KdGhlIHJvbGUgb24gaW5pdGlhbGl6YXRpb24gZnJvbSB0aGUgY29ubmVj
dG9yPyBUaGUgY3VycmVudCByb2xlIHNob3VsZA0Kbm90IGJlIG5vbmUuDQoNCkJSLA0KVGhpbmgN
Cg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIE5pZWJlbCA8TWFya3VzLk5pZWJlbEBldy50
cS1ncm91cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdGVpbiA8YWxleGFuZGVy
LnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4NCj4gLS0tDQo+IEkgY291bGRuJ3QgZmluZCBhbnkgaW5m
b3JtYXRpb24gd2hldGhlciBVU0Igcm9sZSBzd2l0Y2ggZHJpdmVycyBhcmUNCj4gc3VwcG9zZWQg
dG8gY2FsbCB1c2Jfcm9sZV9zd2l0Y2hfc2V0X3JvbGUoKSBkdXJpbmcgdGhlaXIgcHJvYmUuDQo+
IEJ1dCB0aGlzIHNlZW1zIHNlbnNpYmxlLCBvdGhlcndpc2UgdGhlIGFjdHVhbC9pbml0aWFsIHN0
YXRlIGlzIHVua25vd24uDQo+IA0KPiAgZHJpdmVycy91c2IvZHdjMy9kcmQuYyB8IDEzICsrKysr
LS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kcmQuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHJkLmMNCj4gaW5kZXggMDM5YmYyNDE3NjlhZi4uMWMyZTUwNGE1ZDhiYSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kcmQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2RyZC5jDQo+IEBAIC00OTYsMTUgKzQ5Niw4IEBAIHN0YXRpYyBlbnVtIHVzYl9yb2xlIGR3
YzNfdXNiX3JvbGVfc3dpdGNoX2dldChzdHJ1Y3QgdXNiX3JvbGVfc3dpdGNoICpzdykNCj4gIHN0
YXRpYyBpbnQgZHdjM19zZXR1cF9yb2xlX3N3aXRjaChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgew0K
PiAgCXN0cnVjdCB1c2Jfcm9sZV9zd2l0Y2hfZGVzYyBkd2MzX3JvbGVfc3dpdGNoID0ge05VTEx9
Ow0KPiAtCXUzMiBtb2RlOw0KPiAgDQo+ICAJZHdjLT5yb2xlX3N3aXRjaF9kZWZhdWx0X21vZGUg
PSB1c2JfZ2V0X3JvbGVfc3dpdGNoX2RlZmF1bHRfbW9kZShkd2MtPmRldik7DQo+IC0JaWYgKGR3
Yy0+cm9sZV9zd2l0Y2hfZGVmYXVsdF9tb2RlID09IFVTQl9EUl9NT0RFX0hPU1QpIHsNCj4gLQkJ
bW9kZSA9IERXQzNfR0NUTF9QUlRDQVBfSE9TVDsNCj4gLQl9IGVsc2Ugew0KPiAtCQlkd2MtPnJv
bGVfc3dpdGNoX2RlZmF1bHRfbW9kZSA9IFVTQl9EUl9NT0RFX1BFUklQSEVSQUw7DQo+IC0JCW1v
ZGUgPSBEV0MzX0dDVExfUFJUQ0FQX0RFVklDRTsNCj4gLQl9DQo+ICANCj4gIAlkd2MzX3JvbGVf
c3dpdGNoLmZ3bm9kZSA9IGRldl9md25vZGUoZHdjLT5kZXYpOw0KPiAgCWR3YzNfcm9sZV9zd2l0
Y2guc2V0ID0gZHdjM191c2Jfcm9sZV9zd2l0Y2hfc2V0Ow0KPiBAQCAtNTI2LDcgKzUxOSwxMSBA
QCBzdGF0aWMgaW50IGR3YzNfc2V0dXBfcm9sZV9zd2l0Y2goc3RydWN0IGR3YzMgKmR3YykNCj4g
IAkJfQ0KPiAgCX0NCj4gIA0KPiAtCWR3YzNfc2V0X21vZGUoZHdjLCBtb2RlKTsNCj4gKwkvKg0K
PiArCSAqIHVzYl9yb2xlX3N3aXRjaCBzaG91bGQgaW1wbGVtZW50IGluaXRpYWwgZGV0ZWN0aW9u
IGFuZCBjYWxsDQo+ICsJICogZHdjM191c2Jfcm9sZV9zd2l0Y2hfc2V0IHRvIGdldCB0aGUgc3Rh
dGUgbWFjaGluZSBydW5uaW5nDQo+ICsJICovDQo+ICsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4g
ICNlbHNlDQo+IC0tIA0KPiAyLjM0LjENCj4g

