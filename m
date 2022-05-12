Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABED95241F3
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 03:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348360AbiELBUB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 21:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239622AbiELBT7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 21:19:59 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5EDB586AC1
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 18:19:58 -0700 (PDT)
Received: (qmail 216466 invoked by uid 1000); 11 May 2022 21:19:57 -0400
Date:   Wed, 11 May 2022 21:19:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: hub: port: add sysfs entry to switch port power
Message-ID: <YnxgvcOIVMWhDbi9@rowland.harvard.edu>
References: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
 <YnvDlhlcVGoerhLz@rowland.harvard.edu>
 <20220511203727.GG27481@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511203727.GG27481@pengutronix.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 11, 2022 at 10:37:27PM +0200, Michael Grzeschik wrote:
> Hi!
> 
> On Wed, May 11, 2022 at 10:09:26AM -0400, Alan Stern wrote:
> > On Wed, May 11, 2022 at 01:13:17AM +0200, Michael Grzeschik wrote:
> > > This patch adds an sysfs switch to enable/disable a port on an power
> > > switchable hub. It also ensures that the associated device gets
> > > disconnected from the logical usb tree.
> > 
> > This says what the patch does.  It does not explain why the patch was
> > written or why anybody would want to switch the power on a hub's port.
> 
> Good point. This goes together with the missing ABI documentation.
> I will fix it in the v2.
> 
> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > > ---
> > >  drivers/usb/core/port.c | 47 +++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 47 insertions(+)
> > > 
> > > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > > index d5bc36ca5b1f77..abc618d87888f3 100644
> > > --- a/drivers/usb/core/port.c
> > > +++ b/drivers/usb/core/port.c
> > > @@ -17,6 +17,52 @@ static int usb_port_block_power_off;
> > > 
> > >  static const struct attribute_group *port_dev_group[];
> > > 
> > > +static ssize_t port_power_store(struct device *dev, struct device_attribute *attr,
> > > +			    const char *buf, size_t count)
> > > +{
> > > +	struct usb_port *port_dev = to_usb_port(dev);
> > > +	struct usb_device *udev = port_dev->child;
> > > +	struct usb_device *hdev = to_usb_device(dev->parent->parent);
> > > +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> > > +	int port1 = port_dev->portnum;
> > > +	bool value;
> > > +	int rc = 0;
> > > +
> > > +	if (!hub)
> > > +		return -EINVAL;
> > > +
> > > +	if (hub->in_reset)
> > > +		return -EBUSY;
> > 
> > What point is there in doing this test?  The value of hub->in_reset may
> > change an instant later.  Unless you acquire the hub's lock first.
> > For that matter, you should be holding the hub's lock while you call
> > usb_hub_to_struct_hub() -- unless you don't care if the hub gets
> > disconnected while this routine is running.  Or if udev does.
> 
> I could remove it for the sake of simplicity in the first version.
> If this will matter in the future we can add it then.
> 
> > > +
> > > +	rc = strtobool(buf, &value);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	if (value)
> > > +		usb_remote_wakeup(hdev);
> > 
> > Why call usb_remote_wakeup()?  The function was not intended to be used
> > this way; it was meant to be used when a device sends a wakeup request.
> 
> I found this function was called when plugging in a device into an
> suspended hub. So it seemed to be the right thing to do.

That's because the hub sent a remote wakeup signal when the device was 
plugged in.  In your case there is no remote wakeup signal.

> > Furthermore, nothing prevents the hub from going back into runtime
> > suspend the moment this function completes.
> 
> OK. That needs to be locked than.
> 
> Is it with usb_autopm_get_interface and usb_autopm_put_interface?

Yes.  Read the kerneldoc for those routines.

> > If you want to bring a USB device out of runtime suspend, call
> > usb_autoresume_device().  And then don't forget to call
> > usb_autosuspend_device() when you're done with it.
> 
> In case the hub had only one device attached to one one port. When I
> called this sysfs function on that port, the hub would suspend
> afterwards. Which is probably a correct way to go for a hub with
> no active devices attached.
> 
> When replacing usb_remote_wakeup with usb_autoresume_device this
> works exactly the same. So I will replace it in v2.
> 
> The extra usb_autosuspend_device for the hub is probably not necessary.

If you don't call usb_autosuspend_device after doing 
usb_autoresume_device then the hub will never go into runtime suspend.

> > > +	rc = usb_hub_set_port_power(hdev, hub, port1, value);
> > > +	if (rc)
> > > +		return rc;
> > 
> > You probably should acquire the port's lock before doing this.
> > Otherwise some other thread might be doing something else to the port at
> > the same time.
> 
> Yes. I will do that in v2.
> 
> > > +
> > > +	if (!value) {
> > > +		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
> > > +		if (!port_dev->is_superspeed)
> > > +			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
> > > +
> > > +		if (udev) {
> > > +			port_dev->child = NULL;
> > 
> > That assignment is not necessary; usb_disconnect() will take care of it.
> 
> Here are two things that are in play.
> 
> First I have to set port_dev->child = NULL before calling
> usb_disconnect. Otherwise the following automatic hub_suspend call (in
> case this was the last operational port of the hub) will print the
> message "device x-y not suspended yet" and will fail the hub to
> suspend.
> 
> When calling usb_autoresume_device(udev) instead and before calling
> usb_disconnect, this is no longer the case. The hub will be succesfully
> suspended.
> 
> The second thing is the assignment. I still have to explicitly assign NULL to
> port_dev->child. Otherwise a following enable of this port via this sysfs will
> run into an hub_event with the usb_disonnect for the device on that port. But
> this will spit out a ugly traceback leading with the following error:
> 
> [   21.718574] usb 2-1.1: USB disconnect, device number -1
> 
> [   21.719100] Unable to handle kernel paging request at virtual address 96d628cc24e2e078
> [   21.719807] Mem abort info:
> [   21.720065]   ESR = 0x96000044
> [   21.720348]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   21.720827]   SET = 0, FnV = 0
> [   21.721109]   EA = 0, S1PTW = 0
> [   21.721447]   FSC = 0x04: level 0 translation fault
> [   21.721891] Data abort info:
> [   21.722157]   ISV = 0, ISS = 0x00000044
> [   21.722505]   CM = 0, WnR = 1
> [   21.722779] [96d628cc24e2e078] address between user and kernel address ranges
> [   21.723429] Internal error: Oops: 96000044 [#1] PREEMPT SMP
> [   21.723927] Modules linked in: uio_pdrv_genirq fuse
> [   21.724380] CPU: 0 PID: 58 Comm: kworker/0:3 Not tainted 5.18.0-rc6+ #93
> [   21.724977] Hardware name: Radxa ROCK3 Model A (DT)
> [   21.725412] Workqueue: usb_hub_wq hub_event
> [   21.725802] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   21.726419] pc : usb_disable_endpoint+0x7c/0xdc
> [   21.726832] lr : usb_disable_device_endpoints+0xbc/0xe0
> [   21.727301] sp : ffffffc009b33b30
> [   21.727597] x29: ffffffc009b33b30 x28: ffffff8003ad4ed8 x27: 0000000000000001
> [   21.728239] x26: ffffff8004344928 x25: 0000000000000000 x24: ffffffc0096eb8e0
> [   21.728885] x23: ffffff80043448a8 x22: ffffff8003961800 x21: 0000000000000001
> [   21.729527] x20: 96d628cc24e2e034 x19: ffffff8004344800 x18: ffffffffffffffff
> [   21.730168] x17: 0000000000000001 x16: 0000000000000001 x15: ffffffc089b33857
> [   21.730810] x14: 0000000000000000 x13: 312d207265626d75 x12: 6e20656369766564
> [   21.731452] x11: 00000000fffff7ff x10: 00000000fffff7ff x9 : ffffffc00871b8dc
> [   21.732093] x8 : 000000000000bfe8 x7 : ffffffc009b33a38 x6 : 0000000000000001
> [   21.732733] x5 : ffffffc009569000 x4 : ffffffc009569050 x3 : ffffff8004344878
> [   21.733374] x2 : 0000000000000001 x1 : 000000000000008f x0 : 0000000000000001
> [   21.734015] Call trace:
> [   21.734235]  usb_disable_endpoint+0x7c/0xdc
> [   21.734616]  usb_disable_device_endpoints+0xbc/0xe0
> [   21.735054]  usb_disable_device+0x1c0/0x260
> [   21.735432]  usb_disconnect+0x108/0x300
> [   21.735778]  hub_event+0x1378/0x19c0
> [   21.736102]  process_one_work+0x220/0x49c
> [   21.736469]  worker_thread+0x154/0x450
> [   21.736810]  kthread+0xfc/0x110
> [   21.737096]  ret_from_fork+0x10/0x20
> [   21.737429] Code: f941c474 340001e0 f901c47f b4ffff14 (b900469f)
> [   21.737970] ---[ end trace 0000000000000000 ]---
> 
> Did I miss something?

No: You found a real bug in the hub driver!  usb_disconnect() really 
is supposed to set port_dev->child to NULL at some point, but it 
doesn't.  In fact, port_dev->child never gets set back to NULL (except 
in the trivial case where a newly attached device fails to initialize 
and enumerate).

I'll work on a patch to fix this, and I'll CC: you when it's ready.

Alan Stern
