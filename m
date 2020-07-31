Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1372C233F4B
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 08:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731436AbgGaGo0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 02:44:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:55202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731224AbgGaGoY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 02:44:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CF28207F5;
        Fri, 31 Jul 2020 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596177862;
        bh=VoWIbr12cLn+M9EERi4T3nwBVg+le+rIf7e1szxEnuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UIghgX6ldHsdkjM4+0Y+iFxmju9nu1xZpNnzRp/wa7sOwcK2vfqTWdwL9A2W0k7Ze
         9DJIeLPBSGYnM621Wke2JrMS2cz+xjUYBc+IESklckyiCRFzEqTHjChPBAHoh6Ez1m
         htT5U9RnWMlyZNtzmylrFTifbly3ECZEhiBx4IPY=
Date:   Fri, 31 Jul 2020 08:44:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yasushi Asano <yazzep@gmail.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        erosca@de.adit-jv.com, andrew_gabbasov@mentor.com,
        jim_baxter@mentor.com, wnatsume@jp.adit-jv.com,
        nnishiguchi@jp.adit-jv.com, yasano@jp.adit-jv.com
Subject: Re: [PATCH] [RFC] USB: hub.c: Add the retry count module parameter
 for usbcore
Message-ID: <20200731064410.GG1508201@kroah.com>
References: <20200730104226.3537-1-yazzep@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200730104226.3537-1-yazzep@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 30, 2020 at 07:42:26PM +0900, Yasushi Asano wrote:
> From: Yasushi Asano <yasano@jp.adit-jv.com>
> 
> Dear Alan
> Dear Greg
> 
> I would like to have a consultation with you. The customer's product
> board needs to get a USB certification and compliance, but it can not
> pass the test using the current USB hub driver. According to the USB
> compliance plan[1], the“6.7.22 Device No Response” test requires the
> detection of device enumeration failure within 30 seconds. The
> kernel(USB hub driver) must notify userspace of the enumeration failure
> within 30 seconds.

Odd, we have passed the USB certification tests in the past, what
changed recently to cause this?

> In the current hub driver, the place to detect device enumeration
> failure is [2]. I have modified the hub driver to issue a uevent here,
> but the procedure of device enumeration (new_scheme+old_scheme) takes
> too long to execute, it couldn't reach [2] within 30 seconds after
> starting the test.  According to the result of PETtool [3], the state of
> "Device No response" is that usb_control_msg(USB_REQ_GET_DESCRIPTOR) [4]
> in hub_port_initn times out. That means r == -ETIMEDOUT.  because of the
> default setting of initial_descriptor_timeout is 5000 msec[5],
> usb_control_msg() took 5000msec until -ETIMEDOUT.
> 
> I will try to describe the flow of device enumeration processing
> below[6].  If my understanding is correct, the enumeration failure [2]
> will be reached after performing all the loops of [7][8][9]+[7][10].  In
> the new scheme, 12 times check will be performed ([7]/2*[8]*[9] => 2*2*3
> => 12).  In the old scheme , 4 times check will be performed ([7]/2*[10]
> => 2*2 => 4).  In total, it checks 16 times, and it took 5000msec to
> ETIMEDOUT every time. Therefore, It takes about 80 seconds(16*5000msec)
> to reach [2]. This does not pass the "Device No response" test.
> 
> If I set the module parameter old_schene_first=Y and use_both_schemes=N,
> it can be reached [2] within 30 seconds. However, the new_scheme will no
> longer be performed. I think we can't choose this, as
> previously-detected devices may become undetectable.  new_scheme is
> taking too long and I think 12 times checks are redundant. So, I
> confirmed the USB specification.
> 
> This is the only description of the read of the device descriptor[12].
> I couldn't find the description related retry count or timing here and
> anywhere in this specification.  And I couldn't find the description
> related timing in the “No silent failures" requirements in other
> documents[13] also.
> 
> Because I'm not sure where this number of loop count is decided, I'm not
> sure how should it be modified the driver to pass the USB compliance
> test. Is it possible for me to receive a proposal for a solution?  As my
> thought, the number of loops may be redundant, so I think if the user
> can change it arbitrarily, the problem will be solved. Currently, the
> timeout value can be adjusted with a module parameter, but the loop
> count cannot. Is there any problem if it is changed like this patch?
> The original handling of the driver is unchanged by this modification. I
> think the user will be able to adjust the time to enumeration failure
> freely. Is this patch acceptable? I would appreciate it much if I could
> receive the feedback from you.
> 
> ----------------------------------------------------------------------------------------------------------------------------------------
> [1] https://www.usb.org/sites/default/files/otgeh_compliance_plan_1_2.pdf
> 6.7.22 A-UUT “Device No Response” for connection timeout
> 6.7.22.2 Test Procedure for A-UUT which does not support sessions
>    - 5. If operator clicks OK before 30s elapses since VBUS went on, then UUT passes test.
>    - 6. If 30s elapses first, then UUT fails test.
> ----------------------------------------------------------------------------------------------------------------------------------------
> [2] hub_port_connect()
> 
>         if (hub->hdev->parent ||
>                         !hcd->driver->port_handed_over ||
>                         !(hcd->driver->port_handed_over)(hcd, port1)) {
>                 if (status != -ENOTCONN && status != -ENODEV)
>                         dev_err(&port_dev->dev,
>                                         "unable to enumerate USB device\n");
>         }
> ----------------------------------------------------------------------------------------------------------------------------------------
> [3] http://www.mqp.com/usbcomp.htm
> ----------------------------------------------------------------------------------------------------------------------------------------
> [4] hub_port_init()
> 
>   r = usb_control_msg(udev, usb_rcvaddr0pipe(),
>           USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
>           USB_DT_DEVICE << 8, 0,
>           buf, GET_DESCRIPTOR_BUFSIZE,
>           initial_descriptor_timeout);
> ----------------------------------------------------------------------------------------------------------------------------------------
> [5]
> static int initial_descriptor_timeout = USB_CTRL_GET_TIMEOUT;
> include/linux/usb.h:#define USB_CTRL_GET_TIMEOUT        5000
> ----------------------------------------------------------------------------------------------------------------------------------------
> [6] The flow of device enumeration processing
> drivers/usb/core/hub.c
> 
> hub_port_connect(){
>        for (x = 0; x < SET_CONFIG_TRIES; x++) {                  ...[7] SET_CONFIG_TRIES is 4 as default setting
>                hub_port_init(){
>                        if( x < 2 ) {
>                              ------ new scheme ------
>                              for ( y= 0; y < 2; ++y ) {          ...[8] 2==GET_DESCRIPTOR_TRIES
>                                     for ( z = 0; z < 3; ++z ) {  ...[9]
>                                            usb_control_msg()     ...[3] ETIMEDOUT(-110) is detected. Timieout value=5000msec.
>                                     }
>                              }
>                        }
>                        else {
>                              ------ old scheme ------
>                              for ( y= 0; y < 2; ++y ) {          ...[10] 2==SET_ADDRESS_TRIES
>                                     hub_set_address()            ...[11] ETIMEDOUT(-110) is detected. Timieout value=5000msec.
>                              }
>                        }
>                }
>        }
>        unable to enumerate USB device.                           ...[2]
> }
> ----------------------------------------------------------------------------------------------------------------------------------------
> [12] https://www.usb.org/document-library/usb-20-specification
> Universal Serial Bus Specification (usb_20.pdf)
> 9.1.2 Bus Enumeration
> 6. Before the USB device receives a unique address, its Default Control Pipe is still accessible via the default address.
>    The host reads the device descriptor to determine what actual maximum data payload size this USB device's default pipe can use.
> ----------------------------------------------------------------------------------------------------------------------------------------
> [13] https://www.usb.org/document-library/usb-20-specification
> On-The-Go and Embedded Host Supplement to the USB Revision 2.0 Specification (USB_OTG_and_EH_2-0-version 1_1a.pdf)
> 3.5 No Silent Failures
> ----------------------------------------------------------------------------------------------------------------------------------------
> 
> Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
> ---
>  drivers/usb/core/hub.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 052d5ac..01c2b2d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -99,6 +99,18 @@ MODULE_PARM_DESC(use_both_schemes,
>  		"try the other device initialization scheme if the "
>  		"first one fails");
>  
> +static int get_descriptor_tries = 2;
> +module_param(get_descriptor_tries, int, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(get_descriptor_tries,
> +		"The number of a 64-byte GET_DESCRIPTOR request tries "
> +		"(default 2)");
> +
> +static int get_descriptor_operations = 3;
> +module_param(get_descriptor_operations, int, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(get_descriptor_operations,
> +		"The number of a 64-byte GET_DESCRIPTOR operation "
> +		"(default 3)");
> +
>  /* Mutual exclusion for EHCI CF initialization.  This interferes with
>   * port reset on some companion controllers.
>   */
> @@ -2707,7 +2719,8 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
>  
>  #define PORT_RESET_TRIES	5
>  #define SET_ADDRESS_TRIES	2
> -#define GET_DESCRIPTOR_TRIES	2
> +#define GET_DESCRIPTOR_TRIES	get_descriptor_tries
> +#define GET_DESCRIPTOR_OPERATIONS	get_descriptor_operations

No need for these defines now that you have a variable being used,
right?

>  #define SET_CONFIG_TRIES	(2 * (use_both_schemes + 1))
>  #define USE_NEW_SCHEME(i, scheme)	((i) / 2 == (int)(scheme))
>  
> @@ -4684,7 +4697,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  			 * 255 is for WUSB devices, we actually need to use
>  			 * 512 (WUSB1.0[4.8.1]).
>  			 */
> -			for (operations = 0; operations < 3; ++operations) {
> +			for (operations = 0; operations < GET_DESCRIPTOR_OPERATIONS; ++operations) {

module parameters are not ok, they work for all devices/hubs in the
system, and no one knows how to change them or not.

Any other way we can "just always do it correctly" here?

thanks,

greg k-h
