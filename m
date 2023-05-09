Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0DEC6FBD01
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 04:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjEICRr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 22:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjEICRq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 22:17:46 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED960E60
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 19:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGAwRfQUbs7k7MtUGgurihawNAF0qip9YKSPnTSGjgIK7j69BRVMnvKEBaOY5GSRKsMG85QL+2rn6JQvhuBgxzS91c0Lh4SMCJlvo6TngnS5jJ+ZDXmIfwNq7q+MWGMZj7HEjn2Mg/FOcN/m+VqHGcDj8auGkhDhDn3xC8/kngOFM4/ZoW1mx+aZuHyA/m25nsoYASr82gxq7LIpnUkgcow0weEmRbHE6sAMIc20CrsPcJFiyPG+ppsmll2EWq8C6TGdVsbj0con3QpBCMDd2HccnGheZpFTnTFmDZ8qCD+lywGG8qkRlaE6+PfOqaC1YHt6/gICuXbU8pxcnZvfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1Sz9LLjRY1V8gbqMqlLEKGDU7+UJmfhcpP3kbpL/xo=;
 b=SQlMmjfuUvhFGrsG/gsGgqCFbjQ6i4B35/eRs15nxuk4o1lbKaod4bOb6GQ1UAvwh9LwoayEkEW3NG1V/DnLALsrbLs5iY/md0NuJoEaH35pbYbe2QpFOJjNw9hfGjCHEJzmwV5ZaaHNKr7W8FuteqyY6PlpBKWKUVh9QA0OTK28DRn4Iu4VFIgckD0GsfhaMVdaYw+tmTASQ0LJ8ULVQpGK6h9peOGV+UBQLjy6cHN2zMQ8awV27h432qnjwTWv43sUBQwVdnB92QLtKO+h1di965EDDK7KqFxaHSreycFzMJi3dK4uZ63JQ3iEjavmAHdx2wDmqWmn7I4f8EIgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1Sz9LLjRY1V8gbqMqlLEKGDU7+UJmfhcpP3kbpL/xo=;
 b=NnsaCP+8UTPdsSoEZKzhQ5GlF4r/ak96adFSVNkYHcH7O+UVpdAQVkVsOHsAXeEDxsOU+9ej7oCOabYi3OJ9WVecVcJ5IRibssNRNbhcgR+tymdBV7svE6NxI083aHzvgGG8kTA2mrXo0GJY4xj/d9d5fC1kwZLyqjUO9QLs7fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYCP286MB2366.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:18c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Tue, 9 May 2023 02:17:42 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 02:17:42 +0000
Date:   Tue, 9 May 2023 10:17:31 +0800
From:   Hongren Zheng <i@zenithal.me>
To:     Galen Guyer <galen@galenguyer.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbip: give a more helpful error message if vhdi_hcd
 isn't loaded
Message-ID: <ZFmtO64UqItxjsSz@Sun>
References: <20230508212120.435329-1-galen@galenguyer.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508212120.435329-1-galen@galenguyer.com>
X-Operating-System: Linux Sun 5.15.67
X-Mailer: Mutt 2.2.7 (2022-08-07)
X-ClientProxiedBy: BY5PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::40) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1393:EE_|TYCP286MB2366:EE_
X-MS-Office365-Filtering-Correlation-Id: 700930bc-6726-4d53-ecfc-08db503391bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32mLxukPVfVG9Og174H0oQl7Q5MZV8E+ROJxUtfoMwQGYq2kE4bStbky7za4Ce5/sEfHB3WLPGayyD9ntHOJS+HFqyYVP0FfPY3uSXJLQYH3dcdWmjjHVFtH0owfQ3kRY2J+osblGVXtlMND75PAaLzuyTCIxAvhB85PI7MHL2SYvzAD+VM3BpugRg7EfL6mbsXybDjcYTNOFCkP3NAeXgSxLn8K6hNaUxtmoWguGN3JgjRQt4hL7EwM6lVyUdSM+zMWFubhcBpjdCOoBOdgMAIcFkLigQ0kDkP2dqExKG+Y+Jrqk5TEssc2DRSzGRxU2YRnWrMmU4pSVU+gjaiPOzlgkbIc+rbVL3oin81VBPtIfgnpI/rSy5hGlptVjjIhU2vzF/OwxF3RwSwQQSvG2tjB2FgyaMZ8hnbd1zHJP0zdNhYLqnMgcWJYJrG0cUWkZd0KLvcayPOt5WbevaaAwKMmf3sK3bQIEvCf8FZRmGGmMlXLuR1o2ZewsMr8JBzWa+eJ84yhNlickkdGKruNKJ97yOVIIr3NUzPtJ8Pco6MW2WBlDnHELKO5h5BPlurRJwtV62PmILdBlgQc0ClQwXgedzCcYGv92G66QM8mVPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(376002)(39830400003)(136003)(366004)(396003)(451199021)(86362001)(316002)(54906003)(786003)(66476007)(6916009)(4326008)(66556008)(478600001)(66946007)(6666004)(6486002)(33716001)(41320700001)(2906002)(8936002)(5660300002)(15650500001)(41300700001)(8676002)(38100700002)(186003)(6512007)(9686003)(6506007)(83380400001)(49092004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2FtvAR+zF/KtyR9EZefJMlWiPL0FYjgWaRPXjgtWw/E9yrLvnmh5AE7+HWn/?=
 =?us-ascii?Q?GsNmsPcKQjnxwBnadqi6zpY9oQS0onO3LT2SIEs3ELitnstvgNS4zPcQBOOA?=
 =?us-ascii?Q?gULoe4nMMIvkMRExJtBGE7cNFDio9GM7sHZCWESGpL0AKGneoITyz7MCLZhL?=
 =?us-ascii?Q?03HvcUNKPbtFPBI82ruUHasKHy7H2np45OYl7hOZkJkMKQ45R7yu1XJLsg3B?=
 =?us-ascii?Q?SVGsJV3OKCds3W2tozHRWUXd10aEF9zMGTNRU7Ysl8D+I6GK65ydTAvWw8v2?=
 =?us-ascii?Q?YdOPyDQzqNwiep+k8tJVezm/AuL4CNbKxs4ozHRN/cOjtDa1KAuIJ6ZQnp0u?=
 =?us-ascii?Q?mElriZ4Wno85Bs03zJLSXqLNY2xP/brWZaq9fJmn5/nf53EUpMgKvXKTSpMR?=
 =?us-ascii?Q?Dke81d8orar/LexWX19m8vBlMQnVPrDjCaxUDnRm4Hj8XS36Gf/cLKnICZ2j?=
 =?us-ascii?Q?xxVXOs9sJilsbzfd6KjorgmTtBVT21QXO4tIBpCgadC2xrPONREaLMeJivaU?=
 =?us-ascii?Q?+03QY4HtNQqW7Of0TIie6AwnPOf41h1CqAp5CF7xX81PtJC1pENRmlGo7OhW?=
 =?us-ascii?Q?4PFUiFcNWnDLNnCzNfWjbsn6QnJx7UMiTeH61PMrPXBzi7LqrsSla5KrYb1R?=
 =?us-ascii?Q?Vv8ms607C/7W21XWvc4Zh2D17jI2A39JWjUZoDNmpY3iBD7ZZ4c5Z4Le2/TJ?=
 =?us-ascii?Q?tZnOQlFrhRbQqv86mNB9+73FIC6XJ41aMCgboovZkevuudX/gdmAbiGJSBIG?=
 =?us-ascii?Q?8ga9rDlzPUSxJgWGSBAvcqq4KWtOg9QE2JwsDRotQsIfJpK7+Jg1TeEUZs0m?=
 =?us-ascii?Q?ARWDCYg/+n96J2J2Fjo74G3U5Dt4ZMZM6uhFjED6lj5gnl7oQxQC89m866R+?=
 =?us-ascii?Q?4nMAK+jsPg4i3nuBnboRiLUsxF8QoYF98E/C/atQr4qJVB9l0F/DDjlzx9Yw?=
 =?us-ascii?Q?7n5wdb6MdPfJsiTTKIEebC5zks1kyXed65FRg8TknrgLK8AIDNDmGLH/wYvy?=
 =?us-ascii?Q?RTuj6KbASEM+zVpoDdV1SrQHvVA1bagCNOHoO8b80vGigZX/Oba+5wSLBUXu?=
 =?us-ascii?Q?x/kjh/rOBCuZUfxUX2WbkbzKDaq570WJLHaWDfJe2SZTO7izna3KRekrx8cK?=
 =?us-ascii?Q?5zCaQp+pwrY2TrDpwcTxNXZBOLtKuNAuWz5+gap7xQKsFLxDh75fzUDXa4Hs?=
 =?us-ascii?Q?/oCEWL/Oj5dqVNjtuGnd8IIBAcKtIu7Ev0ct7ugn01LCjNVTp/YUpuI9Ay39?=
 =?us-ascii?Q?MegNtWZ6GQJ2cs/562FLFR6/sXphEhblC18mP3UdvS3GnSAYAiCBPEreH/b3?=
 =?us-ascii?Q?nOLyFSJXu35jBiTbsTAX1+v+IqN17zhTKSZ5WdgmLSKVR66CSlxze0gCBSTC?=
 =?us-ascii?Q?2OBm7kUlyut6eroL/3uPl0M1Fae9MvaFgBvcQKI/9l0D+yJaZUd9XpLEyNAd?=
 =?us-ascii?Q?5PHovACHj54CrBjHWbvjsjYb04xP0GHqKfTVDz0dHRPttsz0O9GbR3gaDdo1?=
 =?us-ascii?Q?GJd4Ntb/jbjtlLIyOj8bdR5NXt6b/mPcLfGf5V8B+WrA8DMI07JeK+U2Q5dm?=
 =?us-ascii?Q?91w2wqtQnik/ZNAwBvJdnT8KOODLyE5qnMhpTjpo?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 700930bc-6726-4d53-ecfc-08db503391bf
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 02:17:42.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juIshkydaIhtCtWCsDda4Qtvv49BWiQ+TA7JI1cNmFdiwpKohA78NNapyd4z1Z/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2366
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 08, 2023 at 05:21:20PM -0400, Galen Guyer wrote:
> Suggest loading vhdi_hcd if it's not loaded to make error message less opaque
> 
> Signed-off-by: Galen Guyer <galen@galenguyer.com>

Reviewed-By: Hongren Zheng <i@zenithal.me>

When I was young I usually get confused with this error message.

BTW would you like to make other patches regarding the error generated
when kernel module not loaded? For example, when usbip-host is not
loaded, the error message of usbip bind does not give much help.

$ usbip bind -b 1-6
usbip: error: unable to bind device on 1-6

Another example is that when there is no gadget attached to
the usbip-vudc, the following error messages are not helpful

$ usbipd -e -D
libusbip: error: Cannot read vudc device descr file: No such device

$ usbip list -d
usbip: error: problem getting device attributes: No such device


> ---
>  tools/usb/usbip/src/usbip_attach.c | 2 +-
>  tools/usb/usbip/src/usbip_detach.c | 2 +-
>  tools/usb/usbip/src/usbip_port.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/usb/usbip/src/usbip_attach.c b/tools/usb/usbip/src/usbip_attach.c
> index b4aeb9f1f493..531a415538f9 100644
> --- a/tools/usb/usbip/src/usbip_attach.c
> +++ b/tools/usb/usbip/src/usbip_attach.c
> @@ -86,7 +86,7 @@ static int import_device(int sockfd, struct usbip_usb_device *udev)
>  
>  	rc = usbip_vhci_driver_open();
>  	if (rc < 0) {
> -		err("open vhci_driver");
> +		err("open vhci_driver (is vhci_hcd loaded?)");
>  		goto err_out;
>  	}
>  
> diff --git a/tools/usb/usbip/src/usbip_detach.c b/tools/usb/usbip/src/usbip_detach.c
> index aec993159036..b29101986b5a 100644
> --- a/tools/usb/usbip/src/usbip_detach.c
> +++ b/tools/usb/usbip/src/usbip_detach.c
> @@ -50,7 +50,7 @@ static int detach_port(char *port)
>  
>  	ret = usbip_vhci_driver_open();
>  	if (ret < 0) {
> -		err("open vhci_driver");
> +		err("open vhci_driver (is vhci_hcd loaded?)");
>  		return -1;
>  	}
>  
> diff --git a/tools/usb/usbip/src/usbip_port.c b/tools/usb/usbip/src/usbip_port.c
> index 4d14387df13d..21a20e378419 100644
> --- a/tools/usb/usbip/src/usbip_port.c
> +++ b/tools/usb/usbip/src/usbip_port.c
> @@ -18,7 +18,7 @@ static int list_imported_devices(void)
>  
>  	ret = usbip_vhci_driver_open();
>  	if (ret < 0) {
> -		err("open vhci_driver");
> +		err("open vhci_driver (is vhci_hcd loaded?)");
>  		goto err_names_free;
>  	}
>  
> -- 
> 2.40.1
> 
