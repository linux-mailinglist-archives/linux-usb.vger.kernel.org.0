Return-Path: <linux-usb+bounces-1979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AAA7D0FE7
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 14:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7049E2812D6
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 12:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BCC18C01;
	Fri, 20 Oct 2023 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8BB8F5A
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 12:49:42 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F898D49
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 05:49:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1qtowT-0003Wg-81; Fri, 20 Oct 2023 14:49:29 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qtowS-0031wM-19; Fri, 20 Oct 2023 14:49:28 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qtowR-001j55-Nc; Fri, 20 Oct 2023 14:49:27 +0200
Date: Fri, 20 Oct 2023 14:49:27 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Jayant Chowdhary <jchowdhary@google.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"etalvala@google.com" <etalvala@google.com>,
	"arakesh@google.com" <arakesh@google.com>
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Message-ID: <ZTJ3V/laVTGNctgg@pengutronix.de>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
 <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
 <ZS/dmTjdCCdnelVP@pengutronix.de>
 <ZTG4l49nrA5NeYr5@pengutronix.de>
 <c4743c5f-d365-4829-b5a1-46c0daceba1e@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qcd8xLkNcpSy2XEb"
Content-Disposition: inline
In-Reply-To: <c4743c5f-d365-4829-b5a1-46c0daceba1e@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--Qcd8xLkNcpSy2XEb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 10:52:11PM -0700, Jayant Chowdhary wrote:
>On 10/19/23 16:15, Michael Grzeschik wrote:
>> On Wed, Oct 18, 2023 at 03:28:57PM +0200, Michael Grzeschik wrote:
>>> On Sun, Oct 15, 2023 at 09:33:43PM -0700, Jayant Chowdhary wrote:
>>>> On 10/12/23 11:50, Thinh Nguyen wrote:
>>>>> On Mon, Oct 09, 2023, Jayant Chowdhary wrote:
>>>>>>> On Fri, Oct 06, 2023 at 03:03:56PM -0700, Jayant Chowdhary wrote:
>>>>>>>> We had been seeing the UVC gadget driver receive isoc errors while
>>>>>>>> sending packets to the usb endpoint - resulting in glitches being =
shown
>>>>>>>> on linux hosts. My colleague Avichal Rakesh and others had a very
>>>>>>>> enlightening discussion at
>>>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/8741=
b7cb-54ec-410b-caf5-697f81e8ad64@google.com/T/__;!!A4F2R9G_pg!e3zVZGt-6Td6H=
JXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gQ73n_-Y$
>>>>>>>>
>>>>>>>>
>>>>>>>> The conclusion that we came to was : usb requests with actual uvc =
frame
>>>>>>>> data were missing their scheduled uframes in the usb controller. A=
s a
>>>>>>>> mitigation, we started sending 0 length usb requests when there wa=
s no
>>>>>>>> uvc frame buffer available to get data from. Even with this mitiga=
tion,
>>>>>>>> we are seeing glitches - albeit at a lower frequency.
>>>>>>>>
>>>>>>>> After some investigation, it is seen that we=E2=80=99re getting is=
oc errors when
>>>>>>>> the worker thread serving video_pump() work items, doesn=E2=80=99t=
 get scheduled
>>>>>>>> for longer periods of time - than usual - in most cases > 6ms.
>>>>>>>> This is close enough to the 8ms limit that we have when the number=
 of usb
>>>>>>>> requests in the queue is 64 (since we have a 125us uframe period).=
 In order
>>>>>>>> to tolerate the scheduling delays better, it helps to increase the=
 number of
>>>>>>>> usb requests in the queue . In that case, we have more 0 length re=
quests
>>>>>>>> given to the udc driver - and as a result we can wait longer for u=
vc
>>>>>>>> frames with valid data to get processed by video_pump(). I=E2=80=
=99m attaching a
>>>>>>>> patch which lets one configure the upper bound on the number of usb
>>>>>>>> requests allocated through configfs. Please let me know your thoug=
hts.
>>>>>>>> I can formalize=C2=A0 the patch if it looks okay.
>>>>>>> Why do you want to limit the upper bound?=C2=A0 Why not just not su=
bmit so
>>>>>>> many requests from userspace as you control that, right?
>>>>>>
>>>>>> Userspace negotiates a video frame rate (typically 30/60fps) with th=
e host that does
>>>>>> not necessarily correspond to the ISOC cadence. After the
>>>>>> patch at https://urldefense.com/v3/__https://lkml.org/lkml/diff/2023=
/5/8/1115/1__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vd=
kwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gWbb9bvy$=C2=A0 was submitted, we are
>>>>>> maintaining back pressure on the usb controller even if we do not ha=
ve uvc frame
>>>>>> data, by sending the controller 0 length requests (as long as usb_re=
quests are
>>>>>> available). Also, even if the userspace application were to somehow =
produce
>>>>>> data to match the ISOC rate, it would=C2=A0 need to have information=
 about USB
>>>>>> timing details - which I am not sure is available to userspace or is=
 the right
>>>>>> thing to do here ?
>>>>>>
>>>>>> Here, we are trying to handle the scenario in which the video_pump()=
 worker
>>>>>> thread does not get scheduled in time - by increasing the number of =
usb requests
>>>>>> allocated in the queue. This would send more usb requests to the usb=
 controller,
>>>>>> when video_pump() does get scheduled - even if they're 0 length. Thi=
s buys
>>>>>> the video_pump() worker thread scheduling time -since more usb reque=
sts
>>>>>> are with the controller, subsequent requests sent will not be 'stale=
' and
>>>>>> dropped by the usb controller.
>>>>>>
>>>>> I believe you're testing against dwc3 controller right? I may not be =
as
>>>>> familiar with UVC function driver, but based on the previous
>>>>> discussions, I think the driver should be able to handle this without
>>>>> the user input.
>>>>
>>>> Yes we are testing against the dwc3 controller.
>>>>
>>>>>
>>>>> The frequency of the request submission should not depend on the
>>>>> video_pump() work thread since it can vary. The frequency of request
>>>>> submission should match with the request completion. We know that
>>>>> request completion rate should be fixed (1 uframe/request + when you
>>>>> don't set no_interrupt). Base on this you can do your calculation on =
how
>>>>> often you should set no_interrupt and how many requests you must subm=
it.
>>>>> You don't have to wait for the video_pump() to submit 0-length reques=
ts.
>>>>>
>>>>> The only variable here is the completion handler delay or system
>>>>> latency, which should not be much and should be within your calculati=
on.
>>>>
>>>>
>>>> Thanks for the suggestion. It indeed makes sense that we do not comple=
tely depend on
>>>> video_pump() for sending 0 length requests. I was concerned about
>>>> synchronization needed when we send requests to the dwc3 controller fr=
om
>>>> different threads. I see that the dwc3 controller code does internally=
 serialize
>>>> queueing requests, can we expect this from other controllers as well ?
>>>>
>>>> This brings me to another question for Michael - I see
>>>> that we introduced a worker thread for pumping=C2=A0 usb requests to t=
he usb endpoint
>>>> in https://lore.kernel.org/all/20200427151614.10868-1-m.grzeschik@peng=
utronix.de/
>>>> (I see multiple email addresses, so apologies if I used the incorrect =
one).
>>>>
>>>> Did we introduce the worker thread to solve some specific deadlock sce=
narios ?
>>>
>>> Exactly. This was the reason why we moved to the pump worker. I actually
>>> looked into the host side implementation of the uvc driver. There we
>>> also queue an worker from the complete function:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/media/usb/uvc/uvc_video.c#n1646
>>>
>>> So this sounded reasonable to me. However we faced similar issues like
>>> you and introduced different ways to improve the latency issue.
>>>
>>> One thing we did was improving the latency by adding WQ_HIGHPRI
>>>
>>> https://lore.kernel.org/linux-usb/20220907215818.2670097-1-m.grzeschik@=
pengutronix.de/
>>>
>>> Another patch here is also adding WQ_CPU_INTENSIVE.
>>>
>>> But, after all the input from Thinh it is probably better to solve the
>>> issue in a more reliable way.
>>>
>>>> Or was it a general mitigation against racy usb request submission fro=
m v4l2 buffer
>>>> queuing, stream enable and the video complete handler firing ?
>>>
>>> I don't remember all of the issues we saw back then. But this is also a=
n very
>>> likely scenario.
>>>
>>>> I was chatting with Avi about this, what if we submit requests to the =
endpoint
>>>> only at two points in the streaming lifecycle -
>>>> 1) The whole 64 (or however many usb requests are allocated) when
>>>> =C2=A0uvcg_video_enable() is called - with 0 length usb_requests.
>>>> 2) In the video complete handler - if a video buffer is available, we =
encode it
>>>> =C2=A0and submit it to the endpoint. If not, we send a 0 length reques=
t.
>>>
>>> It really sounds like a good idea.
>>>
>>>> This way we're really maintaining back pressure and sending requests a=
s soon
>>>> as we can to the dwc3 controller. Encoding is mostly memcpys from what=
 I see
>>>> so hopefully not too heavy on the interrupt handler. I will work on pr=
ototyping
>>>> this meanwhile.
>>
>> [1] https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@go=
ogle.com/T/#t
>>
>> It was actually not that hard to do that.
>> With the patches from this thread applied [1] , the unformal changes loo=
ks like this:
>>
>> #change 1
>>
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget=
/function/uvc_v4l2.c
>> index f64d03136c5665..29cd23c38eb99d 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -626,8 +626,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4=
l2_buffer *b)
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0
>> -=C2=A0=C2=A0=C2=A0 if (uvc->state =3D=3D UVC_STATE_STREAMING)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 queue_work(video->async_wq, =
&video->pump);
>> +=C2=A0=C2=A0=C2=A0 uvcg_video_pump(video);
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0}
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadge=
t/function/uvc_video.c
>> index 2ec51ed5e9d074..2fe800500c88a3 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -329,7 +329,9 @@ uvc_video_complete(struct usb_ep *ep, struct usb_req=
uest *req)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (video->is_enabled) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_add_tail(&req->lis=
t, &video->req_free);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 queue_work(video->async_wq, =
&video->pump);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&vide=
o->req_lock, flags);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uvcg_video_pump(video);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uvc_video_free_request(=
ureq, ep);
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> @@ -413,9 +415,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
>> =C2=A0 * This function fills the available USB requests (listed in req_f=
ree) with
>> =C2=A0 * video data from the queued buffers.
>> =C2=A0 */
>> -static void uvcg_video_pump(struct work_struct *work)
>> +int uvcg_video_pump(struct uvc_video *video)
>> =C2=A0{
>> -=C2=A0=C2=A0=C2=A0 struct uvc_video *video =3D container_of(work, struc=
t uvc_video, pump);
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct uvc_video_queue *queue =3D &video->queue;
>> =C2=A0=C2=A0=C2=A0=C2=A0 /* video->max_payload_size is only set when usi=
ng bulk transfer */
>> =C2=A0=C2=A0=C2=A0=C2=A0 bool is_bulk =3D video->max_payload_size;
>> @@ -427,7 +428,7 @@ static void uvcg_video_pump(struct work_struct *work)
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 while(true) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!video->ep->enabled)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn 0;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Check is_enable=
d and retrieve the first available USB
>> @@ -436,7 +437,7 @@ static void uvcg_video_pump(struct work_struct *work)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&vide=
o->req_lock, flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!video->is_enabled =
|| list_empty(&video->req_free)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 spin_unlock_irqrestore(&video->req_lock, flags);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn -EBUSY;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req =3D list_first_entr=
y(&video->req_free, struct usb_request,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list);
>> @@ -513,7 +514,7 @@ static void uvcg_video_pump(struct work_struct *work)
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (!req)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&video->req_lock, flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (video->is_enabled)
>> @@ -521,6 +522,8 @@ static void uvcg_video_pump(struct work_struct *work)
>> =C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uvc_video_free_request(=
req->context, video->ep);
>> =C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&video->req_lock, flags);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0}
>> =C2=A0
>> =C2=A0/*
>> @@ -554,7 +557,6 @@ uvcg_video_disable(struct uvc_video *video)
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&video->req_lock, flags);
>> =C2=A0
>> -=C2=A0=C2=A0=C2=A0 cancel_work_sync(&video->pump);
>> =C2=A0=C2=A0=C2=A0=C2=A0 uvcg_queue_cancel(&video->queue, 0);
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&video->req_lock, flags);
>> @@ -635,8 +637,6 @@ int uvcg_video_enable(struct uvc_video *video, int e=
nable)
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 video->req_int_count =3D 0;
>> =C2=A0
>> -=C2=A0=C2=A0=C2=A0 queue_work(video->async_wq, &video->pump);
>> -
>> =C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0}
>> =C2=A0
>> @@ -649,12 +649,6 @@ int uvcg_video_init(struct uvc_video *video, struct=
 uvc_device *uvc)
>> =C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&video->ureqs);
>> =C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&video->req_free);
>> =C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_init(&video->req_lock);
>> -=C2=A0=C2=A0=C2=A0 INIT_WORK(&video->pump, uvcg_video_pump);
>> -
>> -=C2=A0=C2=A0=C2=A0 /* Allocate a work queue for asynchronous video pump=
 handler. */
>> -=C2=A0=C2=A0=C2=A0 video->async_wq =3D alloc_workqueue("uvcgadget", WQ_=
UNBOUND | WQ_HIGHPRI | WQ_CPU_INTENSIVE, 0);
>> -=C2=A0=C2=A0=C2=A0 if (!video->async_wq)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 video->uvc =3D uvc;
>> =C2=A0
>> diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadge=
t/function/uvc_video.h
>> index 03adeefa343b71..322b05da43965f 100644
>> --- a/drivers/usb/gadget/function/uvc_video.h
>> +++ b/drivers/usb/gadget/function/uvc_video.h
>> @@ -16,6 +16,8 @@ struct uvc_video;
>> =C2=A0
>> =C2=A0int uvcg_video_enable(struct uvc_video *video, int enable);
>> =C2=A0
>> +int uvcg_video_pump(struct uvc_video *video);
>> +
>> =C2=A0int uvcg_video_init(struct uvc_video *video, struct uvc_device *uv=
c);
>> =C2=A0
>> =C2=A0#endif /* __UVC_VIDEO_H__ */
>>
>>
>
>Thank you for this. I made some slight modifications (nothing functional)
>and applied this. I'm actually seeing that the flickers completely disappe=
ar
>on the device that I'm testing.
>
>From around a flicker every couple of minutes to none in 20 minutes. What =
I did
>keep was the 0 length request submission, since the camera is naturally pr=
oducing
>data at a much lower rate than what the usb controller expects. Is there a=
 reason we would
>want to remove that code ?

There is no need to remove this. I was just currious, if this would
change anything for the tests.

>> #change 2
>>
>> Also if you would like to revert the zero request generation apply this =
ontop.
>>
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadge=
t/function/uvc_video.c
>> index 82695a2ff39aa3..2a3c87079c548d 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -418,12 +418,9 @@ uvc_video_alloc_requests(struct uvc_video *video)
>> =C2=A0int uvcg_video_pump(struct uvc_video *video)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct uvc_video_queue *queue =3D &video->queue;
>> -=C2=A0=C2=A0=C2=A0 /* video->max_payload_size is only set when using bu=
lk transfer */
>> -=C2=A0=C2=A0=C2=A0 bool is_bulk =3D video->max_payload_size;
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct usb_request *req =3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct uvc_buffer *buf;
>> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;
>> -=C2=A0=C2=A0=C2=A0 bool buf_done;
>> =C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 while(true) {
>> @@ -450,28 +447,13 @@ int uvcg_video_pump(struct uvc_video *video)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&queu=
e->irqlock, flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D uvcg_queue_head=
(queue);
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (buf !=3D NULL) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vide=
o->encode(req, video, buf);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf_=
done =3D buf->state =3D=3D UVC_BUF_STATE_DONE;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (!(queue->flags & =
UVC_QUEUE_DISCONNECTED) && !is_bulk) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * No video buffer available; the queue is still connected and
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * we're transferring over ISOC. Queue a 0 length request to
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * prevent missed ISOC transfers.
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req-=
>length =3D 0;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf_=
done =3D false;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * Either the queue has been disconnected or no video buffer
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * available for bulk transfer. Either way, stop processing
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * further.
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (buf =3D=3D NULL) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 spin_unlock_irqrestore(&queue->irqlock, flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video->encode(req, video, bu=
f);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * With USB3 handl=
ing more requests at a higher speed, we can't
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * afford to gener=
ate an interrupt for every request. Decide to
>> @@ -490,7 +472,8 @@ int uvcg_video_pump(struct uvc_video *video)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 ind=
icated by video->uvc_num_requests), as a trade-off
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 bet=
ween latency and interrupt load.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (list_empty(&video->req_f=
ree) || buf_done ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (list_empty(&video->req_f=
ree) ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf-=
>state =3D=3D UVC_BUF_STATE_DONE ||
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 !(video->req_int_count %
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(video->uvc_num_requests, 4))) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 video->req_int_count =3D 0;
>> @@ -510,7 +493,8 @@ int uvcg_video_pump(struct uvc_video *video)
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Endpoint now owns th=
e request */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req =3D NULL;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video->req_int_count++;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if(buf->state !=3D UVC_BUF_S=
TATE_DONE)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vide=
o->req_int_count++;
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (!req)
>>
>>
>> In my case this did not change a lot with the flickering.
>>
>> In fact I did see the most effective change when increasing the
>> fifo size in the dwc3 controller like this in drivers/usb/dwc3/gadget.c
>>
>> -813=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fifo =3D dwc3_gadge=
t_calc_tx_fifo_size(dwc, 1);
>> +813=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fifo =3D dwc3_gadge=
t_calc_tx_fifo_size(dwc, 3);
>>
>> My system I am testing against is stressed with a high memory bandwidth
>> use. So it is possible that in this scenario the hardware fifo will not
>> get filled fast enough. Thus, changing the fifo size helps here. It is
>> still just a string to pull on but I think it is worth to dig a bit
>> deeper here.
>>
>> I am not sure if you are already aware of the following discussion:
>>
>> https://lore.kernel.org/all/ZPo51EUtBgH+qw44@pengutronix.de/T/
>
>Thank you for this. I wasn't aware of this thread, I will give it a read!

Thanks. I would be happy about some help.

>To confirm, should I still put up a patch for removing the video_pump() wo=
rker
>thread or are you planning on doing that ?

I don't mind. If you have the capacity to send this; feel free to do
this. Otherwise I could send the cleaned version from above and credit
you with an Suggested-By.

Regards,
Michael


--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Qcd8xLkNcpSy2XEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUyd1QACgkQC+njFXoe
LGR/qQ/8DkjX0jyVgZ9zk0TjaOfFaqs4NatHQ8hbGLbe5b3Wp7oG+HBv2SRIFcqd
y9lT0y2FjpZc5IjmERdIQv76oFFK02QdBxNR6xMKrqTg/0IKALSeBzS567LI5JqB
ykhR1OPJ+5XCQXLEyTlqiK1tG38GUmmwJGu8/cRV3bo1/keNqhb2km4QIGiW4uir
V9H3abQhnkFF8vWc/gRTP/0TM9CCppAXsITedgbC6KNqfyjJOYoFzypGbABH5EI+
RoxC9gwb3QByGCZ3fV7EpUbwkNdDPrmEu7yAg6rPlwoD50jvhmhM5a2SrsFQEBUf
/0AyHBPfUDZ/vzeIysVbiYL28sFjyS+OcRATDgVGztn9GwOkLQINRnExYVqvFget
mrQcnvI+a1Ai9eIqvNWoiTsZLinyNT0Sjw6bmZkdg8cZpq9N7a8t6Q2A/D8N7Itg
zoQdHLF1PZrH+mjwccUWNIVC2xyYUT6eZfAmzwTZGJLJM68gJYdfRu6U7B4BriRf
Z00Mro11gag4bjPsYwPCNgsU1vqItPzIMlL38o+fMdxkItfMRaePzNu9+C8mFq7w
vwd4HI7aQJig81wMPyxarz92vqPFhFo1w6lRaq9atCvREtk+LEmsFOXGYWDaRRlC
5RXn7y2A1huzRFU6m911dJMdp88iBJduTl4VRy5iOAh9t8+AYBo=
=aquG
-----END PGP SIGNATURE-----

--Qcd8xLkNcpSy2XEb--

