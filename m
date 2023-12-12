Return-Path: <linux-usb+bounces-4000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0F680E0B2
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 02:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F11F81C215BA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 01:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA5B7E3;
	Tue, 12 Dec 2023 01:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5Li1qMH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74137C4
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 17:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702343322; x=1733879322;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZWMc0qvjNsP5PEcxdWw1X3KmBNreoyDILnH61/8FSq4=;
  b=j5Li1qMHQjt7jv5yroZ4RL2ReU1JBkDbUcR60An4b0s7JaxlfsRZpZ6Z
   mH7sg72+61MF/rNsFyekH0wSOVOJbiD9aYJNS/iW5Q2qts+o3avkOqZNx
   iOZR0qQgrRjndojwpqA+SXTndrao5Eaegr9BsrSrtdHIuzubibzpQJ59T
   Us9tmTBCUOTGBFdjHGvalCq1CSOT7Gd2/+Lr5+qOVlKe+/MQ079pngIFP
   wLzeVOCEniZNsf8osjqvLkfkkgzuEJwLlSmhWrCF+fMOZeUBb8Vv8KHiy
   RUjRZft9JiX184sJffyiR/qlB+XepNE+3V8SpZrEVfgZQOXxU2SZKJesp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1600837"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1600837"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 17:08:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1020473626"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1020473626"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Dec 2023 17:08:39 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 17:08:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 17:08:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 17:08:38 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 17:08:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQydQ1UZ+x28AIbD5jDsUztygU4TVUbJTMVTYrADQlfmLn88zqy0btACzvokCARJ37qMFM7fdI4ttEuCcfMgZe/Zw4SFQaPM3Ut6e0jgsrGrI5So3hbYH+Im8n7CLfusIgYYxMCsTz0n/5IF6XPv4v2VkuuVyPRk1U3HYuFxkI01R3gwRsPjR20XmsnGZazdDtbBAXzdGy/Dwj21nufT7L72HsYLC0ae96DoY0xV7NZa7BmHs+44GL3gBSak5TFCIemA5GzFKWIuNMOG9YxShn+zJQr7Pww9B73TSd0OJtFW18SDuC+gBTbKRNzsL1hK97kmpP4Lu9WR77W0S+mUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCZL4lgCbSpDoJrivltTN8Os07mHxGktVt7R9EAQ8JI=;
 b=fbdrMdRr8LSqFBA6SM3/0VcpZY+dk5u1ETWDgjgShNYn7sJuzYLn4Swt406x/Bhq2PfZ2d1Bc300Xq+apA7MExEZ4xeebzV82Mh3yfkd7BvshFpwrnaoBSqCqPdRNefCkMrV3AJO/9QxdYbAuna0FL3LxcLorxECFY39hEYrEgrfQ7rMx3XLTAI5Onq3hmTy67qviz1CGo0ZkyUIWZQmDDFdShYcfI9Dv4WGhFlHtnPe0qAcy7V1LgvtQ6hrMegKKbbkblHcHxaB+oSS6ao7kJu6hchgJsXV21H17DD5qrEGnJYz2bXVEvEziVLMkKq6MN3IbanKNiBVrAgjkN/tjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 01:08:35 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 01:08:34 +0000
Date: Tue, 12 Dec 2023 09:04:04 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: kernel test robot <lkp@intel.com>, <linux-usb@vger.kernel.org>
Subject: Re: [usb:usb-linus] BUILD REGRESSION
 b17b7fe6dd5c6ff74b38b0758ca799cdbb79e26e
Message-ID: <ZXexhFm31R7TdyCW@yujie-X299>
References: <202312052256.y5R3B4ix-lkp@intel.com>
 <2023120635-devotee-plank-3278@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2023120635-devotee-plank-3278@gregkh>
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a55a364-5b94-4857-d757-08dbfaaedd1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7tl7B+EEFY6xiDbSCAJMKKxveMI0MqATuH4prTVo6A+M5XkpLlfQ6LwdUwZFlVZ/26AdmrDE95j9jhgDxImUkpWhprRnWI9rY5KB2kqOg2Gb6Q1F6T0wbt4e2JrTAEl+EqjBmvmav12H00DET4if6mm2v+O71zxm2J+d+RIpFCxnMo7t7zMzeZ9lOZlXwBoCYjcwX682GqPzk86vsy7NXWG5VJiOPkdatj8IOAB46QYhcE4N9sCYmX42r1DqLjWxIAaLW7voykLpMPpTGlfs3yfc1Xuk8cokS6esp+lzUlqPFXdZnMpTjtfutiR/c9ackhIzomkXX1CJH9KjI40y8ejlSqKjsE1Bl4i3nb16BeP4PKLPsvOp/1gHMBxh1DTLrUGfVZgfxYKqWXQsP3MFVpCoA26x1ikqtjHHmJ05O5hNfboUhW051xTgAEExNLP0JuEaxsEYR7F8h6b48dqPZ01MeKFMb9CNKnKL0ytPLEW8itEkHf3x62CHvM03Mx8WJoqnjWz1du26fmc0UgKjxZn4TpnxuV7sGwwbT2VxDjmtIjgFQPrYyPbAH9n0M81WM0LH84NC1AiPvqHunIh4KaggdhKPh+LC35IGq66UZfaYJCsYwa7SxiTLyazB4VkFB7QPq+RMZoyiCu37vlHh6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(186009)(451199024)(86362001)(38100700002)(316002)(82960400001)(66556008)(66476007)(41300700001)(26005)(33716001)(83380400001)(6486002)(9686003)(6512007)(6506007)(6666004)(966005)(2906002)(478600001)(66946007)(6916009)(8936002)(4326008)(44832011)(8676002)(5660300002)(98903001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GUJ5sLJ2dcHoYjHAAgvP+OAwwavFXBHMdwLwMIDfmCAltb6AQz3wC+O+42Ao?=
 =?us-ascii?Q?lrpI7GeYQEgn5L9DF07CbGwYlW91Rp5P2sNdek8ntlMcBht6SM3D4xJ16LCb?=
 =?us-ascii?Q?cK/s82VZJeS3xEX33gApsz5y9KTo3OBt6ZuqkzujxDMhXMR0Bd8eFohQuWpd?=
 =?us-ascii?Q?UCsJ/sXCqXroInOEMN6q3WF/G8ZDe/EtfMP288oXBzfxJGSK7+/hi6QsgZ4R?=
 =?us-ascii?Q?woa+BsdXakzfLQuKFPDRUtQjB6c5dQ/MVAGoEnrLr5Um993wIKkmDeBn4hd0?=
 =?us-ascii?Q?BDMbd6cVuGHAVcVs/IGkbOV7mr9KKql52ogUgiTLl5VeFDosGUw3pyZCcP8U?=
 =?us-ascii?Q?K/+HZxApoOeOBPLe2Uv6VmOLpFep/vywLOx6sWHTyf0lOxsu/LcgptpYY/Te?=
 =?us-ascii?Q?Y+ixD8kfO8W4PkgaKOWFPla/PfAHin7g77bmdWWULR8Rh/9VtHjju5AS5oT0?=
 =?us-ascii?Q?F7tdgIoqEnkfIYwjHCRpH8y5Bls9TmvvKxJJICGGnbdmRaVPidbgPb+BrSIf?=
 =?us-ascii?Q?losaKb+PpxfWDBVp2UbO/JjiQuyb3ASmfW1ONs65bqPTnkAs+XQ9zi8Mr0Vj?=
 =?us-ascii?Q?VD0qBi+LVbqzvHmX/+pSDPU5oJ9kbWcM/WRy9ncY61tnVKmfOCNEpVmJj59K?=
 =?us-ascii?Q?oAxuWqAdRpJLDxc2borjYh5rBnC9XZyAguLYZQEzKQcAv+LbLuF4+xkMVznE?=
 =?us-ascii?Q?Rkfw1TXoO5AQaz8VsY2B3GoEVtmn7zF/vfaqtpoRjILbamnVeXip2zFcsKXG?=
 =?us-ascii?Q?UC8NIPCPkBG3kHcEJxPzF+TlXrze73RNs1oPqrxRZFZ1nSL+jNNL95UlBtt3?=
 =?us-ascii?Q?oRLcZQTH6LrepXGH5rTXY6ci1gk6kwZiATBxLx5cZRNBAHcsHGjaSetbk4k0?=
 =?us-ascii?Q?JiWr2vrw78/bv+PWNpTnH5hldyFFygP98NPKcIn6rcHpKWQqjjPFFuxxAmod?=
 =?us-ascii?Q?zMZqhv+6s/qSahyiB7qOBuGFJyJ+56WWx2EsRH9lqoR3AciVpYahqkaxcRae?=
 =?us-ascii?Q?lDlXK+LtqhwU3638+iAlWGggsyTRfqL0P8AO+S8G4+KIg9uz5KhuUgs136VC?=
 =?us-ascii?Q?L4dL8eNBJWEs0KrnmZ4Coim1QiUL0dJE9oSEn0ga/2l9VB+8fE/5pnA+mB6h?=
 =?us-ascii?Q?cGJOrvkVSfqRhDRWXW07Y+qaBNzAtxKCmIOSR4aSbZisQ98gChdPh+u/adgO?=
 =?us-ascii?Q?ILSsq9Efg6TP90LM80xwL+WoJdaspKc4eu98vl7VeU+R1yt+LULkiQQIsneK?=
 =?us-ascii?Q?CkoQibTVp33IUh+Hx8OQMj+pOdLdLNy26O3Ld/Fa53BIkB4SqrrPg8EHOLuf?=
 =?us-ascii?Q?ZmJS8dTS6AvovaE1XDqaxbEb+D1WkkGGZqGUmvkQI880zJHV5VU7KO3TxTqc?=
 =?us-ascii?Q?8auvwLBheAjgKKcHIck8fZyWYiQdkHAklGNOjRMsZpiQ+ORZIBwFQuqxFvR8?=
 =?us-ascii?Q?Uq5nb/YUXrvUWQaJYze4ziz6JdlQR9D0rnUTnNSpGeZuj9niCkQlSiyaS9sk?=
 =?us-ascii?Q?sybcmCThUYtu2g/i89mkx0FG18oUuMg6CxPXg3uyG7928gmwcf9KExw43dvs?=
 =?us-ascii?Q?JichkijEF5d/9D/EHYs4TH/meSIh54BX+o0naLev?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a55a364-5b94-4857-d757-08dbfaaedd1b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:08:34.5562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5ImROY4SjUBiZtcPj5D0cYwiAmR4o5DWCQS8S04Scf2bK/h5EEofhrJde1GQv5kM3UX7qG2OkDcjJawsIxnGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
X-OriginatorOrg: intel.com

Hi Greg,

On Wed, Dec 06, 2023 at 02:36:10AM +0900, Greg Kroah-Hartman wrote:
> On Tue, Dec 05, 2023 at 10:07:58PM +0800, kernel test robot wrote:
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> > branch HEAD: b17b7fe6dd5c6ff74b38b0758ca799cdbb79e26e  usb: typec: class: fix typec_altmode_put_partner to put plugs
> > 
> > Error/Warning ids grouped by kconfigs:
> > 
> > gcc_recent_errors
> > |-- sparc-allmodconfig
> > |   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> > |-- sparc-allnoconfig
> > |   |-- arch-sparc-kernel-traps_32.c:error:no-previous-prototype-for-trap_init
> > |   |-- arch-sparc-lib-cmpdi2.c:error:no-previous-prototype-for-__cmpdi2
> > |   |-- arch-sparc-lib-ucmpdi2.c:error:no-previous-prototype-for-__ucmpdi2
> > |   |-- arch-sparc-mm-leon_mm.c:error:variable-paddrbase-set-but-not-used
> > |   `-- arch-sparc-mm-srmmu.c:error:variable-clear-set-but-not-used
> > |-- sparc-defconfig
> > |   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> > |   |-- arch-sparc-kernel-traps_32.c:error:no-previous-prototype-for-trap_init
> > |   |-- arch-sparc-lib-cmpdi2.c:error:no-previous-prototype-for-__cmpdi2
> > |   |-- arch-sparc-lib-ucmpdi2.c:error:no-previous-prototype-for-__ucmpdi2
> > |   |-- arch-sparc-mm-leon_mm.c:error:variable-paddrbase-set-but-not-used
> > |   `-- arch-sparc-mm-srmmu.c:error:variable-clear-set-but-not-used
> > |-- sparc-randconfig-001-20231205
> > |   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> > |-- sparc64-allmodconfig
> > |   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> > |-- sparc64-allyesconfig
> > |   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> > `-- sparc64-defconfig
> >     `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
> 
> Odd, why are errors for changes that are NOT from this branch triggering
> the bot to report them here as if they came from this branch?

Sorry these are wrong info due to a bug of the bot. We've found the root
cause and fixed the bot just now. Sorry for the noise and please kindly
ignore them.

Best Regards,
Yujie

