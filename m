Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316574009FA
	for <lists+linux-usb@lfdr.de>; Sat,  4 Sep 2021 08:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhIDGJW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Sep 2021 02:09:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:60234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229741AbhIDGJV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Sep 2021 02:09:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0B3760FDC;
        Sat,  4 Sep 2021 06:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630735700;
        bh=0fwqkHyZcSnt/e9EOmlbkIIfR5WNXw2a7/2q2nRCinY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ff/OIHrkXy2AhMUH7GYNBT5WfmVT+ZuXdf+4GsaiOQCtP2t1BHpwOwKYXBM7fORp2
         sA2EMvl9WqyKvR/bYjVIsFHFFoVSFltKqpEgej37HgyXIY65c6UCuVUe9w8UP/qV4M
         emZMseDuazOG2Dj9zFZW/xivtjr31QVpH8aKCkPM=
Date:   Sat, 4 Sep 2021 08:08:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Shantur Rathore <shantur.rathore@gmail.com>
Cc:     felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [BUG REPORT] usb: dwc3: Bug - last endpoint is wrong direction
Message-ID: <YTMNUQ70rhzKdPZA@kroah.com>
References: <CAHc5_t3R8uiYaKe__Wc+1FHvyH4=yS7OVBcdOUsXKet44LK8zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc5_t3R8uiYaKe__Wc+1FHvyH4=yS7OVBcdOUsXKet44LK8zA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 03, 2021 at 07:23:20PM +0100, Shantur Rathore wrote:
> Hi,
> 
> I am running dwc3 in peripheral mode for emulating a composite device.
> Details are
> 
> Kernel version - Latest mainline master and 5.14
> SoC - Rockchip RK3399
> SBC - RockPro64
> 
> Bug info :
> In RK3399 as per documentation (
> https://usermanual.wiki/Document/RockchipDeveloperGuidelinux44USB.31610806/view
> ), there are 7 Input Endpoints and 6 Output endpoints, in total 13
> endpoints.
> 
> Currently in dwc3/gadget.c driver, it uses the number of endpoints
> available and starts setting them up with even endpoints as output
> endpoints and odd numbered as even endpoints. This leads to 7 Output
> endpoints and 6 input endpoints for RK3399.
> 
> If you try to create a composite gadget which uses all the input
> endpoints, one can see the issue. You just need to create functions to
> use up the last input ep and it would fail to create. No need to
> connect it to the host.
> This was confirmed when running a rockchip-linux bsp image.
> 
> [root@rockpro rock]# ls /sys/kernel/debug/usb/fe800000.usb/
> ep0in  ep0out  ep1in  ep1out  ep2in  ep2out  ep3in  ep3out  ep4in
> ep4out  ep5in  ep5out  ep6in  link_state  lsp_dump  mode  regdump
> testmode
> 
> Currently in linux mainline it is
> 
> [root@rockpro rock]# ls /sys/kernel/debug/usb/fe800000.usb/
> ep0in  ep0out  ep1in  ep1out  ep2in  ep2out  ep3in  ep3out  ep4in
> ep4out  ep5in  ep5out  ep6out  link_state  lsp_dump  mode  regdump
> testmode
> 
> ep6 being out instead of in as per the hardware spec.
> 
> Upon investigation of rockchip bsp kernel,
> 
> https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/usb/dwc3/gadget.c#L2023
> 
> The issue was clear, currently, dwc3/gadget driver doesn't take
> DWC3_NUM_IN_EPS into consideration while enumerating them.
> 
> The patch below fixes the issue and ep6 is correctly enumerated as input.
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 01866dcb953b..279c9a97cb8c 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -555,6 +555,7 @@ static void dwc3_core_num_eps(struct dwc3 *dwc)
>   struct dwc3_hwparams *parms = &dwc->hwparams;
> 
>   dwc->num_eps = DWC3_NUM_EPS(parms);
> + dwc->num_in_eps = DWC3_NUM_IN_EPS(parms);
>  }
> 
>  static void dwc3_cache_hwparams(struct dwc3 *dwc)
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 5612bfdf37da..89a0998c618c 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1227,6 +1227,7 @@ struct dwc3 {
>   u8 speed;
> 
>   u8 num_eps;
> + u8 num_in_eps;
> 
>   struct dwc3_hwparams hwparams;
>   struct debugfs_regset32 *regset;
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 804b50548163..d9d19dc0a29f 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -693,9 +693,11 @@ void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
> 
>   dwc->last_fifo_depth = fifo_depth;
>   /* Clear existing TXFIFO for all IN eps except ep0 */
> - for (num = 3; num < min_t(int, dwc->num_eps, DWC3_ENDPOINTS_NUM);
> -      num += 2) {
> + for (num = 3; num < DWC3_ENDPOINTS_NUM; num += 2) {
>   dep = dwc->eps[num];
> +
> + if(!dep)
> + continue;
>   /* Don't change TXFRAMNUM on usb31 version */
>   size = DWC3_IP_IS(DWC3) ? 0 :
>   dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
> @@ -2257,7 +2259,7 @@ static void dwc3_stop_active_transfers(struct dwc3 *dwc)
>  {
>   u32 epnum;
> 
> - for (epnum = 2; epnum < dwc->num_eps; epnum++) {
> + for (epnum = 2; epnum < DWC3_ENDPOINTS_NUM; epnum++) {
>   struct dwc3_ep *dep;
> 
>   dep = dwc->eps[epnum];
> @@ -2960,10 +2962,9 @@ static int dwc3_gadget_init_out_endpoint(struct
> dwc3_ep *dep)
>   return dwc3_alloc_trb_pool(dep);
>  }
> 
> -static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
> +static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum, bool
> direction)
>  {
>   struct dwc3_ep *dep;
> - bool direction = epnum & 1;
>   int ret;
>   u8 num = epnum >> 1;
> 
> @@ -3011,21 +3012,30 @@ static int dwc3_gadget_init_endpoint(struct
> dwc3 *dwc, u8 epnum)
>   return 0;
>  }
> 
> -static int dwc3_gadget_init_endpoints(struct dwc3 *dwc, u8 total)
> +static int dwc3_gadget_init_endpoints(struct dwc3 *dwc, u8 total, u8
> num_in_eps)
>  {
> - u8 epnum;
> + u8 num;
> + int ret;
> 
>   INIT_LIST_HEAD(&dwc->gadget->ep_list);
> 
> - for (epnum = 0; epnum < total; epnum++) {
> - int ret;
> + /* init input endpoints as reported by hw */
> +        for (num = 0; num < num_in_eps; num++) {
> 
> - ret = dwc3_gadget_init_endpoint(dwc, epnum);
> - if (ret)
> - return ret;
> - }
> +                ret = dwc3_gadget_init_endpoint(dwc, (num << 1) + 1, 1);
> +                if (ret)
> +                        return ret;
> +        }
> 
> - return 0;
> +        /* init rest endpoints as output endpoints */
> +        for (num = 0; num < total - num_in_eps; num++) {
> +
> +                ret = dwc3_gadget_init_endpoint(dwc, num << 1, 0);
> +                if (ret)
> +                        return ret;
> +        }
> +
> + return ret;
>  }
> 
>  static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
> @@ -4282,7 +4292,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>   * sure we're starting from a well known location.
>   */
> 
> - ret = dwc3_gadget_init_endpoints(dwc, dwc->num_eps);
> + ret = dwc3_gadget_init_endpoints(dwc, dwc->num_eps, dwc->num_in_eps);
>   if (ret)
>   goto err4;
> 
> 
> This fixes the ep6 direction and now I can create a simple composite
> gadget that uses all in endpoints but the last function ( the one that
> uses ep6in ) just doesn't work.
> 
> Sample script to bring up this issue
> 
> mkdir /sys/kernel/config/usb_gadget/g1
> # cd to its configfs node
> cd /sys/kernel/config/usb_gadget/g1
> # configure it (vid/pid can be anything if USB Class is used for driver compat)
> echo 0xabcd > idVendor
> echo 0x1234 > idProduct
> # configure its serial/mfg/product
> mkdir strings/0x409
> echo myserial > strings/0x409/serialnumber
> echo mymfg > strings/0x409/manufacturer
> echo myproduct > strings/0x409/product
> # create configs
> mkdir configs/c.1
> #mkdir configs/c.2
> #mkdir configs/c.3
> # configure them with attributes if needed
> echo 120 > configs/c.1/MaxPower
> #echo 120 > configs/c.2/MaxPower
> #echo 120 > configs/c.2/MaxPower
> # ensure function is loaded
> #modprobe usb_f_mass_storage
> 
> function create_msd {
>   dd bs=1M count=16 if=/dev/zero of=/tmp/d$1.img # 16MB
>   mkdir functions/mass_storage.$1
>   # mkdir functions/mass_storage.$1/lun.0
>   echo /tmp/d$1.img > functions/mass_storage.$1/lun.0/file
>   ln -s functions/mass_storage.$1 configs/c.1
> }
> 
> function create_ncm {
>   mkdir functions/ncm.usb$1
>   ln -s functions/ncm.usb$1 configs/c.1
> }
> 
> create_msd 0
> create_msd 1
> create_msd 2
> create_msd 3
> create_ncm 0 # NCM uses 2 input ep's
> #create_msd 4
> #create_msd 5
> 
> # enable gadget by binding it to a UDC from /sys/class/udc
> ls /sys/class/udc/ > UDC
> 
> Any pointers on what I should be looking for and might be missing.
> 
> Kind regards,
> Shantur

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
