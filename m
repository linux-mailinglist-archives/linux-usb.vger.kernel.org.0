Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBD363B115
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 19:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbiK1SU2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 13:20:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbiK1STn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 13:19:43 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE8A2E9E6
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 10:06:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqztqvebiq3iB2ZenHV0FfnwiVGDSGHeRdMYtFyFDZ9xIAzl+PTkzlJGss7KHz1JVcNlrT+JJPaDkgRwyXw1q70lHDMQk3ksA6fINIvJeHpNlHhEALcXxyHvi7hTkXGp/dMgShZC51anTk0SC5oO1GCHBIiuagBpNDnbGnoXJm0/TfEYuHXFQlu+SU5cSYLhIvPsgBQnf6NW/sb04N33NrgOR846id8/bR3UDiJ7Kpg3OoxB+ahx5x1Tld9gxw2Z42exaziAde9YDFApqyEuslWkeYvl9CRh/X/yJrYJvP4ujJzfIeLm8wNmMY60k1NZ643bHCiiFWFlZhLOpYSHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsudx7kJ9qswhzZ3A4gXPxzvkb0rvCINmCW2JOtqrPY=;
 b=ezF9aTmrQEvec4Zwvtk6feuSWi2VREarju/JmNHFV7Hwj4eICvyxigGrDyqkawen8wT7Pd3/3mDb01/WNqR86l/xqhxMtePFzov8r20aPtOnWekYPEOwqIAUxwsXT3InukapW0T5HIuqsdCpwh8jQTyeOF34biILH5jpHQL2vwDnhS90WiW0RClasd1SH2jZkZgP13FODvlYLkZmW5z8JKpaqN8z+5V+YY47+f1s9mOSmDZw5lLvKTxA/FTBxnWn/hZvbSMxA8k55IXMgbwcNKEnp29wx5IRr+Ratk5XvF+eD8BUVSWUI6MQ3rUf02FccYHHwPi9hJSHB01JbFJ0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsudx7kJ9qswhzZ3A4gXPxzvkb0rvCINmCW2JOtqrPY=;
 b=MpBTidgh9ypHSf8QmxGLwWt/7CMWaRXGUSlU9RT3Rc01E8VEPZ1Mku4IXwYoJzSjOrfaN2mJm/cfnRSfy4W8+djrFQc06EJVqfysYutUSTyz2O6CGwGpqavksLn68sweU8+JoU18LB2921hU8J5izfmPp7nMy2D0dROSY0VVas4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1ff::7)
 by SA1P222MB0037.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1e4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 18:06:40 +0000
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa]) by SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa%9]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 18:06:40 +0000
From:   Alex Henrie <alexh@vpitech.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, johan@kernel.org,
        johanna.abrahamsson@afconsult.com, alexhenrie24@gmail.com
Subject: Re: [PATCH] USB: serial: cp210x: map B0 to B9600
Date:   Mon, 28 Nov 2022 11:06:33 -0700
Message-ID: <7632128.EvYhyI6sBW@demeter>
In-Reply-To: <Y4G7z0fa7W/qseqw@kroah.com>
References: <20221126035825.6991-1-alexh@vpitech.com> <Y4G7z0fa7W/qseqw@kroah.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-ClientProxiedBy: CY5PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:930:8::15) To SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:1ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P222MB0296:EE_|SA1P222MB0037:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc3c7fa-fab5-43c2-d3a9-08dad16b4c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JuYtwN8IkFjayCCefoyJCbRPLFyHRa8JMHqj5sq3h16QPbDKhZuo8qABVr4xdbyUBew8ZQKbdxtLSxCZZq3a6pRz50NODM9lghGTnSpGSV2scmvxktjmxd8lJxW2fvwELzn7gv/PruQmm3iPL6oMj/w+askc8xbo10o+5cwlvNfhGsn5AEYcdI6cVBn4u7EfzlLDIGTAi6SooqxIEZASIX3sV4B0e4tIRSJD4mFEjxCweWpNzlDShb5zWtEKgSskQAlJb9kzGwzDY1eLtf/9HRk1jrIJ/X6cK5EbwcGwfS4xxlU5UyNxFBS1mnGZA5KjX1VogR22MIN8npeQnLpEcs/VyUo3v5aXodMr51riltazHH6U3L595OHvDxlC3rkKYEuZHBkL1nex19JxCJQM9spAMzIqHbbARFGxBM+VB9l4ArMS5on4X2sIBEWuddJOfvDOjsyUkL/0SqsVYo7+WryjKJI+UV+xgcf/c93qG1mHp2z1N7IkfNQHK4jVHgBsRRQ+WZMsl55/BRe2ozynssncpZbVl8cW2KZAuogA9rraY3I+zYPgZMjTMxgn3N4njeJZPo++xt/ZLobdesMrIfXpdeAjjIlKYG+H+AVG6E5/pEUn1dor6T7yZVwJzLHAMkEmy8gKLjXtHKMSpM2aRJpIXRSRQlu0bECWgZEIsZnEsUKvEmJ0fdRl1rBO3WEu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(396003)(376002)(346002)(366004)(136003)(451199015)(86362001)(6666004)(6506007)(9686003)(110136005)(6486002)(6512007)(38100700002)(186003)(33716001)(4744005)(8936002)(5660300002)(52116002)(53546011)(8676002)(478600001)(41300700001)(66946007)(66476007)(316002)(4326008)(2906002)(66556008)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/7EH4cH8TVChFCLEISi6ttgQLGb3cf6+PsnKZYjveR3V/KpKIkSoOZYeZdRe?=
 =?us-ascii?Q?h6vUK/P6Ne0fvE2xsBoIEQhOKdZMvMEYG2DCTTZ3ZbqfPwO3INVB4Mp7qND0?=
 =?us-ascii?Q?DIAvyAngl8bpiC9B8BxO0MwIu1cafvWcc5nWZ6A7RyLWKr6suPlkYMnFsm6r?=
 =?us-ascii?Q?qaF+zV1AfqOPlFsneI3B15LfV9il9t3jwDwXCc5wsFyJv0y/I0DDDddKIMQ4?=
 =?us-ascii?Q?Xpsj3jB001OSEa9Qii3xrUdON4C5OF3+gI2wLUa1XrVFDeLQgB1idXdQ0+rI?=
 =?us-ascii?Q?QCcIxY6p0lJBlb0XgR8DIwAmh0inT6OupMhhAO5y20FFGxrmV08Mef0koGr2?=
 =?us-ascii?Q?cKRo6e3YvFoBrv48m7KMil3YLge+ZgQy59uL4BTunxgYkwuomiQDO7A2v63U?=
 =?us-ascii?Q?fzT9p5oZCItamWeuUd8n3fTq43V9IsMIcsb7AI3AkqqCEFIYRRo4AU0A5HUq?=
 =?us-ascii?Q?+4QkqwabNPHKzBfRptMoxKLJQiUlQS7fD3P4UjCUHkMajQPFi9eBgDSVsz94?=
 =?us-ascii?Q?uS4BqtVhUtpCI219hAuxy02n2MUMlO8uOD0vPlCF9B4wy6mBZ6KIzsbD7IUe?=
 =?us-ascii?Q?0+9YuxharWEMdE/UbBzuiJ/yNh7pE74peBmNWON7D12SDTKHC8+1AEY52mFq?=
 =?us-ascii?Q?PjnGp7XozlXRy+7KfLQem6FVZloEbMGcUQ7SV5eIL+qpikq9Qq3mTPRRGrZu?=
 =?us-ascii?Q?VXujIkzLaB0VS1bQfPSr0vuA9gGVtxSf0zXc9sCCltFPd1i0GxoIq1ySNKMX?=
 =?us-ascii?Q?+IYLQd3iY60kYdp7Sq3TGQbdK0B4lek+4EopY86+qI9mMwtAycf/X2QQm4f1?=
 =?us-ascii?Q?tsJ4Ndht3TpHLBHCP93UH0nCXBJjCqJI3VzRXJEp/eoOqhAM7ZnnplZ/2O9i?=
 =?us-ascii?Q?m1rOJletgCJ8yeKY8paC2TbxAsNUJGR+2VE1KPd0UE1G7b2jFXkXJtn0IqUn?=
 =?us-ascii?Q?aZdYO7XRYOpC7EA3rZw4wDgmZRP6Mo9cpmH0k1uwSaYNn5IFdVAOXvtnpLZa?=
 =?us-ascii?Q?YHylPx0CVI11qV10wsLR7zgErkcFvYy8Z3Ad6y7OdVGEISCgEdSI2B+F1arn?=
 =?us-ascii?Q?6LpTPA2KMX0z28xL1k95A+m+n5nQ8lpMQNAErDAdESl9CVH5wZogbAPoZ4fS?=
 =?us-ascii?Q?MWz8t2OHYTP6DoYzy5G7n9Nxj2r7d3f4oj3kHp6U9NnC1JfqMMFD/QJYv4N/?=
 =?us-ascii?Q?7orf+R1jGHeC7cu05kkrkBWAbHMr07Gw6J7KXa4xaMXwXwYUY3dXb4NmRH+u?=
 =?us-ascii?Q?emcpHhyW+OIS+hEx7tqPOuq6nTBi5P+2gcUnAJOhI6+0DU0ggLDC3W0WGyUT?=
 =?us-ascii?Q?fJLgmzSOWnj7wBMJv+J38aY2zu2Z9MkmegAWii+daZ4MAiVYbZkRwqfncsQK?=
 =?us-ascii?Q?d1Ic6m4ysBmKvHlDRuTP+/M2jjZcAzo8y5iblY0G+tGn3ltsyJO50npVrFIx?=
 =?us-ascii?Q?zBkwtd6tGlaskLX9zR68HkijVPhwm98xLDgCMUaW2WaICKaJYdTq/gHoKwHh?=
 =?us-ascii?Q?+eRmLubFQJfsVdbbpqGLYcvBJfMbfI6F/fwOE0Ml++I3fSfYqb7GFTcE6OWf?=
 =?us-ascii?Q?DZVOkoW205ywTji2TFyt3/2/47MdNFzQL+49nXZnLukM83mgkS3Pwfq+PFS1?=
 =?us-ascii?Q?56nAKsMkf4M8/MKygGlWzy0=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc3c7fa-fab5-43c2-d3a9-08dad16b4c44
X-MS-Exchange-CrossTenant-AuthSource: SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 18:06:39.9518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hO1uxD2iwgPcNFQk06QQb2AeposM77hOAT8abKCUhmJXpvzE3+hUJrfJVr/m3Kfo2WAYBbuE+9Q6x6mnLKYxOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P222MB0037
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Saturday, November 26, 2022 12:10:07 AM MST Greg KH wrote:
> No need for { } here (checkpatch.pl should have warned about this.)

On Saturday, November 26, 2022 3:34:57 AM MST Sergey Shtylyov wrote:
>    {} not needed at all...

Thanks for the feedback. I will send a new version after running 
checkpatch.pl, and in the future I'll try to remember to run checkpatch.pl 
over my patches before sending them.

-Alex


