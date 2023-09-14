Return-Path: <linux-usb+bounces-19-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A910479F7DB
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 04:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3529CB2079C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 02:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB2717F4;
	Thu, 14 Sep 2023 02:16:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E81BA38
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 02:16:59 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 8CEAF1BCB
	for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 19:16:58 -0700 (PDT)
Received: (qmail 976896 invoked by uid 1000); 13 Sep 2023 22:16:56 -0400
Date: Wed, 13 Sep 2023 22:16:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
  Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
  Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
  Chunfeng Yun <chunfeng.yun@mediatek.com>,
  Neal Liu <neal_liu@aspeedtech.com>,
  Cristian Birsan <cristian.birsan@microchip.com>, Bin Liu <b-liu@ti.com>,
  Kevin Cernekee <cernekee@gmail.com>, Justin Chen <justin.chen@broadcom.com>,
  Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
  Vladimir Zapolskiy <vz@mleia.com>, Daniel Mack <daniel@zonque.org>,
  Haojian Zhuang <haojian.zhuang@gmail.com>,
  Robert Jarzmik <robert.jarzmik@free.fr>,
  Philipp Zabel <p.zabel@pengutronix.de>,
  Herve Codina <herve.codina@bootlin.com>,
  hierry Reding <thierry.reding@gmail.com>,
  Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>,
  Rui Miguel Silva <rui.silva@linaro.org>,
  Valentina Manea <valentina.manea.m@gmail.com>,
  Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
  linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 01/10] usb: gadget: add anonymous definition in struct
 usb_gadget
Message-ID: <a735ee44-e030-4c58-a929-dc11292997bd@rowland.harvard.edu>
References: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
 <20230912104455.7737-2-quic_linyyuan@quicinc.com>
 <2023091255-unsubtly-daisy-7426@gregkh>
 <d1c34d15-e598-5f86-bc86-cd5e656225c9@quicinc.com>
 <ef99b328-926c-4696-83bf-9ccd6a38984e@rowland.harvard.edu>
 <be818ccf-96fd-2fa0-8f95-1f49e3aa2dfc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be818ccf-96fd-2fa0-8f95-1f49e3aa2dfc@quicinc.com>

On Thu, Sep 14, 2023 at 09:08:04AM +0800, Linyu Yuan wrote:
> 
> On 9/14/2023 12:02 AM, Alan Stern wrote:
> > On Wed, Sep 13, 2023 at 11:46:12AM +0800, Linyu Yuan wrote:
> > > but Alan Stern have one comment,   do it mean the bit position number is not
> > > expect and we can't use it ?
> > > 
> > > @Alan Stern ,  BIT(0), BIT(1) is not the member we expect ?
> > They might not be.  If you can avoid making this assumption, you should.
> 
> 
> i don't know if it is true or not, seem some driver expect there is no hole
> for this kind of bit field definition.

I didn't say there would be a hole; I said that BIT(0) might not be the 
member you expect.  For example, sg_supported might be BIT(31) instead 
of BIT(0).

> > > > This macro usage is a real mess.  Can't you find a better way to do it?
> > > > 
> > > > For instance, in the code that parses the trace buffer, define a
> > > > temporary usb_gadget structure and copy the dw1 field from the trace
> > > > buffer to the temporary structure.  Then you can access the fields in
> > > > that structure directly by their original names, with no macros.
> > > do it same idea just move it outside of gadget.h ?
> > Keep the anonymous union in gadget.h, but get rid of the macros.
> 
> 
> do you expect below ?
> 
> 
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -357,6 +357,7 @@ struct usb_gadget_ops {
>   * @in_epnum: last used in ep number
>   * @mA: last set mA value
>   * @otg_caps: OTG capabilities of this gadget.
> + * @dw1: trace event purpose
>   * @sg_supported: true if we can handle scatter-gather
>   * @is_otg: True if the USB device port uses a Mini-AB jack, so that the
>   *     gadget driver must provide a USB OTG descriptor.
> @@ -432,30 +433,88 @@ struct usb_gadget {
>         unsigned                        mA;
>         struct usb_otg_caps             *otg_caps;
> 
> -       unsigned                        sg_supported:1;
> -       unsigned                        is_otg:1;
> -       unsigned                        is_a_peripheral:1;
> -       unsigned                        b_hnp_enable:1;
> -       unsigned                        a_hnp_support:1;
> -       unsigned                        a_alt_hnp_support:1;
> -       unsigned                        hnp_polling_support:1;
> -       unsigned                        host_request_flag:1;
> -       unsigned quirk_ep_out_aligned_size:1;
> -       unsigned                        quirk_altset_not_supp:1;
> -       unsigned                        quirk_stall_not_supp:1;
> -       unsigned                        quirk_zlp_not_supp:1;
> -       unsigned quirk_avoids_skb_reserve:1;
> -       unsigned                        is_selfpowered:1;
> -       unsigned                        deactivated:1;
> -       unsigned                        connected:1;
> -       unsigned                        lpm_capable:1;
> -       unsigned                        wakeup_capable:1;
> -       unsigned                        wakeup_armed:1;
> +       union {
> +               struct {
> +                       unsigned        sg_supported:1;
> +                       unsigned        is_otg:1;
> +                       unsigned        is_a_peripheral:1;
> +                       unsigned        b_hnp_enable:1;
> +                       unsigned        a_hnp_support:1;
> +                       unsigned        a_alt_hnp_support:1;
> +                       unsigned        hnp_polling_support:1;
> +                       unsigned        host_request_flag:1;
> +                       unsigned quirk_ep_out_aligned_size:1;
> +                       unsigned        quirk_altset_not_supp:1;
> +                       unsigned        quirk_stall_not_supp:1;
> +                       unsigned        quirk_zlp_not_supp:1;
> +                       unsigned quirk_avoids_skb_reserve:1;
> +                       unsigned        is_selfpowered:1;
> +                       unsigned        deactivated:1;
> +                       unsigned        connected:1;
> +                       unsigned        lpm_capable:1;
> +                       unsigned        wakeup_capable:1;
> +                       unsigned        wakeup_armed:1;
> +               } __packed;
> +
> +               u32                     dw1;
> +       } __aligned(4);
>         int                             irq;
>         int                             id_number;
>  };
>  #define work_to_gadget(w)      (container_of((w), struct usb_gadget, work))

Stop here.  The above is what I expect.  Don't include any of the 
material below.

(BTW, you don't need the __aligned(4) thing, do you?  Since the union 
includes a 32-bit integer field, it will naturally be aligned on a 
4-byte boundary.)

> +#define USB_GADGET_BITFIELD(field)                             \
> +static inline u32 usb_gadget_bit_##field(u32 dw1)              \
> +{                                                              \
> +       union {                                                 \
> +               struct {                                        \
> +                       u32     sg_supported:1;                 \
> +                       u32     is_otg:1;                       \
> +                       u32     is_a_peripheral:1;              \
> +                       u32     b_hnp_enable:1;                 \
> +                       u32     a_hnp_support:1;                \
> +                       u32     a_alt_hnp_support:1;            \
> +                       u32     hnp_polling_support:1;          \
> +                       u32     host_request_flag:1;            \
> +                       u32     quirk_ep_out_aligned_size:1;    \
> +                       u32     quirk_altset_not_supp:1;        \
> +                       u32     quirk_stall_not_supp:1;         \
> +                       u32     quirk_zlp_not_supp:1;           \
> +                       u32     quirk_avoids_skb_reserve:1;     \
> +                       u32     is_selfpowered:1;               \
> +                       u32     deactivated:1;                  \
> +                       u32     connected:1;                    \
> +                       u32     lpm_capable:1;                  \
> +                       u32     wakeup_capable:1;               \
> +                       u32     wakeup_armed:1;                 \
> +               } __packed;                                     \
> +               u32             dw1;                            \
> +       } __aligned(4) u;                                       \
> +       BUILD_BUG_ON(sizeof(u) != 4);                           \
> +       u.dw1 = dw1;                                            \
> +       return u.field;                                         \
> +}
> +
> +USB_GADGET_BITFIELD(sg_supported)
> +USB_GADGET_BITFIELD(is_otg)
> +USB_GADGET_BITFIELD(is_a_peripheral)
> +USB_GADGET_BITFIELD(b_hnp_enable)
> +USB_GADGET_BITFIELD(a_hnp_support)
> +USB_GADGET_BITFIELD(a_alt_hnp_support)
> +USB_GADGET_BITFIELD(hnp_polling_support)
> +USB_GADGET_BITFIELD(host_request_flag)
> +USB_GADGET_BITFIELD(quirk_ep_out_aligned_size)
> +USB_GADGET_BITFIELD(quirk_altset_not_supp)
> +USB_GADGET_BITFIELD(quirk_stall_not_supp)
> +USB_GADGET_BITFIELD(quirk_zlp_not_supp)
> +USB_GADGET_BITFIELD(quirk_avoids_skb_reserve)
> +USB_GADGET_BITFIELD(is_selfpowered)
> +USB_GADGET_BITFIELD(deactivated)
> +USB_GADGET_BITFIELD(connected)
> +USB_GADGET_BITFIELD(lpm_capable)
> +USB_GADGET_BITFIELD(wakeup_capable)
> +USB_GADGET_BITFIELD(wakeup_armed)

So ignore all of that.

Now in your patch 4/10, do something that will have this effect:

+	struct usb_gadget g;
+
+	g.dw1 = __entry->dw1;
+
	TP_printk(....
-		__entry->sg_supported ? "sg:" : "",
+		g.sg_supported ? "sg:" : "",
...

You probably can't do it exactly this way, because this won't work with 
the tracing macros, but maybe something that is equivalent will work.

For example, you could try:

+#define USB_GADGET_BITFIELD(field)		\
+	({struct usb_gadget g;			\
+		g.dw1 = __entry->dw1;		\
+		g.field;})

	TP_printk(....
-		__entry->sg_supported ? "sg:" : "",
+		USB_GADGET_BITFIELD(sg_supported) ? "sg:" : "",

Do you get the idea now?

Alan Stern

