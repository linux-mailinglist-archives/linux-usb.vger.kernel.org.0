Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B723A732B
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 03:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbhFOBEw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 21:04:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48524 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhFOBEv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 21:04:51 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C53E4A3;
        Tue, 15 Jun 2021 03:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623718967;
        bh=6/LN0Z944bKryrwNUsg2yvioweDgSMUiM5QySL+xCBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XyEWzkUoasF2V0UEooSkqBzAWpK5VJAqzXY/9hj7Jbqx+iKAja9d4IBdaZG+LdDgq
         7icAICB8yc8HUlifiwEbolNAGq1nLRTy0JL9I2RtSD7kYftSQxuItuj6EE7dCLgYWT
         XV/DYAA1FOgEnBgLFBvowlKTuf26WaKSnZVD8G4A=
Date:   Tue, 15 Jun 2021 04:02:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/3] usb: gadget: uvc: move structs to common header
Message-ID: <YMf8I0hNXYbjQJrL@pendragon.ideasonboard.com>
References: <20210530222239.8793-1-m.grzeschik@pengutronix.de>
 <20210530222239.8793-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210530222239.8793-2-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Mon, May 31, 2021 at 12:22:37AM +0200, Michael Grzeschik wrote:
> The functions and structs of the configfs interface should also be used
> by the uvc gadget driver. This patch prepares the stack by moving the
> common structs and functions to the common header file.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 111 -------------------
>  drivers/usb/gadget/function/uvc_configfs.h | 119 +++++++++++++++++++++
>  2 files changed, 119 insertions(+), 111 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 77d64031aa9c2..86463bb2639ed 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -19,8 +19,6 @@
>   * Global Utility Structures and Macros
>   */
>  
> -#define UVCG_STREAMING_CONTROL_SIZE	1
> -
>  #define UVC_ATTR(prefix, cname, aname) \
>  static struct configfs_attribute prefix##attr_##cname = { \
>  	.ca_name	= __stringify(aname),				\
> @@ -49,12 +47,6 @@ static int uvcg_config_compare_u32(const void *l, const void *r)
>  	return li < ri ? -1 : li == ri ? 0 : 1;
>  }
>  
> -static inline struct f_uvc_opts *to_f_uvc_opts(struct config_item *item)
> -{
> -	return container_of(to_config_group(item), struct f_uvc_opts,
> -			    func_inst.group);
> -}
> -
>  struct uvcg_config_group_type {
>  	struct config_item_type type;
>  	const char *name;
> @@ -125,19 +117,6 @@ static void uvcg_config_remove_children(struct config_group *group)
>   * control/header
>   */
>  
> -DECLARE_UVC_HEADER_DESCRIPTOR(1);
> -
> -struct uvcg_control_header {
> -	struct config_item		item;
> -	struct UVC_HEADER_DESCRIPTOR(1)	desc;
> -	unsigned			linked;
> -};
> -
> -static struct uvcg_control_header *to_uvcg_control_header(struct config_item *item)
> -{
> -	return container_of(item, struct uvcg_control_header, item);
> -}
> -
>  #define UVCG_CTRL_HDR_ATTR(cname, aname, bits, limit)			\
>  static ssize_t uvcg_control_header_##cname##_show(			\
>  	struct config_item *item, char *page)				\
> @@ -764,29 +743,6 @@ static const struct uvcg_config_group_type uvcg_control_grp_type = {
>   * streaming/mjpeg
>   */
>  
> -static const char * const uvcg_format_names[] = {
> -	"uncompressed",
> -	"mjpeg",
> -};
> -
> -enum uvcg_format_type {
> -	UVCG_UNCOMPRESSED = 0,
> -	UVCG_MJPEG,
> -};
> -
> -struct uvcg_format {
> -	struct config_group	group;
> -	enum uvcg_format_type	type;
> -	unsigned		linked;
> -	unsigned		num_frames;
> -	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
> -};
> -
> -static struct uvcg_format *to_uvcg_format(struct config_item *item)
> -{
> -	return container_of(to_config_group(item), struct uvcg_format, group);
> -}
> -
>  static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
>  {
>  	struct f_uvc_opts *opts;
> @@ -845,29 +801,11 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
>  	return ret;
>  }
>  
> -struct uvcg_format_ptr {
> -	struct uvcg_format	*fmt;
> -	struct list_head	entry;
> -};
> -
>  /* -----------------------------------------------------------------------------
>   * streaming/header/<NAME>
>   * streaming/header
>   */
>  
> -struct uvcg_streaming_header {
> -	struct config_item				item;
> -	struct uvc_input_header_descriptor		desc;
> -	unsigned					linked;
> -	struct list_head				formats;
> -	unsigned					num_fmt;
> -};
> -
> -static struct uvcg_streaming_header *to_uvcg_streaming_header(struct config_item *item)
> -{
> -	return container_of(item, struct uvcg_streaming_header, item);
> -}
> -
>  static void uvcg_format_set_indices(struct config_group *fmt);
>  
>  static int uvcg_streaming_header_allow_link(struct config_item *src,
> @@ -1059,31 +997,6 @@ static const struct uvcg_config_group_type uvcg_streaming_header_grp_type = {
>   * streaming/<mode>/<format>/<NAME>
>   */
>  
> -struct uvcg_frame {
> -	struct config_item	item;
> -	enum uvcg_format_type	fmt_type;
> -	struct {
> -		u8	b_length;
> -		u8	b_descriptor_type;
> -		u8	b_descriptor_subtype;
> -		u8	b_frame_index;
> -		u8	bm_capabilities;
> -		u16	w_width;
> -		u16	w_height;
> -		u32	dw_min_bit_rate;
> -		u32	dw_max_bit_rate;
> -		u32	dw_max_video_frame_buffer_size;
> -		u32	dw_default_frame_interval;
> -		u8	b_frame_interval_type;
> -	} __attribute__((packed)) frame;
> -	u32 *dw_frame_interval;
> -};
> -
> -static struct uvcg_frame *to_uvcg_frame(struct config_item *item)
> -{
> -	return container_of(item, struct uvcg_frame, item);
> -}
> -
>  #define UVCG_FRAME_ATTR(cname, aname, bits) \
>  static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
>  {									\
> @@ -1420,18 +1333,6 @@ static void uvcg_format_set_indices(struct config_group *fmt)
>   * streaming/uncompressed/<NAME>
>   */
>  
> -struct uvcg_uncompressed {
> -	struct uvcg_format		fmt;
> -	struct uvc_format_uncompressed	desc;
> -};
> -
> -static struct uvcg_uncompressed *to_uvcg_uncompressed(struct config_item *item)
> -{
> -	return container_of(
> -		container_of(to_config_group(item), struct uvcg_format, group),
> -		struct uvcg_uncompressed, fmt);
> -}
> -
>  static struct configfs_group_operations uvcg_uncompressed_group_ops = {
>  	.make_item		= uvcg_frame_make,
>  	.drop_item		= uvcg_frame_drop,
> @@ -1669,18 +1570,6 @@ static const struct uvcg_config_group_type uvcg_uncompressed_grp_type = {
>   * streaming/mjpeg/<NAME>
>   */
>  
> -struct uvcg_mjpeg {
> -	struct uvcg_format		fmt;
> -	struct uvc_format_mjpeg		desc;
> -};
> -
> -static struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
> -{
> -	return container_of(
> -		container_of(to_config_group(item), struct uvcg_format, group),
> -		struct uvcg_mjpeg, fmt);
> -}
> -
>  static struct configfs_group_operations uvcg_mjpeg_group_ops = {
>  	.make_item		= uvcg_frame_make,
>  	.drop_item		= uvcg_frame_drop,
> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
> index 7e1d7ca29bf21..f905d29570eb4 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.h
> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> @@ -16,4 +16,123 @@ struct f_uvc_opts;
>  
>  int uvcg_attach_configfs(struct f_uvc_opts *opts);

Function declarations are traditionally placed after structure
definitions, I would thus move this line to the end of the file.

>  
> +static inline struct f_uvc_opts *to_f_uvc_opts(struct config_item *item)

Headers should be self-contained as much as possible. This means that
you need forward declarations and/or #include statements corresponding
to the structure and functions used herein. A very simple way to test
this is to apply the following change:

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index cd28dec837dd..5303b790911b 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -10,10 +10,11 @@
  * Author: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
  */

+#include "uvc_configfs.h"
+
 #include <linux/sort.h>

 #include "u_uvc.h"
-#include "uvc_configfs.h"

 /* -----------------------------------------------------------------------------
  * Global Utility Structures and Macros

Compilation will fail if uvc_configfs.h isn't self-contained. Feel free
to squash the above diff in this patch.

> +{
> +	return container_of(to_config_group(item), struct f_uvc_opts,
> +			    func_inst.group);
> +}
> +
> +#define UVCG_STREAMING_CONTROL_SIZE	1
> +
> +DECLARE_UVC_HEADER_DESCRIPTOR(1);
> +
> +struct uvcg_control_header {
> +	struct config_item		item;
> +	struct UVC_HEADER_DESCRIPTOR(1)	desc;
> +	unsigned			linked;
> +};
> +
> +static inline struct uvcg_control_header *to_uvcg_control_header(struct config_item *item)
> +{
> +	return container_of(item, struct uvcg_control_header, item);
> +}
> +
> +static const char * const uvcg_format_names[] = {
> +	"uncompressed",
> +	"mjpeg",
> +};
> +
> +enum uvcg_format_type {
> +	UVCG_UNCOMPRESSED = 0,
> +	UVCG_MJPEG,
> +};
> +
> +struct uvcg_format {
> +	struct config_group	group;
> +	enum uvcg_format_type	type;
> +	unsigned		linked;
> +	unsigned		num_frames;
> +	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
> +};
> +
> +struct uvcg_format_ptr {
> +	struct uvcg_format	*fmt;
> +	struct list_head	entry;
> +};
> +
> +static inline struct uvcg_format *to_uvcg_format(struct config_item *item)
> +{
> +	return container_of(to_config_group(item), struct uvcg_format, group);
> +}
> +
> +struct uvcg_streaming_header {
> +	struct config_item				item;
> +	struct uvc_input_header_descriptor		desc;
> +	unsigned					linked;
> +	struct list_head				formats;
> +	unsigned					num_fmt;
> +};
> +
> +static inline struct uvcg_streaming_header *to_uvcg_streaming_header(struct config_item *item)
> +{
> +	return container_of(item, struct uvcg_streaming_header, item);
> +}
> +
> +struct uvcg_frame {
> +	struct config_item	item;
> +	enum uvcg_format_type	fmt_type;
> +	struct {
> +		u8	b_length;
> +		u8	b_descriptor_type;
> +		u8	b_descriptor_subtype;
> +		u8	b_frame_index;
> +		u8	bm_capabilities;
> +		u16	w_width;
> +		u16	w_height;
> +		u32	dw_min_bit_rate;
> +		u32	dw_max_bit_rate;
> +		u32	dw_max_video_frame_buffer_size;
> +		u32	dw_default_frame_interval;
> +		u8	b_frame_interval_type;
> +	} __attribute__((packed)) frame;
> +	u32 *dw_frame_interval;
> +};
> +
> +static inline struct uvcg_frame *to_uvcg_frame(struct config_item *item)
> +{
> +	return container_of(item, struct uvcg_frame, item);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * streaming/uncompressed/<NAME>
> + */
> +
> +struct uvcg_uncompressed {
> +	struct uvcg_format		fmt;
> +	struct uvc_format_uncompressed	desc;
> +};
> +
> +static inline struct uvcg_uncompressed *to_uvcg_uncompressed(struct config_item *item)
> +{
> +	return container_of(
> +		container_of(to_config_group(item), struct uvcg_format, group),
> +		struct uvcg_uncompressed, fmt);

While at it, how about writing this

	return container_of(to_uvcg_format(item), struct uvcg_uncompressed, fmt);

?

> +}
> +
> +/* -----------------------------------------------------------------------------
> + * streaming/mjpeg/<NAME>
> + */
> +
> +struct uvcg_mjpeg {
> +	struct uvcg_format		fmt;
> +	struct uvc_format_mjpeg		desc;
> +};
> +
> +static inline struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
> +{
> +	return container_of(
> +		container_of(to_config_group(item), struct uvcg_format, group),
> +		struct uvcg_mjpeg, fmt);

Same here with

	return container_of(to_uvcg_format(item), struct uvcg_mjpeg, fmt);

With these issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  #endif /* UVC_CONFIGFS_H */

-- 
Regards,

Laurent Pinchart
