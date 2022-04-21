Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4BB45099F4
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 09:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386260AbiDUH5S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 03:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386258AbiDUH5Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 03:57:16 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF3611172
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 00:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650527667; x=1682063667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EwW/bGZQN14mRm1WFKCe+6xQ0qE/EFHA6x4UarSP1MM=;
  b=cTrqAPhA7P4x+B1bAxqF3opoo8PIhUn9oJ92xdnXuMoRJvOkeQIeQ9Qm
   zwmLUfwsvtzCBVMApuSAMQ78m77cJgxXspMr6ZlNaM5XcEpTK2odC39r/
   3ksc/8Ze4A7/jBN3zTGILDvbKEh6aYLgpIR/c2Be+S4F3HB7kcqZwiilH
   C8Nt7j5nHCb8bCxmWOcP9YVOSXNVme7SUgbl7sTwHypycFT9qUvsg81x1
   LswHzKgndovhF15DZ9YOQNkbKf7l/D/59gPCe/NB6w3zPaP2k/qQLLI14
   GyCA6/4RFxevtdCK2krXtK0Ns0TlM2aq0Q/f8Ggli0ymaxWluaBYocQYU
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="244205054"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="244205054"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 00:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="702983097"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Apr 2022 00:54:25 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 21 Apr 2022 10:54:24 +0300
Date:   Thu, 21 Apr 2022 10:54:24 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: Re: [PATCH v3 4/4] usb: typec: ucsi: retry find role swithch when
 module load late
Message-ID: <YmENsCn6q3dcCMNq@kuha.fi.intel.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-5-git-send-email-quic_linyyuan@quicinc.com>
 <YlbEm31fOaMsFW6C@kuha.fi.intel.com>
 <DM8PR02MB8198A080766C934496479FE2E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <DM8PR02MB81981200B7B2E422CA7248D6E3F49@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB81981200B7B2E422CA7248D6E3F49@DM8PR02MB8198.namprd02.prod.outlook.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Apr 21, 2022 at 07:40:56AM +0000, Linyu Yuan (QUIC) wrote:
> > > >  static void ucsi_init_work(struct work_struct *work)
> > > >  {
> > > > -	struct ucsi *ucsi = container_of(work, struct ucsi, work);
> > > > +	struct ucsi *ucsi = container_of(work, struct ucsi, work.work);
> > > >  	int ret;
> > > >
> > > >  	ret = ucsi_init(ucsi);
> > > >  	if (ret)
> > > >  		dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
> > > > +
> > > > +
> > >
> > > Extra line.
> > >
> > > > +	if (ret == -EPROBE_DEFER)
> > > > +		queue_delayed_work(system_long_wq, &ucsi->work,
> > > HZ/10);
> > >
> > > You have to stop queueing that eventually. You need a counter.
> > >
> > > I'm still not sure why do you want to queue this same work again and
> > > again? Why not just call ucsi_init() in a loop?
> > 
> > Will follow your suggestion below.
> > 
> > >
> > >         int my_counter = 1000;
> > So you prefer 10 second in total ?
> > If so, next version, I will change it to 500, as msleep(20), check next.
> > >
> > >         while (ucsi_init(ucsi) == -EPROBE_DEFER && my_counter--)
> > >                 msleep(10);
> > In checkpatch.pl, it suggest msleep no less than 20ms each time.
> > msleep(20) ?
> > 
> > >
> > > >  }
> > 
> > Great idea, it will be less code change.
> 
> 
> Sorry, I think there is one concern of your suggestion is that
> As the while loop inside the worker, if we can this worker,
> It may spent too much time.
> 
> Although my original design is crazy(queue worker again inside it),
> but it allow cancel worker wait short time.
> 
> please let me know what is your suggestion now.

OK, that's a good point. So just re-schedule the work like you do.

thanks,

-- 
heikki
