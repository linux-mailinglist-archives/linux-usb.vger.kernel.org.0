Return-Path: <linux-usb+bounces-330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA47A4DA6
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 17:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4833A282040
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 15:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BAF21356;
	Mon, 18 Sep 2023 15:53:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5424C1F5FC
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 15:53:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6643B181;
	Mon, 18 Sep 2023 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695052224; x=1726588224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xr3ErG/3C/k09P/afb6l+WA5Q8mj/h/a9S6JzmHJ34E=;
  b=f23oVaHlxKdj06pJ7Qq6RGiNnC0xPfNboIXfuc8URQ1CHN99ydxmPYK8
   W9Q9ItCuLKSy4OIx+MQStYBdUIJmr2/B0xAkQcNgDSjKdK7b0pq9l+3sV
   5j53N9R9SkEAVqzQxQ2W7lE0EOvFLms6MBJoknMhIpqOsrrvjm95EyIe2
   xSbD0awlj8IIq5lWBGEwxsnFH+IpHBKMDK5eeBkMwMncFhd8VZIQWuFGF
   Nf4xyFIzW7uVUJCdmIAFLD5nqw0XRUohveUX7a/HAkAIkuPB7I2ifc6P5
   byz0bYSzqpAd1jP4w/Enx5C+P6QJJPH54ilH9sRb1JuLwfVmmCK88UjHH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359088455"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="359088455"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 07:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="780902488"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="780902488"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga001.jf.intel.com with SMTP; 18 Sep 2023 07:25:23 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Sep 2023 17:25:22 +0300
Date: Mon, 18 Sep 2023 17:25:22 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashanth K <quic_prashk@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	"# 5 . 16" <stable@vger.kernel.org>
Subject: Re: usb: typec: ucsi: Clear EVENT_PENDING bit if ucsi_send_command
 fails
Message-ID: <ZQhd0qic2wGvCoUo@kuha.fi.intel.com>
References: <1694423055-8440-1-git-send-email-quic_prashk@quicinc.com>
 <ZP8M6zqgsLTK25PI@kuha.fi.intel.com>
 <21d247d3-83be-ba53-c982-2ab0e2e4ffb3@quicinc.com>
 <ZQROzNqr7fbmJC87@kuha.fi.intel.com>
 <4e876097-aed1-2b0d-ecb4-6434add4ef26@quicinc.com>
 <ZQRi20nC0j5c4LGI@kuha.fi.intel.com>
 <d0c27255-fcd2-39ed-f7af-b3b79d965ddf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0c27255-fcd2-39ed-f7af-b3b79d965ddf@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 16, 2023 at 01:58:30PM +0530, Prashanth K wrote:
> 
> 
> On 15-09-23 07:27 pm, Heikki Krogerus wrote:
> > Hi Prashanth,
> > 
> > On Fri, Sep 15, 2023 at 07:10:25PM +0530, Prashanth K wrote:
> > > On 15-09-23 06:02 pm, Heikki Krogerus wrote:
> > > > On Tue, Sep 12, 2023 at 04:37:47PM +0530, Prashanth K wrote:
> > > > > 
> > > > > 
> > > > > On 11-09-23 06:19 pm, Heikki Krogerus wrote:
> > > > > > On Mon, Sep 11, 2023 at 02:34:15PM +0530, Prashanth K wrote:
> > > > > > > Currently if ucsi_send_command() fails, then we bail out without
> > > > > > > clearing EVENT_PENDING flag. So when the next connector change
> > > > > > > event comes, ucsi_connector_change() won't queue the con->work,
> > > > > > > because of which none of the new events will be processed.
> > > > > > > 
> > > > > > > Fix this by clearing EVENT_PENDING flag if ucsi_send_command()
> > > > > > > fails.
> > > > > > > 
> > > > > > > Cc: <stable@vger.kernel.org> # 5.16
> > > > > > > Fixes: 512df95b9432 ("usb: typec: ucsi: Better fix for missing unplug events issue")
> > > > > > > Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
> > > > > > > ---
> > > > > > >     drivers/usb/typec/ucsi/ucsi.c | 1 +
> > > > > > >     1 file changed, 1 insertion(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > > > > > index c6dfe3d..509c67c 100644
> > > > > > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > > > > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > > > > > @@ -884,6 +884,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
> > > > > > >     	if (ret < 0) {
> > > > > > >     		dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\n",
> > > > > > >     			__func__, ret);
> > > > > > > +		clear_bit(EVENT_PENDING, &con->ucsi->flags);
> > > > > > >     		goto out_unlock;
> > > > > > >     	}
> > > > > > 
> > > > > > I think it would be better to just move that label (out_unlock) above
> > > > > > the point where clear_bit() is already called instead of separately
> > > > > > calling it like that. That way the Connector Change Event will
> > > > > > also get acknowledged.
> > > > > Do we really need to ACK in this case since we didn't process the current
> > > > > connector change event
> > > > 
> > > > You won't get the next event before the first one was ACK'd, right?
> > > > 
> > > 
> > > The spec says that we need to ACK if we received AND processed a CCI
> > > 
> > > "4.5.4 Acknowledge Command Completion and/or Change Indication (R)
> > > This command is used to acknowledge to the PPM that the OPM received and
> > > processed a Command Completion and/or a Connector Change Indication."
> > > 
> > > And here in this case, we have received, but not processed the event.
> > > So I'm not really sure what to do here in this case. If we don't send an
> > > ACK, then would the PPM think that OPM is not responding and reset it?
> > > OR would it resend the previous event again since we didn't ACK?
> > 
> > Every PPM behaves differently.
> > 
> > Did you actually see that happening - GET_CONNECTOR_STATUS failed? Can
> > you reproduce it?
> > 
> 
> Yea we actually hit the issue once where GET_CONNECTOR_STATUS failed and
> subsequent events didn't get queued since EVENT_PENDING wasn't cleared. Its
> not easily reproducible (<1%) though.
> 
> [4948:kworker/0:3]UCSI: ucsi_qti_glink_write: timed out
> [4948:kworker/0:3]ucsi_glink soc:qcom,pmic_glink:qcom,ucsi:
> ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)

Okay. It would be really interesting to know why is it failing.
But let's just go with this for now.

thanks,

-- 
heikki

